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

/// Full-screen, tap-through celebration layer.
///
/// * When [acceptKey] changes (to a value > 0) the start-of-quest show plays:
///   the screen dims, golden light rays spin up, a "QUEST BEGINS!" jelly
///   banner unrolls letter by letter, the hero's own squishie ([heroLook])
///   hops in wearing its gear, and a 3-2-1-GO! countdown pops before a burst
///   of stars and confetti sends them off.
/// * When [coinKey] changes (to a value > 0) a burst of gold coins explodes
///   and rains from the top to the bottom of the screen with a
///   "QUEST COMPLETE!" banner.
class CelebrationOverlay extends StatefulWidget {
  const CelebrationOverlay({
    super.key,
    this.width,
    this.height,
    this.acceptKey,
    this.coinKey,
    this.heroLook,
  });

  final double? width;
  final double? height;
  final int? acceptKey;
  final int? coinKey;
  final String? heroLook;

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _start = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 4200),
  );
  late final AnimationController _coins = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3200),
  );

  @override
  void didUpdateWidget(covariant CelebrationOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((widget.acceptKey ?? 0) > 0 &&
        widget.acceptKey != oldWidget.acceptKey) {
      _start.forward(from: 0);
    }
    if ((widget.coinKey ?? 0) > 0 && widget.coinKey != oldWidget.coinKey) {
      _coins.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _start.dispose();
    _coins.dispose();
    super.dispose();
  }

  TextStyle _font(double size, Color color,
          {Paint? stroke, FontWeight weight = FontWeight.w700}) =>
      GoogleFonts.sniglet(
        fontSize: size,
        fontWeight: weight,
        height: 1.0,
        color: stroke == null ? color : null,
        foreground: stroke,
        decoration: TextDecoration.none,
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IgnorePointer(
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: AnimatedBuilder(
            animation: Listenable.merge([_start, _coins]),
            builder: (context, _) {
              final layers = <Widget>[];
              if (_coins.isAnimating) {
                layers.add(Positioned.fill(
                    child:
                        CustomPaint(painter: _CoinRainPainter(_coins.value))));
                layers.add(_bannerFor(
                    _coins.value * 1.15,
                    'QUEST COMPLETE!',
                    '🏆',
                    'Gold is on its way!',
                    const [
                      Color(0xFFFFF3B0),
                      Color(0xFFF2B53A),
                      Color(0xFFD79A1E)
                    ],
                    const Color(0xFF4A2E00)));
              }
              if (_start.isAnimating) layers.addAll(_questStart(_start.value));
              return Stack(clipBehavior: Clip.none, children: layers);
            },
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------ quest start
  List<Widget> _questStart(double p) {
    double seg(double a, double b) => ((p - a) / (b - a)).clamp(0.0, 1.0);
    final fadeOut = 1 - seg(0.88, 1.0);
    final layers = <Widget>[
      Positioned.fill(
          child: CustomPaint(painter: _StartBackPainter(p, fadeOut))),
    ];

    // Banner unrolls (0.06-0.3) and letters pop in one by one.
    final unroll = Curves.easeOutBack.transform(seg(0.06, 0.3));
    const title = 'QUEST BEGINS!';
    final letters = <Widget>[];
    for (var i = 0; i < title.length; i++) {
      final k = seg(0.16 + i * 0.012, 0.26 + i * 0.012);
      final pop = Curves.elasticOut.transform(k);
      final bob = math.sin(p * 22 + i * 0.7) * 2.0 * (k >= 1 ? 1 : 0);
      letters.add(Transform.translate(
        offset: Offset(0, bob),
        child: Transform.scale(
          scale: pop,
          child: Stack(children: [
            Text(title[i],
                style: _font(34, Colors.white,
                    stroke: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 7
                      ..strokeJoin = StrokeJoin.round
                      ..color = const Color(0xFF5A1F7A))),
            Text(title[i], style: _font(34, const Color(0xFFFFF4B0))),
          ]),
        ),
      ));
    }
    layers.add(Align(
      alignment: const Alignment(0, -0.52),
      child: Opacity(
        opacity: fadeOut,
        child: Transform.scale(
          scaleX: 0.05 + 0.95 * unroll,
          scaleY: 0.6 + 0.4 * unroll,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFD9B8FF),
                    Color(0xFF9A5CF0),
                    Color(0xFF7434D6)
                  ],
                  stops: [
                    0,
                    0.5,
                    1
                  ]),
              borderRadius: BorderRadius.circular(28),
              border:
                  Border.all(color: Colors.white.withOpacity(0.85), width: 3),
              boxShadow: const [
                BoxShadow(color: Color(0xFF4E1FA0), offset: Offset(0, 7)),
                BoxShadow(
                    color: Color(0x66000000),
                    blurRadius: 24,
                    offset: Offset(0, 12))
              ],
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              FittedBox(
                  child:
                      Row(mainAxisSize: MainAxisSize.min, children: letters)),
              const SizedBox(height: 6),
              Opacity(
                opacity: seg(0.3, 0.38),
                child: Text('Your squishie is ready for adventure!',
                    textAlign: TextAlign.center,
                    style: _font(16, Colors.white)),
              ),
            ]),
          ),
        ),
      ),
    ));

    // Hero squishie hops in from the left (0.22-0.5), then bounces in place.
    final hop = seg(0.22, 0.5);
    final x = -1.6 + 1.6 * Curves.easeOut.transform(hop);
    final hops = (hop * 3).floor();
    final hopK = (hop * 3) - hops;
    final arc = hop < 1
        ? math.sin(hopK * math.pi) * 0.12
        : (math.sin(p * 30).abs() * 0.04 * seg(0.5, 0.6));
    final go = seg(0.76, 0.84);
    final leap = go > 0 ? Curves.easeIn.transform(go) : 0.0;
    layers.add(Align(
      alignment: Alignment(x + leap * 1.8, 0.5 - arc * 2 - leap * 0.4),
      child: Opacity(
        opacity: fadeOut,
        child: Transform.rotate(
          angle: hop < 1 ? math.sin(hopK * math.pi) * 0.15 : leap * 0.4,
          child: SizedBox(
            width: 170,
            height: 170,
            child: SquishyAvatar(
              width: 170,
              height: 170,
              look: (widget.heroLook ?? '').isEmpty
                  ? 'species:dumpling|hat:helm|gear:sword'
                  : widget.heroLook,
              animate: true,
              showBackground: false,
            ),
          ),
        ),
      ),
    ));

    // 3-2-1-GO! countdown jelly bubbles (0.5-0.86).
    const counts = ['3', '2', '1', 'GO!'];
    const bubbleColors = [
      Color(0xFFFF7FA8),
      Color(0xFF7FC8FF),
      Color(0xFF8FE3A6),
      Color(0xFFFFC93C)
    ];
    for (var i = 0; i < counts.length; i++) {
      final a = 0.5 + i * 0.075;
      final k = seg(a, a + 0.09);
      if (k <= 0 || k >= 1) continue;
      final pop = k < 0.4
          ? Curves.elasticOut.transform(k / 0.4)
          : 1.0 + (k - 0.4) * 0.6;
      final alpha = k < 0.75 ? 1.0 : (1 - (k - 0.75) / 0.25);
      final isGo = i == 3;
      final size = isGo ? 150.0 : 120.0;
      layers.add(Align(
        alignment: const Alignment(0, -0.12),
        child: Opacity(
          opacity: alpha.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: pop,
            child: Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    center: const Alignment(-0.35, -0.45),
                    colors: [
                      Color.lerp(bubbleColors[i], Colors.white, 0.55)!,
                      bubbleColors[i],
                      Color.lerp(bubbleColors[i], Colors.black, 0.2)!
                    ],
                    stops: const [
                      0,
                      0.55,
                      1
                    ]),
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                      color: Color.lerp(bubbleColors[i], Colors.black, 0.35)!,
                      offset: const Offset(0, 6))
                ],
              ),
              child: Stack(alignment: Alignment.center, children: [
                Text(counts[i],
                    style: _font(isGo ? 52 : 64, Colors.white,
                        stroke: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 8
                          ..strokeJoin = StrokeJoin.round
                          ..color = const Color(0xFF3A1A5C))),
                Text(counts[i], style: _font(isGo ? 52 : 64, Colors.white)),
              ]),
            ),
          ),
        ),
      ));
    }

    // Star + confetti burst on GO!
    if (p > 0.74) {
      layers.add(Positioned.fill(
          child: CustomPaint(painter: _StarShowerPainter(seg(0.74, 1.0)))));
      layers.add(Positioned.fill(
          child: CustomPaint(painter: _ConfettiPainter(seg(0.74, 1.0)))));
    }
    return layers;
  }

  Widget _bannerFor(double p, String title, String icon, String sub,
      List<Color> colors, Color text) {
    if (p >= 1) return const SizedBox.shrink();
    double dx;
    double scale;
    if (p < 0.22) {
      final k = Curves.elasticOut.transform(p / 0.22);
      dx = (1 - k) * -1.3;
      scale = 0.6 + 0.4 * k;
    } else if (p < 0.78) {
      dx = 0;
      scale = 1 + 0.03 * math.sin((p - 0.22) * 18);
    } else {
      final k = Curves.easeIn.transform((p - 0.78) / 0.22);
      dx = k * 1.3;
      scale = 1 - 0.2 * k;
    }
    return Align(
      alignment: const Alignment(0, -0.3),
      child: FractionalTranslation(
        translation: Offset(dx, 0),
        child: Transform.scale(
          scale: scale,
          child: Transform.rotate(
            angle: -0.04,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(26),
                border:
                    Border.all(color: Colors.white.withOpacity(0.9), width: 4),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 24,
                      offset: Offset(0, 8))
                ],
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(icon, style: const TextStyle(fontSize: 44)),
                Text(title,
                    textAlign: TextAlign.center,
                    style: _font(32, text).copyWith(letterSpacing: 1.2)),
                const SizedBox(height: 2),
                Text(sub, textAlign: TextAlign.center, style: _font(17, text)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dim vignette + spinning golden light rays behind the quest-start show.
class _StartBackPainter extends CustomPainter {
  _StartBackPainter(this.p, this.fade);
  final double p;
  final double fade;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    if (w <= 0 || h <= 0) return;
    final inK = (p / 0.1).clamp(0.0, 1.0);
    final a = inK * fade;
    final r = Offset.zero & size;
    canvas.drawRect(
        r,
        Paint()
          ..shader = RadialGradient(radius: 0.9, colors: [
            const Color(0xFF3A1A6B).withOpacity(0.45 * a),
            const Color(0xFF1A0B33).withOpacity(0.75 * a)
          ]).createShader(r));
    final c = Offset(w / 2, h * 0.38);
    final rays = 14;
    final spin = p * math.pi * 1.2;
    for (var i = 0; i < rays; i++) {
      final ang = spin + i * 2 * math.pi / rays;
      final path = Path()
        ..moveTo(c.dx, c.dy)
        ..lineTo(
            c.dx + math.cos(ang - 0.09) * h, c.dy + math.sin(ang - 0.09) * h)
        ..lineTo(
            c.dx + math.cos(ang + 0.09) * h, c.dy + math.sin(ang + 0.09) * h)
        ..close();
      canvas.drawPath(
          path,
          Paint()
            ..color =
                (i.isEven ? const Color(0xFFFFE27A) : const Color(0xFFFF9ECF))
                    .withOpacity(0.16 * a));
    }
    canvas.drawCircle(
        c,
        w * 0.45,
        Paint()
          ..shader = RadialGradient(colors: [
            const Color(0xFFFFF3B0).withOpacity(0.35 * a),
            const Color(0x00FFF3B0)
          ]).createShader(Rect.fromCircle(center: c, radius: w * 0.45)));
    // Rising jelly bubbles.
    const tints = [
      Color(0xFFFF9ECF),
      Color(0xFFB79CFF),
      Color(0xFF8FD3FF),
      Color(0xFFFFE27A)
    ];
    for (var i = 0; i < 14; i++) {
      final ph = (p * 1.6 + i / 14) % 1.0;
      final x = w * (0.05 + 0.9 * ((i * 37) % 13) / 12);
      final y = h * (1.05 - 1.1 * ph);
      final rr = w * (0.015 + (i % 3) * 0.01);
      canvas.drawCircle(
          Offset(x, y), rr, Paint()..color = tints[i % 4].withOpacity(0.5 * a));
      canvas.drawCircle(Offset(x - rr * 0.35, y - rr * 0.35), rr * 0.25,
          Paint()..color = Colors.white.withOpacity(0.8 * a));
    }
  }

  @override
  bool shouldRepaint(covariant _StartBackPainter old) =>
      old.p != p || old.fade != fade;
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter(this.p);
  final double p;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    const colors = [
      Color(0xFFFF6F91),
      Color(0xFFFFE27A),
      Color(0xFF7CC8FF),
      Color(0xFF8BE39A),
      Color(0xFFB79CFF)
    ];
    final rnd = math.Random(5);
    final fade = (p > 0.7 ? 1 - (p - 0.7) / 0.3 : 1.0).clamp(0.0, 1.0);
    for (var i = 0; i < 60; i++) {
      final a = -math.pi / 2 + (rnd.nextDouble() - 0.5) * math.pi * 1.4;
      final speed = h * (0.7 + rnd.nextDouble() * 0.7);
      final o = Offset(w / 2, h * 0.45);
      final pos = o +
          Offset(math.cos(a) * speed * p,
              math.sin(a) * speed * p + h * 1.1 * p * p);
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(p * 12 * (i.isEven ? 1 : -1) + i);
      canvas.drawRect(
          Rect.fromCenter(
              center: Offset.zero, width: w * 0.022, height: w * 0.011),
          Paint()..color = colors[i % colors.length].withOpacity(fade));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter old) => old.p != p;
}

class _CoinRainPainter extends CustomPainter {
  _CoinRainPainter(this.p);
  final double p;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    if (w <= 0 || h <= 0) return;
    const dur = 3.2;
    final time = p * dur;
    final g = h * 1.6;
    final rnd = math.Random(99);
    final fade = (p > 0.85 ? (1 - (p - 0.85) / 0.15) : 1.0).clamp(0.0, 1.0);
    if (p < 0.25) {
      final k = p / 0.25;
      final c = Offset(w / 2, h * 0.5);
      canvas.drawCircle(
          c,
          w * (0.2 + 0.8 * k),
          Paint()
            ..shader = RadialGradient(colors: [
              const Color(0xFFFFE27A).withOpacity(0.7 * (1 - k)),
              const Color(0x00FFE27A)
            ]).createShader(Rect.fromCircle(center: c, radius: w)));
    }
    for (var i = 0; i < 70; i++) {
      final burst = i < 30;
      final delay = burst ? rnd.nextDouble() * 0.15 : rnd.nextDouble() * 1.3;
      final tt = time - delay;
      final r = w * (0.03 + rnd.nextDouble() * 0.025);
      final spinSpeed = 6 + rnd.nextDouble() * 8;
      final phase = rnd.nextDouble() * 6;
      Offset pos;
      if (burst) {
        final a = -math.pi / 2 + (rnd.nextDouble() - 0.5) * math.pi * 1.1;
        final speed = h * (0.6 + rnd.nextDouble() * 0.6);
        final o = Offset(w / 2, h * 0.5);
        pos = o +
            Offset(math.cos(a) * speed * tt,
                math.sin(a) * speed * tt + 0.5 * g * tt * tt);
      } else {
        final x = rnd.nextDouble() * w;
        final y0 = -h * (0.05 + rnd.nextDouble() * 0.2);
        pos = Offset(x + math.sin(tt * 3 + phase) * w * 0.03,
            y0 + h * 0.25 * tt + 0.5 * g * 0.6 * tt * tt);
      }
      if (tt < 0 || pos.dy > h + r * 2) continue;
      _coin(canvas, pos, r,
          (math.cos(tt * spinSpeed + phase)).abs() * 0.9 + 0.1, fade);
    }
  }

  void _coin(Canvas canvas, Offset c, double r, double sx, double alpha) {
    canvas.save();
    canvas.translate(c.dx, c.dy);
    canvas.scale(sx, 1);
    final rect = Rect.fromCircle(center: Offset.zero, radius: r);
    canvas.drawCircle(Offset(r * 0.08, r * 0.08), r,
        Paint()..color = const Color(0xFFB07A12).withOpacity(alpha));
    canvas.drawCircle(
        Offset.zero,
        r,
        Paint()
          ..shader = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFFFF3B0).withOpacity(alpha),
                const Color(0xFFF2B53A).withOpacity(alpha),
                const Color(0xFFD79A1E).withOpacity(alpha)
              ]).createShader(rect));
    canvas.drawCircle(
        Offset.zero,
        r * 0.72,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r * 0.12
          ..color = const Color(0xFFB07A12).withOpacity(0.6 * alpha));
    canvas.drawCircle(Offset(-r * 0.35, -r * 0.35), r * 0.18,
        Paint()..color = Colors.white.withOpacity(0.7 * alpha));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _CoinRainPainter old) => old.p != p;
}

