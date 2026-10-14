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

/// The ChoreQuest crest: a royal shield with a crown, a squishy hero, a
/// crossed sword (quest) and broom (chore), gold coins and sparkles, plus an
/// optional "ChoreQuest" ribbon. With [animate] it bounces in and twinkles.
class ChoreQuestLogo extends StatefulWidget {
  const ChoreQuestLogo({
    super.key,
    this.width,
    this.height,
    this.showTitle,
    this.animate,
    this.titleFontFamily,
  });

  final double? width;
  final double? height;
  final bool? showTitle;
  final bool? animate;

  /// Optional font family override for the title (used for image export).
  final String? titleFontFamily;

  @override
  State<ChoreQuestLogo> createState() => _ChoreQuestLogoState();
}

class _ChoreQuestLogoState extends State<ChoreQuestLogo>
    with TickerProviderStateMixin {
  late final AnimationController _intro = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1400));
  late final AnimationController _loop =
      AnimationController(vsync: this, duration: const Duration(seconds: 4));

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

  TextStyle _titleStyle(double size, Color color, {Paint? foreground}) {
    final base = TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w900,
      letterSpacing: size * 0.02,
      color: foreground == null ? color : null,
      foreground: foreground,
      fontVariations: const [FontVariation('wght', 900)],
      decoration: TextDecoration.none,
    );
    final family = widget.titleFontFamily;
    if (family != null && family.isNotEmpty)
      return base.copyWith(fontFamily: family);
    return GoogleFonts.cinzel(textStyle: base);
  }

  @override
  Widget build(BuildContext context) {
    final showTitle = widget.showTitle ?? true;
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
                final scale = Curves.elasticOut.transform(p.clamp(0.0, 1.0));
                final t = _loop.value;
                final squishSize = s * 0.4;
                final squishCenter =
                    Offset(s * 0.5, s * (showTitle ? 0.47 : 0.52));
                return Transform.scale(
                  scale: 0.2 + 0.8 * scale,
                  child: Opacity(
                    opacity: (p * 3).clamp(0.0, 1.0),
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned.fill(
                          child: CustomPaint(
                              painter: _LogoBack(t: t, showTitle: showTitle))),
                      Positioned(
                        left: squishCenter.dx - squishSize / 2,
                        top: squishCenter.dy - squishSize / 2,
                        width: squishSize,
                        height: squishSize,
                        child: SquishyAvatar(
                          width: squishSize,
                          height: squishSize,
                          look: 'species:bunny|color:#F8B6C8|fill:#FFF4DE',
                          animate: widget.animate ?? false,
                          showBackground: false,
                        ),
                      ),
                      Positioned.fill(
                          child: CustomPaint(
                              painter: _LogoFront(t: t, showTitle: showTitle))),
                      if (showTitle)
                        Positioned(
                          left: 0,
                          right: 0,
                          top: s * 0.735,
                          height: s * 0.13,
                          child: Center(
                            child: FittedBox(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: s * 0.16),
                                child: Stack(children: [
                                  Text('ChoreQuest',
                                      style: _titleStyle(
                                          s * 0.095, Colors.white,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = s * 0.012
                                            ..color = const Color(0xFF5A0F24))),
                                  Text('ChoreQuest',
                                      style: _titleStyle(
                                          s * 0.095, const Color(0xFFFFE27A))),
                                ]),
                              ),
                            ),
                          ),
                        ),
                    ]),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

Paint _grad(Rect r, List<Color> c,
        {Alignment begin = Alignment.topCenter,
        Alignment end = Alignment.bottomCenter,
        List<double>? stops}) =>
    Paint()
      ..shader = LinearGradient(begin: begin, end: end, colors: c, stops: stops)
          .createShader(r);

const _goldColors = [
  Color(0xFFFFF6C2),
  Color(0xFFF7C948),
  Color(0xFFD99A1A),
  Color(0xFFFFE27A)
];

