// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future printParentBucks(
    int? denomination, String? kidName, String? theme) async {
  final value = denomination ?? 1;
  final name = (kidName ?? '').trim();
  final t = theme ?? 'Classic';
  final palette = <String, List<int>>{
    'Classic': [0xFF2E7D32, 0xFFE8F5E9, 0xFFFFB938],
    'Space': [0xFF1B2A6B, 0xFFE8EDFF, 0xFFFFB938],
    'Jungle': [0xFF1E6B4E, 0xFFE3F8F2, 0xFFFF6B5E],
    'Candy': [0xFFD6336C, 0xFFFFE6EF, 0xFF3A5BE8],
  };
  final colors = palette[t] ?? palette['Classic']!;
  final main = PdfColor.fromInt(colors[0]);
  final light = PdfColor.fromInt(colors[1]);
  final accent = PdfColor.fromInt(colors[2]);

  pw.Widget bill() => pw.Container(
        margin: const pw.EdgeInsets.all(6),
        padding: const pw.EdgeInsets.all(10),
        decoration: pw.BoxDecoration(
          color: light,
          border: pw.Border.all(color: main, width: 3),
          borderRadius: pw.BorderRadius.circular(10),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('$value',
                    style: pw.TextStyle(
                        fontSize: 26,
                        fontWeight: pw.FontWeight.bold,
                        color: main)),
                pw.Text('PARENT BUCKS',
                    style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        color: main)),
                pw.Text('$value',
                    style: pw.TextStyle(
                        fontSize: 26,
                        fontWeight: pw.FontWeight.bold,
                        color: main)),
              ],
            ),
            pw.SizedBox(height: 6),
            pw.Center(
              child: pw.Container(
                width: 70,
                height: 70,
                decoration:
                    pw.BoxDecoration(color: accent, shape: pw.BoxShape.circle),
                alignment: pw.Alignment.center,
                child: pw.Text('CQ',
                    style: pw.TextStyle(
                        fontSize: 26,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.white)),
              ),
            ),
            pw.SizedBox(height: 6),
            pw.Center(
              child: pw.Text(
                name.isEmpty ? 'ChoreQuest Family Currency' : 'Issued to $name',
                style: pw.TextStyle(fontSize: 12, color: main),
              ),
            ),
            pw.Center(
              child: pw.Text('$t edition - no cash value',
                  style: const pw.TextStyle(fontSize: 8)),
            ),
          ],
        ),
      );

  final doc = pw.Document();
  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.letter,
      margin: const pw.EdgeInsets.all(24),
      build: (context) => pw.Column(
        children: List.generate(
          3,
          (_) => pw.Expanded(
            child: pw.Row(children: [
              pw.Expanded(child: bill()),
              pw.Expanded(child: bill())
            ]),
          ),
        ),
      ),
    ),
  );
  await Printing.layoutPdf(
    name: 'parent-bucks-$value',
    onLayout: (format) async => doc.save(),
  );
}
