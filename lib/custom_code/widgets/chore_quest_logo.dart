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

/// Squishie Chore Adventure logo: a scalloped mint badge with a butter-yellow
/// centre sprinkled with confetti, three kawaii dumpling squishies (pink bao,
/// blue gyoza, lavender bao), the bubbly title and little chore doodles.
/// [showTitle] false gives the compact icon version. With [animate] the
/// badge pops in, the squishies hop in one by one and the sparkles twinkle.
class ChoreQuestLogo extends StatefulWidget {
  const ChoreQuestLogo({
    super.key,
    this.width,
    this.height,
    this.showTitle,
    this.animate,
    this.titleFontFamily,
    this.variant = 'badge',
  });

  final double? width;
  final double? height;
  final bool? showTitle;
  final bool? animate;

  /// Optional font family override for the title (used for image export).
  final String? titleFontFamily;

  /// 'badge' (default) or 'squishies' (just the three friends, transparent —
  /// used for the Android adaptive-icon foreground).
  final String variant;

  @override
  State<ChoreQuestLogo> createState() => _ChoreQuestLogoState();
}

class _ChoreQuestLogoState extends State<ChoreQuestLogo>
    with TickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1700));
  late final AnimationController _loop =
      AnimationController(vsync: this, duration: const Duration(seconds: 3));

  @override
  void initState() {
    super.initState();
    if (widget.animate ?? false) {
      _intro.forward();
      _loop.repeat();
    } else {
      _intro.value = 1;
    }
  }

  @override
  void dispose() {
    _intro.dispose();
    _loop.dispose();
    super.dispose();
  }

  TextStyle _font(double size, {Color? color, Paint? foreground}) {
    final base = TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      height: 1.0,
      color: foreground == null ? color : null,
      foreground: foreground,
      decoration: TextDecoration.none,
    );
    final family = widget.titleFontFamily;
    if (family != null && family.isNotEmpty)
      return base.copyWith(fontFamily: family);
    return GoogleFonts.sniglet(textStyle: base);
  }

  Widget _outlined(
          String text, double size, double stroke, Color fill, Color line) =>
      Stack(children: [
        Text(text,
            style: _font(size,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = stroke
                  ..strokeJoin = StrokeJoin.round
                  ..color = line)),
        Text(text, style: _font(size, color: fill)),
      ]);

  @override
  Widget build(BuildContext context) {
    final showTitle = widget.showTitle ?? true;
    final onlySquishies = widget.variant == 'squishies';
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: LayoutBuilder(builder: (context, cons) {
        final w = cons.maxWidth.isFinite ? cons.maxWidth : 300.0;
        final h = cons.maxHeight.isFinite ? cons.maxHeight : w;
        final s = math.min(w, h);
        return Center(
          child: SizedBox(
            width: s,
            height: s,
            child: AnimatedBuilder(
              animation: Listenable.merge([_intro, _loop]),
              builder: (context, _) {
                final p = _intro.value;
                final pop =
                    Curves.elasticOut.transform((p / 0.6).clamp(0.0, 1.0));
                return Stack(clipBehavior: Clip.none, children: [
                  Positioned.fill(
                    child: Transform.scale(
                      scale: onlySquishies ? 1 : 0.3 + 0.7 * pop,
                      child: Opacity(
                        opacity: onlySquishies ? 1 : (p * 4).clamp(0.0, 1.0),
                        child: CustomPaint(
                            painter: _BadgePainter(
                                intro: p,
                                t: _loop.value,
                                showTitle: showTitle,
                                onlySquishies: onlySquishies)),
                      ),
                    ),
                  ),
                  if (showTitle && !onlySquishies) ...[
                    Positioned(
                      left: s * 0.08,
                      right: s * 0.08,
                      top: s * 0.6,
                      height: s * 0.17,
                      child: Opacity(
                        opacity: ((p - 0.35) * 4).clamp(0.0, 1.0),
                        child: Transform.scale(
                          scale: 0.6 +
                              0.4 *
                                  Curves.elasticOut.transform(
                                      ((p - 0.35) / 0.5).clamp(0.0, 1.0)),
                          child: FittedBox(
                              child: _outlined('Squishie', s * 0.15, s * 0.034,
                                  const Color(0xFF2B5797), Colors.white)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: s * 0.12,
                      right: s * 0.12,
                      top: s * 0.765,
                      height: s * 0.075,
                      child: Opacity(
                        opacity: ((p - 0.5) * 4).clamp(0.0, 1.0),
                        child: FittedBox(
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(
                                width: s * 0.06,
                                height: s * 0.06,
                                child: CustomPaint(painter: _StarDot())),
                            SizedBox(width: s * 0.015),
                            _outlined('Chore Adventure', s * 0.07, s * 0.018,
                                const Color(0xFFF08A2E), Colors.white),
                            SizedBox(width: s * 0.015),
                            SizedBox(
                                width: s * 0.06,
                                height: s * 0.06,
                                child: CustomPaint(painter: _StarDot())),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ]);
              },
            ),
          ),
        );
      }),
    );
  }
}

class _BadgePainter extends CustomPainter {
  _BadgePainter(
      {required this.intro,
      required this.t,
      required this.showTitle,
      required this.onlySquishies});
  final double intro;
  final double t;
  final bool showTitle;
  final bool onlySquishies;

  static const _confetti = [
    Color(0xFFFFB3C7),
    Color(0xFF9ED8F0),
    Color(0xFFC9B6FF),
    Color(0xFFFFD27A),
    Color(0xFF9EE6C4)
  ];

  Path _scallop(Offset c, double r, int bumps, double depth) {
    final path = Path();
    const steps = 360;
    for (var i = 0; i <= steps; i++) {
      final a = -math.pi / 2 + i / steps * 2 * math.pi;
      final rr = r *
          (1 - depth + depth * math.pow(math.cos(a * bumps / 2).abs(), 0.6));
      final pt = c + Offset(math.cos(a), math.sin(a)) * rr;
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    return path..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final c = Offset(s / 2, s / 2);
    if (!onlySquishies) {
      final outer = _scallop(c, s * 0.49, 14, 0.06);
      canvas.drawPath(
          outer.shift(Offset(0, s * 0.01)),
          Paint()
            ..color = const Color(0x332A5A4A)
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.01));
      canvas.drawPath(outer, Paint()..color = Colors.white);
      final mint = _scallop(c, s * 0.475, 14, 0.06);
      canvas.drawPath(
          mint,
          Paint()
            ..shader = const RadialGradient(
                    colors: [Color(0xFFCDEEE0), Color(0xFFA6DCC6)],
                    stops: [0.75, 1])
                .createShader(Rect.fromCircle(center: c, radius: s * 0.48)));
      canvas.drawPath(
          mint,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = s * 0.006
            ..color = const Color(0xFF86C7AF));
      final inner = _scallop(c, s * 0.42, 14, 0.055);
      canvas.drawPath(inner, Paint()..color = Colors.white);
      final butter = _scallop(c, s * 0.405, 14, 0.055);
      canvas.drawPath(
          butter,
          Paint()
            ..shader = const RadialGradient(colors: [
              Color(0xFFFFFBE6),
              Color(0xFFFFF1BF),
              Color(0xFFFFE7A3)
            ], stops: [
              0,
              0.65,
              1
            ]).createShader(Rect.fromCircle(center: c, radius: s * 0.41)));
      canvas.save();
      canvas.clipPath(butter);
      // Confetti, dots and twinkles.
      final rnd = math.Random(12);
      for (var i = 0; i < 70; i++) {
        final pt = Offset(s * (0.12 + rnd.nextDouble() * 0.76),
            s * (0.1 + rnd.nextDouble() * 0.8));
        final col = _confetti[i % _confetti.length];
        if (i % 3 == 0) {
          canvas.save();
          canvas.translate(pt.dx, pt.dy);
          canvas.rotate(rnd.nextDouble() * math.pi);
          canvas.drawRRect(
              RRect.fromRectAndRadius(
                  Rect.fromCenter(
                      center: Offset.zero, width: s * 0.022, height: s * 0.008),
                  Radius.circular(s * 0.004)),
              Paint()..color = col.withOpacity(0.8));
          canvas.restore();
        } else {
          canvas.drawCircle(
              pt,
              s * (0.003 + rnd.nextDouble() * 0.004),
              Paint()
                ..color = (i.isEven ? const Color(0xFFF5C76A) : col)
                    .withOpacity(0.7));
        }
      }
      canvas.restore();
      final stars = [
        const Offset(0.2, 0.2),
        const Offset(0.8, 0.22),
        const Offset(0.33, 0.14),
        const Offset(0.7, 0.13)
      ];
      for (var i = 0; i < stars.length; i++) {
        final tw = 0.75 + 0.25 * math.sin(t * 2 * math.pi * 2 + i * 1.7);
        final pos = Offset(stars[i].dx * s, stars[i].dy * s);
        if (i.isEven) {
          _star(canvas, pos, s * 0.028 * tw, const Color(0xFFFFD86B));
        } else {
          _twinkle(canvas, pos, s * 0.016 * tw, const Color(0xFFF5C76A));
        }
      }
    }

    // The three squishie friends hop in one by one.
    final groundY = onlySquishies ? s * 0.7 : (showTitle ? s * 0.56 : s * 0.7);
    final scale = onlySquishies ? 0.95 : (showTitle ? 0.82 : 0.84);
    final unit = s * scale;
    double hop(int i) {
      final k = ((intro - 0.25 - i * 0.12) / 0.3).clamp(0.0, 1.0);
      final idle = math.sin(t * 2 * math.pi + i * 1.9) * unit * 0.006;
      return (1 - Curves.bounceOut.transform(k)) * -unit * 0.25 + idle;
    }

    double vis(int i) => ((intro - 0.25 - i * 0.12) / 0.08).clamp(0.0, 1.0);
    // Soft ground shadow.
    if (!onlySquishies) {
      canvas.drawOval(
          Rect.fromCenter(
              center: Offset(s / 2, groundY + unit * 0.01),
              width: unit * 0.78,
              height: unit * 0.05),
          Paint()..color = const Color(0x55F2B46A));
    }
    final cx = s / 2;
    if (vis(0) > 0)
      _bao(canvas, Offset(cx - unit * 0.29, groundY + hop(0)), unit * 0.29,
          const Color(0xFFF7C3CE), const Color(0xFF8A4560),
          happyEyes: true);
    if (vis(2) > 0)
      _bao(canvas, Offset(cx + unit * 0.29, groundY + hop(2)), unit * 0.29,
          const Color(0xFFC6B3EA), const Color(0xFF4B3C8A),
          happyEyes: false);
    if (vis(1) > 0)
      _gyoza(canvas, Offset(cx + unit * 0.01, groundY + hop(1)), unit * 0.28);

    if (!onlySquishies && showTitle) {
      _doodles(canvas, s);
    }
  }

  void _face(Canvas canvas, Offset c, double u, {required bool happy}) {
    const ink = Color(0xFF2A1F3D);
    for (final d in [-1.0, 1.0]) {
      final e = c + Offset(d * u * 0.2, 0);
      if (happy) {
        canvas.drawArc(
            Rect.fromCenter(center: e, width: u * 0.14, height: u * 0.12),
            math.pi * 1.1,
            math.pi * 0.8,
            false,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = u * 0.03
              ..strokeCap = StrokeCap.round
              ..color = ink);
      } else {
        canvas.drawOval(
            Rect.fromCenter(center: e, width: u * 0.1, height: u * 0.12),
            Paint()..color = ink);
        canvas.drawCircle(e + Offset(-u * 0.018, -u * 0.025), u * 0.022,
            Paint()..color = Colors.white);
        canvas.drawCircle(e + Offset(u * 0.02, u * 0.022), u * 0.01,
            Paint()..color = Colors.white.withOpacity(0.85));
      }
      canvas.drawOval(
          Rect.fromCenter(
              center: e + Offset(d * u * 0.06, u * 0.1),
              width: u * 0.12,
              height: u * 0.07),
          Paint()..color = const Color(0xFFFF8FA8).withOpacity(0.55));
    }
    final m = c + Offset(0, u * 0.07);
    final mouth = Path()
      ..moveTo(m.dx - u * 0.07, m.dy - u * 0.01)
      ..quadraticBezierTo(
          m.dx, m.dy + u * 0.1, m.dx + u * 0.07, m.dy - u * 0.01)
      ..close();
    canvas.drawPath(mouth, Paint()..color = const Color(0xFF6B2A3A));
    canvas.drawOval(
        Rect.fromCenter(
            center: m + Offset(0, u * 0.035),
            width: u * 0.06,
            height: u * 0.03),
        Paint()..color = const Color(0xFFFF7F92));
  }

  /// Round soup-dumpling (bao) with a pinched, pleated top knot.
  void _bao(Canvas canvas, Offset base, double u, Color color, Color line,
      {required bool happyEyes}) {
    final w = u * 1.0;
    final h = u * 0.95;
    final top = base.dy - h;
    final body = Path()
      ..moveTo(base.dx - w * 0.38, base.dy)
      ..cubicTo(base.dx - w * 0.62, base.dy - h * 0.05, base.dx - w * 0.6,
          top + h * 0.38, base.dx - w * 0.32, top + h * 0.2)
      ..quadraticBezierTo(
          base.dx - w * 0.14, top + h * 0.1, base.dx - w * 0.08, top + h * 0.02)
      ..quadraticBezierTo(
          base.dx, top - h * 0.04, base.dx + w * 0.08, top + h * 0.02)
      ..quadraticBezierTo(
          base.dx + w * 0.14, top + h * 0.1, base.dx + w * 0.32, top + h * 0.2)
      ..cubicTo(base.dx + w * 0.6, top + h * 0.38, base.dx + w * 0.62,
          base.dy - h * 0.05, base.dx + w * 0.38, base.dy)
      ..close();
    final b = body.getBounds();
    canvas.drawPath(
        body,
        Paint()
          ..shader = RadialGradient(
              center: const Alignment(-0.3, -0.25),
              radius: 0.95,
              colors: [
                Color.lerp(color, Colors.white, 0.45)!,
                color,
                Color.lerp(color, line, 0.18)!
              ],
              stops: const [
                0,
                0.6,
                1
              ]).createShader(b));
    // Pleats.
    final pleat = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = u * 0.018
      ..strokeCap = StrokeCap.round
      ..color = Color.lerp(color, line, 0.45)!;
    for (final dx in [-0.12, -0.04, 0.04, 0.12]) {
      canvas.drawPath(
          Path()
            ..moveTo(base.dx + dx * w * 0.5, top + h * 0.04)
            ..quadraticBezierTo(base.dx + dx * w * 1.4, top + h * 0.16,
                base.dx + dx * w * 2.2, top + h * 0.28),
          pleat);
    }
    canvas.drawPath(
        body,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = u * 0.03
          ..strokeJoin = StrokeJoin.round
          ..color = line);
    _twinkle(canvas, Offset(b.left + w * 0.2, top + h * 0.42), u * 0.035,
        Colors.white);
    _face(canvas, Offset(base.dx, base.dy - h * 0.42), u, happy: happyEyes);
  }

  /// Crescent gyoza standing upright: a fat half-moon with a ruffled,
  /// crimped outer edge on the left and a smooth inner curve on the right.
  void _gyoza(Canvas canvas, Offset base, double u) {
    const color = Color(0xFF9FD3E6);
    const line = Color(0xFF2F5E85);
    final r = u * 0.62;
    final oc = Offset(base.dx - u * 0.02, base.dy - r * 0.98);
    final outer = Path()..addOval(Rect.fromCircle(center: oc, radius: r));
    // Ruffles: small bumps along the left/top outer arc.
    for (var i = 0; i <= 10; i++) {
      final a = math.pi * (0.62 + 0.86 * i / 10);
      outer.addOval(Rect.fromCircle(
          center: oc + Offset(math.cos(a), math.sin(a)) * r * 0.96,
          radius: r * 0.13));
    }
    final merged = Path.combine(PathOperation.union, outer,
        Path()..addOval(Rect.fromCircle(center: oc, radius: r)));
    final cut = Path()
      ..addOval(Rect.fromCircle(
          center: oc + Offset(r * 0.78, -r * 0.05), radius: r * 0.72));
    final floor = Path()
      ..addRect(Rect.fromLTRB(
          oc.dx - r * 2, base.dy, oc.dx + r * 2, base.dy + r * 2));
    var body = Path.combine(PathOperation.difference, merged, cut);
    body = Path.combine(PathOperation.difference, body, floor);
    final b = body.getBounds();
    canvas.drawPath(
        body,
        Paint()
          ..shader = RadialGradient(
              center: const Alignment(-0.35, -0.3),
              radius: 1.0,
              colors: [
                Color.lerp(color, Colors.white, 0.45)!,
                color,
                Color.lerp(color, line, 0.2)!
              ],
              stops: const [
                0,
                0.6,
                1
              ]).createShader(b));
    // Crimp lines just inside the ruffled edge.
    final crimp = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = u * 0.016
      ..strokeCap = StrokeCap.round
      ..color = Color.lerp(color, line, 0.4)!;
    for (var i = 1; i < 10; i++) {
      final a = math.pi * (0.62 + 0.86 * i / 10) + math.pi * 0.043;
      final dir = Offset(math.cos(a), math.sin(a));
      canvas.drawLine(oc + dir * r * 0.94, oc + dir * r * 0.78, crimp);
    }
    canvas.drawPath(
        body,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = u * 0.03
          ..strokeJoin = StrokeJoin.round
          ..color = line);
    _twinkle(canvas, Offset(oc.dx - r * 0.45, oc.dy - r * 0.45), u * 0.04,
        Colors.white);
    _face(canvas, Offset(oc.dx - r * 0.18, oc.dy + r * 0.12), u * 0.9,
        happy: false);
  }

  void _doodles(Canvas canvas, double s) {
    final y = s * 0.88;
    // Broom.
    canvas.save();
    canvas.translate(s * 0.27, y);
    canvas.rotate(0.5);
    canvas.drawLine(
        Offset(0, -s * 0.05),
        Offset(0, s * 0.01),
        Paint()
          ..color = const Color(0xFFB98A55)
          ..strokeWidth = s * 0.008
          ..strokeCap = StrokeCap.round);
    canvas.drawPath(
        Path()
          ..moveTo(-s * 0.012, s * 0.008)
          ..lineTo(s * 0.012, s * 0.008)
          ..lineTo(s * 0.02, s * 0.04)
          ..lineTo(-s * 0.02, s * 0.04)
          ..close(),
        Paint()..color = const Color(0xFFF2C46B));
    canvas.restore();
    // Checklist.
    final card = Rect.fromCenter(
        center: Offset(s * 0.38, y + s * 0.01),
        width: s * 0.045,
        height: s * 0.055);
    canvas.drawRRect(RRect.fromRectAndRadius(card, Radius.circular(s * 0.006)),
        Paint()..color = Colors.white);
    canvas.drawRRect(
        RRect.fromRectAndRadius(card, Radius.circular(s * 0.006)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.003
          ..color = const Color(0xFF8AA6C8));
    for (var i = 0; i < 3; i++) {
      final yy = card.top + card.height * (0.28 + i * 0.24);
      canvas.drawRect(
          Rect.fromCenter(
              center: Offset(card.left + card.width * 0.25, yy),
              width: s * 0.007,
              height: s * 0.007),
          Paint()..color = _confetti[i]);
      canvas.drawLine(
          Offset(card.left + card.width * 0.42, yy),
          Offset(card.right - card.width * 0.15, yy),
          Paint()
            ..color = const Color(0xFF9EB4D0)
            ..strokeWidth = s * 0.003);
    }
    // Bubbles.
    for (final b in [
      const Offset(0.5, 0.895),
      const Offset(0.522, 0.875),
      const Offset(0.515, 0.905)
    ]) {
      final r = s * (b.dy > 0.9 ? 0.009 : 0.014);
      canvas.drawCircle(Offset(b.dx * s, b.dy * s), r,
          Paint()..color = const Color(0xFFBFE6F5));
      canvas.drawCircle(
          Offset(b.dx * s, b.dy * s),
          r,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = s * 0.0025
            ..color = const Color(0xFF7FB8D6));
      canvas.drawCircle(Offset(b.dx * s - r * 0.35, b.dy * s - r * 0.35),
          r * 0.25, Paint()..color = Colors.white);
    }
    // Soap bar.
    canvas.save();
    canvas.translate(s * 0.63, y + s * 0.01);
    canvas.rotate(-0.25);
    final soap = Rect.fromCenter(
        center: Offset.zero, width: s * 0.055, height: s * 0.035);
    canvas.drawRRect(RRect.fromRectAndRadius(soap, Radius.circular(s * 0.01)),
        Paint()..color = const Color(0xFFFFE3B0));
    canvas.drawRRect(
        RRect.fromRectAndRadius(soap, Radius.circular(s * 0.01)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.003
          ..color = const Color(0xFFE0B070));
    canvas.restore();
    // Hearts + star.
    _heart(canvas, Offset(s * 0.73, y - s * 0.005), s * 0.017,
        const Color(0xFFA8E0C0));
    _heart(canvas, Offset(s * 0.79, y - s * 0.01), s * 0.015,
        const Color(0xFFFFB6C8));
    _star(canvas, Offset(s * 0.19, y - s * 0.015), s * 0.02,
        const Color(0xFFFFE07A));
  }

  void _star(Canvas canvas, Offset c, double r, Color color) {
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final rr = i.isEven ? r : r * 0.5;
      final a = -math.pi / 2 + i * math.pi / 5;
      final pt = c + Offset(math.cos(a), math.sin(a)) * rr;
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    path.close();
    canvas.drawPath(path, Paint()..color = color);
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r * 0.12
          ..strokeJoin = StrokeJoin.round
          ..color = Color.lerp(color, Colors.brown, 0.25)!);
  }

  void _twinkle(Canvas canvas, Offset c, double r, Color color) {
    canvas.drawPath(
        Path()
          ..moveTo(c.dx, c.dy - r * 2)
          ..quadraticBezierTo(c.dx, c.dy, c.dx + r * 2, c.dy)
          ..quadraticBezierTo(c.dx, c.dy, c.dx, c.dy + r * 2)
          ..quadraticBezierTo(c.dx, c.dy, c.dx - r * 2, c.dy)
          ..quadraticBezierTo(c.dx, c.dy, c.dx, c.dy - r * 2)
          ..close(),
        Paint()..color = color);
  }

  void _heart(Canvas canvas, Offset c, double r, Color color) {
    final p = Path()
      ..moveTo(c.dx, c.dy + r * 0.9)
      ..cubicTo(c.dx - r * 1.6, c.dy - r * 0.2, c.dx - r * 0.7, c.dy - r * 1.3,
          c.dx, c.dy - r * 0.45)
      ..cubicTo(c.dx + r * 0.7, c.dy - r * 1.3, c.dx + r * 1.6, c.dy - r * 0.2,
          c.dx, c.dy + r * 0.9)
      ..close();
    canvas.drawPath(p, Paint()..color = color);
    canvas.drawPath(
        p,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r * 0.15
          ..color = Color.lerp(color, Colors.black, 0.25)!);
  }

  @override
  bool shouldRepaint(covariant _BadgePainter old) =>
      old.intro != intro ||
      old.t != t ||
      old.showTitle != showTitle ||
      old.onlySquishies != onlySquishies;
}

/// A small outlined orange star beside the tagline.
class _StarDot extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.shortestSide * 0.48;
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final rr = i.isEven ? r : r * 0.5;
      final a = -math.pi / 2 + i * math.pi / 5;
      final pt = c + Offset(math.cos(a), math.sin(a)) * rr;
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r * 0.35
          ..strokeJoin = StrokeJoin.round
          ..color = Colors.white);
    canvas.drawPath(path, Paint()..color = const Color(0xFFF08A2E));
  }

  @override
  bool shouldRepaint(covariant _StarDot oldDelegate) => false;
}