Path _shieldPath(double s, bool showTitle, {double inset = 0}) {
  final cx = s * 0.5;
  final top = s * (showTitle ? 0.2 : 0.22) + inset;
  final w = s * 0.56 - inset * 2;
  final h = s * (showTitle ? 0.6 : 0.64) - inset * 2;
  final l = cx - w / 2, r = cx + w / 2;
  return Path()
    ..moveTo(l, top + h * 0.06)
    ..quadraticBezierTo(cx - w * 0.25, top - h * 0.02, cx, top + h * 0.03)
    ..quadraticBezierTo(cx + w * 0.25, top - h * 0.02, r, top + h * 0.06)
    ..lineTo(r, top + h * 0.5)
    ..cubicTo(r, top + h * 0.78, cx + w * 0.22, top + h * 0.92, cx, top + h)
    ..cubicTo(
        cx - w * 0.22, top + h * 0.92, l, top + h * 0.78, l, top + h * 0.5)
    ..close();
}

void _star(Canvas canvas, Offset c, double r, Paint p) {
  final path = Path();
  for (var i = 0; i < 10; i++) {
    final rr = i.isEven ? r : r * 0.45;
    final a = -math.pi / 2 + i * math.pi / 5;
    final pt = c + Offset(math.cos(a), math.sin(a)) * rr;
    if (i == 0) {
      path.moveTo(pt.dx, pt.dy);
    } else {
      path.lineTo(pt.dx, pt.dy);
    }
  }
  path.close();
  canvas.drawPath(path, p);
}

void _sparkle(Canvas canvas, Offset c, double r, Color color) {
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

class _LogoBack extends CustomPainter {
  _LogoBack({required this.t, required this.showTitle});
  final double t;
  final bool showTitle;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final c = Offset(s * 0.5, s * 0.5);
    // Soft golden halo.
    canvas.drawCircle(
        c,
        s * 0.48,
        Paint()
          ..shader = RadialGradient(
                  colors: [const Color(0x55FFE27A), const Color(0x00FFE27A)])
              .createShader(Rect.fromCircle(center: c, radius: s * 0.48)));

    // Crossed sword (quest) and broom (chore).
    _sword(canvas, s);
    _broom(canvas, s);

    // Shield.
    final shield = _shieldPath(s, showTitle);
    canvas.drawPath(
        shield.shift(Offset(0, s * 0.015)),
        Paint()
          ..color = const Color(0x55000000)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.015));
    canvas.drawPath(
        shield,
        _grad(shield.getBounds(), _goldColors,
            begin: Alignment.topLeft, end: Alignment.bottomRight));
    final inner = _shieldPath(s, showTitle, inset: s * 0.03);
    canvas.drawPath(
        inner,
        _grad(inner.getBounds(),
            const [Color(0xFF8A6CFF), Color(0xFF5B3CC4), Color(0xFF34207F)],
            stops: const [0, 0.5, 1]));
    canvas.save();
    canvas.clipPath(inner);
    // Quartered diamond pattern + light sweep.
    final b = inner.getBounds();
    final p = Paint()..color = const Color(0x1AFFFFFF);
    for (var y = b.top; y < b.bottom; y += s * 0.06) {
      for (var x = b.left + ((y - b.top) / (s * 0.06)).round() % 2 * s * 0.03;
          x < b.right;
          x += s * 0.06) {
        canvas.drawPath(
            Path()
              ..moveTo(x, y - s * 0.012)
              ..lineTo(x + s * 0.008, y)
              ..lineTo(x, y + s * 0.012)
              ..lineTo(x - s * 0.008, y)
              ..close(),
            p);
      }
    }
    canvas.drawPath(
        Path()
          ..moveTo(b.left, b.top)
          ..lineTo(b.left + b.width * 0.45, b.top)
          ..lineTo(b.left, b.top + b.height * 0.55)
          ..close(),
        Paint()..color = const Color(0x18FFFFFF));
    canvas.restore();
    canvas.drawPath(
        inner,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.006
          ..color = const Color(0xAAFFF6C2));
  }

  void _sword(Canvas canvas, double s) {
    canvas.save();
    canvas.translate(s * 0.5, s * 0.52);
    canvas.rotate(math.pi / 4);
    final blade = Rect.fromLTWH(-s * 0.032, -s * 0.56, s * 0.064, s * 0.72);
    canvas.drawRRect(
        RRect.fromRectAndCorners(blade,
            topLeft: Radius.circular(s * 0.03),
            topRight: Radius.circular(s * 0.03)),
        _grad(blade,
            const [Color(0xFFFFFFFF), Color(0xFFC9D2E0), Color(0xFF8D99AE)],
            begin: Alignment.centerLeft, end: Alignment.centerRight));
    canvas.drawLine(
        Offset(0, -s * 0.53),
        Offset(0, s * 0.15),
        Paint()
          ..color = const Color(0x88FFFFFF)
          ..strokeWidth = s * 0.008);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(0, s * 0.2), width: s * 0.22, height: s * 0.045),
            Radius.circular(s * 0.02)),
        _grad(
            Rect.fromLTWH(-s * 0.1, s * 0.18, s * 0.2, s * 0.04), _goldColors));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(-s * 0.02, s * 0.22, s * 0.04, s * 0.2),
            Radius.circular(s * 0.015)),
        Paint()..color = const Color(0xFF7A4A21));
    canvas.drawCircle(
        Offset(0, s * 0.43),
        s * 0.034,
        _grad(Rect.fromCircle(center: Offset(0, s * 0.43), radius: s * 0.034),
            _goldColors));
    canvas.restore();
  }

  void _broom(Canvas canvas, double s) {
    canvas.save();
    canvas.translate(s * 0.5, s * 0.52);
    canvas.rotate(-math.pi / 4);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(-s * 0.02, -s * 0.56, s * 0.04, s * 0.74),
            Radius.circular(s * 0.018)),
        _grad(Rect.fromLTWH(-s * 0.02, -s * 0.56, s * 0.04, s * 0.74),
            const [Color(0xFFC98B4F), Color(0xFF8B5A2B)],
            begin: Alignment.centerLeft, end: Alignment.centerRight));
    final straw = Path()
      ..moveTo(-s * 0.05, s * 0.18)
      ..lineTo(s * 0.05, s * 0.16)
      ..quadraticBezierTo(s * 0.15, s * 0.32, s * 0.14, s * 0.46)
      ..lineTo(-s * 0.14, s * 0.46)
      ..quadraticBezierTo(-s * 0.15, s * 0.32, -s * 0.05, s * 0.16)
      ..close();
    canvas.drawPath(straw,
        _grad(straw.getBounds(), const [Color(0xFFFFE27A), Color(0xFFE0A93A)]));
    final line = Paint()
      ..color = const Color(0x66A0662A)
      ..strokeWidth = s * 0.006;
    for (var i = -4; i <= 4; i++) {
      canvas.drawLine(
          Offset(i * s * 0.01, s * 0.18), Offset(i * s * 0.03, s * 0.45), line);
    }
    canvas.drawRect(Rect.fromLTWH(-s * 0.055, s * 0.15, s * 0.11, s * 0.03),
        Paint()..color = const Color(0xFFD7263D));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _LogoBack old) =>
      old.t != t || old.showTitle != showTitle;
}