class _StarShowerPainter extends CustomPainter {
  _StarShowerPainter(this.p);
  final double p;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final c = Offset(w / 2, h * 0.45);
    const colors = [
      Color(0xFFFFD84D),
      Color(0xFFFFFFFF),
      Color(0xFFFF8FD0),
      Color(0xFFB79CFF),
      Color(0xFF7CE3C0)
    ];
    final rnd = math.Random(7);
    for (var i = 0; i < 32; i++) {
      final a = rnd.nextDouble() * math.pi * 2;
      final speed = w * (0.5 + rnd.nextDouble() * 0.7);
      final delay = rnd.nextDouble() * 0.1;
      final k = ((p - delay) / 0.8).clamp(0.0, 1.0);
      if (k <= 0 || k >= 1) continue;
      final pos = c +
          Offset(math.cos(a) * speed * k,
              math.sin(a) * speed * k + h * 0.25 * k * k);
      final s = w * (0.02 + rnd.nextDouble() * 0.02) * (1 - k * 0.5);
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(k * 6 * (i.isEven ? 1 : -1));
      final path = Path();
      for (var j = 0; j < 10; j++) {
        final rr = j.isEven ? s : s * 0.45;
        final aa = -math.pi / 2 + j * math.pi / 5;
        if (j == 0) {
          path.moveTo(math.cos(aa) * rr, math.sin(aa) * rr);
        } else {
          path.lineTo(math.cos(aa) * rr, math.sin(aa) * rr);
        }
      }
      path.close();
      canvas.drawPath(
          path, Paint()..color = colors[i % colors.length].withOpacity(1 - k));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _StarShowerPainter old) => old.p != p;
}
