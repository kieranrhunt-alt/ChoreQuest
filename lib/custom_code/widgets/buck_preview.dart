// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

/// Live preview of one Squishie Buck, matching the printed bill: theme colors,
/// denomination, emblem, motto, "issued to" line, edition and border style
/// (solid | double | dashed | dotted), plus a "× N per sheet" badge.
/// Changes animate with a little jelly pop.
class BuckPreview extends StatelessWidget {
  const BuckPreview({
    super.key,
    this.width,
    this.height,
    this.denomination,
    this.kidName,
    this.theme,
    this.motto,
    this.emblem,
    this.border,
    this.perSheet,
  });

  final double? width;
  final double? height;
  final int? denomination;
  final String? kidName;
  final String? theme;
  final String? motto;
  final String? emblem;
  final String? border;
  final int? perSheet;

  static const _palette = <String, List<Object>>{
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

  static const _emblems = {
    'squishie': '🥟',
    'crown': '👑',
    'star': '⭐',
    'heart': '💖',
    'shield': '🛡️',
    'gem': '💎'
  };

  TextStyle _font(double size, Color color, {bool heavy = true}) =>
      GoogleFonts.sniglet(
          fontSize: size,
          color: color,
          fontWeight: heavy ? FontWeight.w800 : FontWeight.w400,
          height: 1.05);

  @override
  Widget build(BuildContext context) {
    final p = _palette[theme ?? 'Classic'] ?? _palette['Classic']!;
    final main = Color(p[0] as int);
    final light = Color(p[1] as int);
    final accent = Color(p[2] as int);
    final edition = p[3] as String;
    final value = denomination ?? 1;
    final name = (kidName ?? '').trim();
    final note = (motto ?? '').trim();
    final edge = border ?? 'solid';
    final count = perSheet ?? 6;
    final key = '$theme|$value|$name|$note|$emblem|$edge|$count';

    return LayoutBuilder(builder: (context, cons) {
      final w = width ?? (cons.maxWidth.isFinite ? cons.maxWidth : 340.0);
      final h = height ?? (cons.maxHeight.isFinite ? cons.maxHeight : 200.0);
      final u = math.min(w / 340, h / 200);
      final bill = Container(
        margin: EdgeInsets.all(edge == 'double' ? 0 : 4 * u),
        padding: EdgeInsets.fromLTRB(14 * u, 10 * u, 14 * u, 10 * u),
        decoration: BoxDecoration(
            color: light, borderRadius: BorderRadius.circular(14 * u)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('$value', style: _font(30 * u, main)),
              Flexible(
                  child: FittedBox(
                      child:
                          Text('SQUISHIE BUCKS', style: _font(17 * u, main)))),
              Text('$value', style: _font(30 * u, main)),
            ]),
            Center(
              child: Container(
                width: 58 * u,
                height: 58 * u,
                decoration: BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                    border: Border.all(color: main, width: 3 * u)),
                alignment: Alignment.center,
                child: Text(_emblems[emblem] ?? '🥟',
                    style: TextStyle(fontSize: 28 * u)),
              ),
            ),
            Column(mainAxisSize: MainAxisSize.min, children: [
              if (note.isNotEmpty)
                Text(note,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: _font(14 * u, main)),
              Text(
                  name.isEmpty
                      ? 'Squishie Kingdom Currency'
                      : 'Issued to $name',
                  textAlign: TextAlign.center,
                  style: _font(12 * u, main, heavy: false)),
              Text('$edition edition · no cash value',
                  textAlign: TextAlign.center,
                  style: _font(10 * u, main, heavy: false)),
            ]),
          ],
        ),
      );
      final framed = CustomPaint(
        foregroundPainter:
            _BorderPainter(style: edge, color: main, accent: accent, unit: u),
        child: Padding(
            padding: EdgeInsets.all(edge == 'double' ? 9 * u : 0), child: bill),
      );
      return SizedBox(
        width: w,
        height: h,
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned.fill(
            child: TweenAnimationBuilder<double>(
              key: ValueKey(key),
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 420),
              builder: (context, t, child) {
                final s = 1 + math.sin(t * math.pi) * 0.04 * (1 - t);
                return Transform.scale(scaleX: s, scaleY: 2 - s, child: child);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16 * u),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 14,
                        offset: Offset(0, 6))
                  ],
                ),
                child: framed,
              ),
            ),
          ),
          Positioned(
            right: -4 * u,
            top: -10 * u,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 10 * u, vertical: 4 * u),
              decoration: BoxDecoration(
                color: const Color(0xFF7B3FE4),
                borderRadius: BorderRadius.circular(12 * u),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text('× $count per sheet',
                  style: _font(12 * u, Colors.white)),
            ),
          ),
        ]),
      );
    });
  }
}

class _BorderPainter extends CustomPainter {
  _BorderPainter(
      {required this.style,
      required this.color,
      required this.accent,
      required this.unit});
  final String style;
  final Color color;
  final Color accent;
  final double unit;

  @override
  void paint(Canvas canvas, Size size) {
    final inset = style == 'double' ? 9 * unit : 4 * unit;
    final rect = Rect.fromLTWH(
        inset, inset, size.width - inset * 2, size.height - inset * 2);
    final rr = RRect.fromRectAndRadius(rect, Radius.circular(14 * unit));
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4 * unit
      ..color = color;
    switch (style) {
      case 'double':
        canvas.drawRRect(rr, paint);
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromLTWH(2 * unit, 2 * unit, size.width - 4 * unit,
                    size.height - 4 * unit),
                Radius.circular(18 * unit)),
            paint
              ..color = accent
              ..strokeWidth = 3 * unit);
        break;
      case 'dashed':
      case 'dotted':
        final path = Path()..addRRect(rr);
        final dash = style == 'dashed' ? 14 * unit : 3 * unit;
        final gap = style == 'dashed' ? 8 * unit : 7 * unit;
        if (style == 'dotted') paint.strokeCap = StrokeCap.round;
        for (final m in path.computeMetrics()) {
          var d = 0.0;
          while (d < m.length) {
            canvas.drawPath(
                m.extractPath(d, math.min(d + dash, m.length)), paint);
            d += dash + gap;
          }
        }
        break;
      default:
        canvas.drawRRect(rr, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BorderPainter old) =>
      old.style != style ||
      old.color != color ||
      old.accent != accent ||
      old.unit != unit;
}
