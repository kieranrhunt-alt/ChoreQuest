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

import 'dart:math' as math;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future printSquishieBucks(
  int? denomination,
  String? kidName,
  String? theme,
  String? motto,
  String? emblem,
  int? perSheet,
  String? border,
) async {
  final value = denomination ?? 1;
  final name = (kidName ?? '').trim();
  final t = theme ?? 'Classic';
  final note = (motto ?? '').trim();
  final mark = emblem ?? 'squishie';
  final count = const [4, 6, 8, 10].contains(perSheet) ? perSheet! : 6;
  final edge = border ?? 'solid';

  // main ink, paper, accent, edition name
  final palette = <String, List<Object>>{
    'Classic': [0xFF2E7D32, 0xFFE8F5E9, 0xFFFFB938, 'Royal Green'],
    'Space': [0xFF1B2A6B, 0xFFE8EDFF, 0xFFFFB938, 'Midnight Knight'],
    'Jungle': [0xFF1E6B4E, 0xFFE3F8F2, 0xFFFF6B5E, 'Dragon Forest'],
    'Candy': [0xFFD6336C, 0xFFFFE6EF, 0xFF3A5BE8, 'Princess Rose'],
    'Bubblegum': [0xFFB0306E, 0xFFFFE3F1, 0xFFFF9ECF, 'Bubblegum Squishie'],
    'Grape': [0xFF5B2DB8, 0xFFF0E8FF, 0xFFB79CFF, 'Grape Jelly'],
    'Mint': [0xFF17795A, 0xFFE0FAF0, 0xFF7FE0B8, 'Minty Jelly'],
    'Ocean': [0xFF1D5F9E, 0xFFE2F2FF, 0xFF8FD3FF, 'Ocean Bubble'],
    'Gold': [0xFF8A5A00, 0xFFFFF6D6, 0xFFF2B53A, 'Royal Treasure'],
    'Holiday': [0xFFB3202F, 0xFFF1FBF3, 0xFF2FA05A, 'Holly Jolly'],
    'Spooky': [0xFF4A2380, 0xFFFFF1E2, 0xFFFF8C2E, 'Pumpkin Night'],
  };
  final p = palette[t] ?? palette['Classic']!;
  final main = PdfColor.fromInt(p[0] as int);
  final light = PdfColor.fromInt(p[1] as int);
  final accent = PdfColor.fromInt(p[2] as int);
  final edition = p[3] as String;

  pw.Font? bold;
  pw.Font? regular;
  try {
    bold = await PdfGoogleFonts.snigletExtraBold();
    regular = await PdfGoogleFonts.snigletRegular();
  } catch (_) {}
  pw.TextStyle st(double size, PdfColor color, {bool heavy = true}) =>
      pw.TextStyle(
        fontSize: size,
        color: color,
        font: heavy ? bold : regular,
        fontWeight: heavy ? pw.FontWeight.bold : pw.FontWeight.normal,
      );

  void star(PdfGraphics c, double cx, double cy, double r) {
    for (var i = 0; i < 10; i++) {
      final rr = i.isEven ? r : r * 0.45;
      final a = 3.14159265 / 2 + i * 3.14159265 / 5;
      final x = cx + rr * math.cos(a), y = cy + rr * math.sin(a);
      i == 0 ? c.moveTo(x, y) : c.lineTo(x, y);
    }
    c.closePath();
  }

  pw.Widget emblemArt(double size) => pw.CustomPaint(
        size: PdfPoint(size, size),
        painter: (PdfGraphics c, PdfPoint s) {
          final w = s.x, h = s.y, cx = w / 2, cy = h / 2;
          c.setFillColor(accent);
          c.drawEllipse(cx, cy, w / 2, h / 2);
          c.fillPath();
          c.setFillColor(PdfColors.white);
          switch (mark) {
            case 'crown':
              c.moveTo(w * 0.2, h * 0.3);
              c.lineTo(w * 0.16, h * 0.68);
              c.lineTo(w * 0.35, h * 0.5);
              c.lineTo(w * 0.5, h * 0.76);
              c.lineTo(w * 0.65, h * 0.5);
              c.lineTo(w * 0.84, h * 0.68);
              c.lineTo(w * 0.8, h * 0.3);
              c.closePath();
              c.fillPath();
              break;
            case 'star':
              star(c, cx, cy, w * 0.32);
              c.fillPath();
              break;
            case 'heart':
              c.moveTo(cx, h * 0.22);
              c.curveTo(w * 0.1, h * 0.45, w * 0.22, h * 0.82, cx, h * 0.64);
              c.curveTo(w * 0.78, h * 0.82, w * 0.9, h * 0.45, cx, h * 0.22);
              c.closePath();
              c.fillPath();
              break;
            case 'shield':
              c.moveTo(w * 0.26, h * 0.76);
              c.lineTo(w * 0.74, h * 0.76);
              c.lineTo(w * 0.74, h * 0.48);
              c.curveTo(w * 0.74, h * 0.3, cx, h * 0.2, cx, h * 0.18);
              c.curveTo(cx, h * 0.2, w * 0.26, h * 0.3, w * 0.26, h * 0.48);
              c.closePath();
              c.fillPath();
              c.setFillColor(main);
              star(c, cx, h * 0.5, w * 0.12);
              c.fillPath();
              break;
            case 'gem':
              c.moveTo(cx, h * 0.18);
              c.lineTo(w * 0.78, h * 0.55);
              c.lineTo(w * 0.64, h * 0.74);
              c.lineTo(w * 0.36, h * 0.74);
              c.lineTo(w * 0.22, h * 0.55);
              c.closePath();
              c.fillPath();
              break;
            default: // squishie
              c.drawEllipse(cx, h * 0.44, w * 0.3, h * 0.24);
              c.fillPath();
              c.drawEllipse(cx, h * 0.56, w * 0.24, h * 0.2);
              c.fillPath();
              c.setFillColor(main);
              c.drawEllipse(cx - w * 0.09, h * 0.5, w * 0.03, h * 0.04);
              c.fillPath();
              c.drawEllipse(cx + w * 0.09, h * 0.5, w * 0.03, h * 0.04);
              c.fillPath();
              c.setStrokeColor(main);
              c.setLineWidth(w * 0.025);
              c.moveTo(cx - w * 0.05, h * 0.42);
              c.curveTo(cx - w * 0.02, h * 0.38, cx + w * 0.02, h * 0.38,
                  cx + w * 0.05, h * 0.42);
              c.strokePath();
          }
        },
      );

  pw.Border frame() {
    switch (edge) {
      case 'dashed':
        return pw.Border.all(
            color: main, width: 3, style: pw.BorderStyle.dashed);
      case 'dotted':
        return pw.Border.all(
            color: main, width: 3, style: pw.BorderStyle.dotted);
    }
    return pw.Border.all(color: main, width: 3);
  }

  final compact = count >= 8;
  pw.Widget bill() {
    final body = pw.Container(
      padding: pw.EdgeInsets.all(compact ? 6 : 10),
      decoration: pw.BoxDecoration(
        color: light,
        border: frame(),
        borderRadius: pw.BorderRadius.circular(12),
      ),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('$value', style: st(compact ? 18 : 26, main)),
              pw.Text('SQUISHIE BUCKS', style: st(compact ? 10 : 14, main)),
              pw.Text('$value', style: st(compact ? 18 : 26, main)),
            ],
          ),
          pw.Center(child: emblemArt(compact ? 40 : 62)),
          pw.Column(children: [
            if (note.isNotEmpty)
              pw.Text(note,
                  textAlign: pw.TextAlign.center,
                  maxLines: 1,
                  style: st(compact ? 9 : 12, main)),
            pw.Text(
                name.isEmpty ? 'Squishie Kingdom Currency' : 'Issued to $name',
                textAlign: pw.TextAlign.center,
                style: st(compact ? 8 : 11, main, heavy: false)),
            pw.Text('$edition edition - no cash value',
                textAlign: pw.TextAlign.center,
                style: st(compact ? 6 : 8, main, heavy: false)),
          ]),
        ],
      ),
    );
    if (edge != 'double')
      return pw.Padding(padding: const pw.EdgeInsets.all(5), child: body);
    return pw.Container(
      margin: const pw.EdgeInsets.all(5),
      padding: const pw.EdgeInsets.all(3),
      decoration: pw.BoxDecoration(
          border: pw.Border.all(color: accent, width: 2),
          borderRadius: pw.BorderRadius.circular(14)),
      child: body,
    );
  }

  final rows = count ~/ 2;
  final doc = pw.Document();
  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.letter,
      margin: const pw.EdgeInsets.all(20),
      build: (context) => pw.Column(
        children: List.generate(
          rows,
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
    name: 'squishie-bucks-$value',
    onLayout: (format) async => doc.save(),
  );
}