class _LogoFront extends CustomPainter {
  _LogoFront({required this.t, required this.showTitle});
  final double t;
  final bool showTitle;

  @override
  void paint(Canvas canvas, Size s0) {
    final s = s0.width;
    _crown(canvas, Offset(s * 0.5, s * (showTitle ? 0.19 : 0.21)), s * 0.3);
    final coinY = s * (showTitle ? 0.68 : 0.76);
    _coin(canvas, Offset(s * 0.29, coinY), s * 0.06);
    _coin(canvas, Offset(s * 0.71, coinY), s * 0.06);
    if (showTitle) _ribbon(canvas, s);
    final pts = [
      const Offset(0.16, 0.24),
      const Offset(0.86, 0.3),
      const Offset(0.12, 0.6),
      const Offset(0.9, 0.62),
      const Offset(0.78, 0.12)
    ];
    for (var i = 0; i < pts.length; i++) {
      final tw = 0.6 + 0.4 * math.sin(t * 2 * math.pi * 2 + i * 1.4);
      _sparkle(canvas, Offset(pts[i].dx * s, pts[i].dy * s), s * 0.018 * tw,
          i.isEven ? const Color(0xFFFFE27A) : Colors.white);
    }
  }

  void _crown(Canvas canvas, Offset c, double w) {
    final h = w * 0.6;
    final crown = Path()
      ..moveTo(c.dx - w * 0.42, c.dy + h * 0.35)
      ..lineTo(c.dx - w * 0.5, c.dy - h * 0.45)
      ..lineTo(c.dx - w * 0.25, c.dy - h * 0.05)
      ..lineTo(c.dx, c.dy - h * 0.62)
      ..lineTo(c.dx + w * 0.25, c.dy - h * 0.05)
      ..lineTo(c.dx + w * 0.5, c.dy - h * 0.45)
      ..lineTo(c.dx + w * 0.42, c.dy + h * 0.35)
      ..close();
    canvas.drawPath(crown.shift(Offset(0, w * 0.03)),
        Paint()..color = const Color(0x55000000));
    canvas.drawPath(
        crown,
        _grad(crown.getBounds(), _goldColors,
            begin: Alignment.topLeft, end: Alignment.bottomRight));
    canvas.drawPath(
        crown,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = w * 0.025
          ..color = const Color(0xFFB07A12));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(c.dx, c.dy + h * 0.28),
                width: w * 0.86,
                height: h * 0.18),
            Radius.circular(h * 0.06)),
        _grad(Rect.fromLTWH(c.dx - w, c.dy, w * 2, h),
            const [Color(0xFFFFE27A), Color(0xFFD99A1A)]));
    for (final dx in [-0.5, 0.0, 0.5]) {
      final tip = Offset(c.dx + dx * w, c.dy - h * (dx == 0 ? 0.62 : 0.45));
      canvas.drawCircle(
          tip, w * 0.055, Paint()..color = const Color(0xFFFFF6C2));
    }
    canvas.drawCircle(Offset(c.dx, c.dy + h * 0.06), w * 0.07,
        Paint()..color = const Color(0xFFE23D5C));
    canvas.drawCircle(Offset(c.dx - w * 0.25, c.dy + h * 0.12), w * 0.045,
        Paint()..color = const Color(0xFF3D8BE2));
    canvas.drawCircle(Offset(c.dx + w * 0.25, c.dy + h * 0.12), w * 0.045,
        Paint()..color = const Color(0xFF1FA67A));
    canvas.drawCircle(Offset(c.dx - w * 0.02, c.dy + h * 0.03), w * 0.02,
        Paint()..color = Colors.white.withOpacity(0.8));
  }

  void _coin(Canvas canvas, Offset c, double r) {
    canvas.drawCircle(
        c + Offset(0, r * 0.12), r, Paint()..color = const Color(0xFFB07A12));
    canvas.drawCircle(
        c,
        r,
        _grad(Rect.fromCircle(center: c, radius: r), _goldColors,
            begin: Alignment.topLeft, end: Alignment.bottomRight));
    canvas.drawCircle(
        c,
        r * 0.72,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r * 0.1
          ..color = const Color(0x99B07A12));
    _star(canvas, c, r * 0.42, Paint()..color = const Color(0xFFB07A12));
    canvas.drawCircle(c + Offset(-r * 0.4, -r * 0.4), r * 0.16,
        Paint()..color = Colors.white.withOpacity(0.8));
  }

  void _ribbon(Canvas canvas, double s) {
    final y = s * 0.8;
    final hh = s * 0.13;
    final l = s * 0.08, r = s * 0.92;
    // Tails.
    for (final dir in [-1.0, 1.0]) {
      final x = dir < 0 ? l : r;
      final tail = Path()
        ..moveTo(x - dir * s * 0.02, y - hh * 0.25)
        ..lineTo(x + dir * s * 0.07, y - hh * 0.2)
        ..lineTo(x + dir * s * 0.035, y + hh * 0.2)
        ..lineTo(x + dir * s * 0.07, y + hh * 0.62)
        ..lineTo(x - dir * s * 0.02, y + hh * 0.55)
        ..close();
      canvas.drawPath(tail, Paint()..color = const Color(0xFF8A1530));
    }
    final band = Path()
      ..moveTo(l, y - hh / 2)
      ..quadraticBezierTo(s * 0.5, y - hh / 2 - s * 0.04, r, y - hh / 2)
      ..lineTo(r, y + hh / 2)
      ..quadraticBezierTo(s * 0.5, y + hh / 2 - s * 0.04, l, y + hh / 2)
      ..close();
    canvas.drawPath(band.shift(Offset(0, s * 0.01)),
        Paint()..color = const Color(0x55000000));
    canvas.drawPath(
        band,
        _grad(band.getBounds(),
            const [Color(0xFFE2486A), Color(0xFFB8283F), Color(0xFF8A1530)]));
    canvas.drawPath(
        band,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.008
          ..color = const Color(0xFFF7C948));
  }

  @override
  bool shouldRepaint(covariant _LogoFront old) =>
      old.t != t || old.showTitle != showTitle;
}
