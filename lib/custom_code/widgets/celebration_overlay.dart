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

/// Full-screen, tap-through celebration layer.
///
/// * When [acceptKey] changes (to a value > 0) a "QUEST ACCEPTED!" banner
///   swoops across the screen in a shower of stars.
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
  });

  final double? width;
  final double? height;
  final int? acceptKey;
  final int? coinKey;

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _banner = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2300),
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
      _banner.forward(from: 0);
    }
    if ((widget.coinKey ?? 0) > 0 && widget.coinKey != oldWidget.coinKey) {
      _coins.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _banner.dispose();
    _coins.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IgnorePointer(
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: AnimatedBuilder(
            animation: Listenable.merge([_banner, _coins]),
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
                    const Color(0xFF5A3A00)));
              }
              if (_banner.isAnimating) {
                layers.add(Positioned.fill(
                    child: CustomPaint(
                        painter: _StarShowerPainter(_banner.value))));
                layers.add(_bannerFor(
                    _banner.value,
                    'QUEST ACCEPTED!',
                    '⚔️',
                    'Go get it, brave hero!',
                    const [
                      Color(0xFF8A6CFF),
                      Color(0xFF5B3CC4),
                      Color(0xFF3E2490)
                    ],
                    Colors.white));
              }
              return Stack(clipBehavior: Clip.none, children: layers);
            },
          ),
        ),
      ),
    );
  }

  Widget _bannerFor(double p, String title, String icon, String sub,
      List<Color> colors, Color text) {
    if (p >= 1) return const SizedBox.shrink();
    // Swoop in (0-0.22), hold with a gentle bob, swoop out (0.78-1).
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
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFF2B53A), width: 4),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 24,
                      offset: Offset(0, 8))
                ],
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(icon, style: const TextStyle(fontSize: 44)),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: text,
                      letterSpacing: 1.2),
                ),
                const SizedBox(height: 2),
                Text(sub,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: text.withOpacity(0.9))),
              ]),
            ),
          ),
        ),
      ),
    );
  }
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
    // Golden flash at the start.
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
    final c = Offset(w / 2, h * 0.35);
    const colors = [
      Color(0xFFFFD84D),
      Color(0xFFFFFFFF),
      Color(0xFFFF8FD0),
      Color(0xFFB79CFF),
      Color(0xFF7CE3C0)
    ];
    final rnd = math.Random(7);
    for (var i = 0; i < 28; i++) {
      final a = rnd.nextDouble() * math.pi * 2;
      final speed = w * (0.5 + rnd.nextDouble() * 0.7);
      final delay = 0.12 + rnd.nextDouble() * 0.1;
      final k = ((p - delay) / 0.7).clamp(0.0, 1.0);
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
