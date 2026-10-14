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

/// Full-screen illustrated kingdom scene drawn in vector (crisp at any size).
///
/// [scene]: castle | dusk | night | throne | meadow | parchment.
class KingdomBackdrop extends StatefulWidget {
  const KingdomBackdrop({
    super.key,
    this.width,
    this.height,
    this.scene,
    this.animate,
  });

  final double? width;
  final double? height;
  final String? scene;
  final bool? animate;

  @override
  State<KingdomBackdrop> createState() => _KingdomBackdropState();
}

class _KingdomBackdropState extends State<KingdomBackdrop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 12),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate ?? false) _c.repeat();
  }

  @override
  void didUpdateWidget(covariant KingdomBackdrop oldWidget) {
    super.didUpdateWidget(oldWidget);
    final a = widget.animate ?? false;
    if (a && !_c.isAnimating) _c.repeat();
    if (!a && _c.isAnimating) _c.stop();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _c,
          builder: (context, _) => CustomPaint(
            painter:
                _KingdomPainter(scene: widget.scene ?? 'castle', t: _c.value),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

class _KingdomPainter extends CustomPainter {
  _KingdomPainter({required this.scene, required this.t});

  final String scene;
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    if (w <= 0 || h <= 0) return;
    final r = Offset.zero & size;
    switch (scene) {
      case 'dusk':
        _sky(canvas, r, const [
          Color(0xFF3B1C6B),
          Color(0xFF8E3B8F),
          Color(0xFFFF8A5C),
          Color(0xFFFFC77A)
        ], const [
          0,
          0.35,
          0.75,
          1
        ]);
        canvas.drawCircle(
            Offset(w * 0.7, h * 0.52),
            w * 0.22,
            Paint()
              ..shader = RadialGradient(colors: [
                const Color(0xFFFFE2A8),
                const Color(0xFFFFB46B).withOpacity(0)
              ]).createShader(Rect.fromCircle(
                  center: Offset(w * 0.7, h * 0.52), radius: w * 0.4)));
        canvas.drawCircle(Offset(w * 0.7, h * 0.52), w * 0.13,
            Paint()..color = const Color(0xFFFFE2A8));
        _stars(canvas, w, h * 0.35, 30, 0.6);
        _mountains(canvas, w, h, h * 0.62, const Color(0xFF6B2E6E), 3);
        _dragon(
            canvas,
            Offset(w * (0.25 + 0.05 * math.sin(t * 2 * math.pi)), h * 0.2),
            w * 0.16,
            const Color(0xFF2A1240));
        _dragon(canvas, Offset(w * 0.8, h * 0.12), w * 0.07,
            const Color(0xFF4A2160));
        _castle(
            canvas,
            Offset(w * 0.3, h * 0.82),
            w * 0.55,
            const Color(0xFF3A1A4F),
            const Color(0xFF240E33),
            const Color(0xFFFFB347));
        _hills(canvas, w, h, h * 0.84, const Color(0xFF2A1240), 0.2);
        _embers(canvas, w, h);
        break;
      case 'night':
        _sky(
            canvas,
            r,
            const [Color(0xFF0D1240), Color(0xFF26206B), Color(0xFF4B3A9B)],
            const [0, 0.6, 1]);
        _stars(canvas, w, h * 0.7, 90, 1);
        canvas.drawCircle(Offset(w * 0.78, h * 0.13), w * 0.11,
            Paint()..color = const Color(0xFFFFF3C4));
        canvas.drawCircle(Offset(w * 0.82, h * 0.115), w * 0.095,
            Paint()..color = const Color(0xFF131A4C));
        _mountains(canvas, w, h, h * 0.72, const Color(0xFF2B2A70), 2);
        _castle(
            canvas,
            Offset(w * 0.62, h * 0.84),
            w * 0.6,
            const Color(0xFF232766),
            const Color(0xFF141844),
            const Color(0xFFFFD86B));
        _hills(canvas, w, h, h * 0.86, const Color(0xFF151A47), 0.1);
        break;
      case 'throne':
        _sky(canvas, r, const [Color(0xFF7A1530), Color(0xFF4A0B1E)],
            const [0, 1]);
        _diamondPattern(canvas, w, h, const Color(0x22F4C542));
        for (final x in [0.1, 0.9]) {
          _banner(canvas, Offset(w * x, 0), w * 0.16, h * 0.38);
        }
        canvas.drawRect(Rect.fromLTWH(0, h * 0.86, w, h * 0.14),
            Paint()..color = const Color(0xFF3A0817));
        canvas.drawRect(
            Rect.fromLTWH(w * 0.32, h * 0.86, w * 0.36, h * 0.14),
            Paint()
              ..shader = const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFD7263D), Color(0xFF9C1F3A)])
                  .createShader(Rect.fromLTWH(0, h * 0.86, w, h * 0.14)));
        canvas.drawRect(Rect.fromLTWH(w * 0.32, h * 0.86, w * 0.36, h * 0.006),
            Paint()..color = const Color(0xFFF4C542));
        _throneChair(canvas, Offset(w * 0.5, h * 0.9), w * 0.42);
        _sparkleField(canvas, w, h, const Color(0xFFF4C542));
        break;
      case 'meadow':
        _sky(
            canvas,
            r,
            const [Color(0xFF9ED9FF), Color(0xFFDDF3FF), Color(0xFFF4FBFF)],
            const [0, 0.5, 1]);
        canvas.drawCircle(Offset(w * 0.82, h * 0.1), w * 0.09,
            Paint()..color = const Color(0xFFFFE27A));
        _cloud(canvas, Offset(w * ((0.2 + t * 0.6) % 1.2 - 0.1), h * 0.12),
            w * 0.08);
        _cloud(canvas, Offset(w * ((0.7 + t * 0.4) % 1.2 - 0.1), h * 0.22),
            w * 0.06);
        _hills(canvas, w, h, h * 0.72, const Color(0xFFB6EBA8), 0.5);
        _hills(canvas, w, h, h * 0.8, const Color(0xFF8DDA8F), 0.2);
        _hills(canvas, w, h, h * 0.9, const Color(0xFF6CC27A), 0.7);
        _flowers(canvas, w, h);
        break;
      case 'parchment':
        _sky(canvas, r, const [Color(0xFFFBF5E6), Color(0xFFF3E7CC)],
            const [0, 1]);
        _diamondPattern(canvas, w, h, const Color(0x14A0782D));
        canvas.drawRect(
            r,
            Paint()
              ..shader = RadialGradient(radius: 0.95, colors: [
                Colors.transparent,
                const Color(0xFFD9BF8C).withOpacity(0.45)
              ], stops: const [
                0.6,
                1
              ]).createShader(r));
        _crestWatermark(canvas, Offset(w * 0.5, h * 0.93), w * 0.22);
        break;
      case 'questboard':
        _dayBase(canvas, r, w, h);
        _mountains(canvas, w, h, h * 0.62, const Color(0xFFB9B3E6), 2);
        _castle(
            canvas,
            Offset(w * 0.78, h * 0.66),
            w * 0.38,
            const Color(0xFFE9E2FF),
            const Color(0xFF8E7CC3),
            const Color(0xFFF4C542));
        _hills(canvas, w, h, h * 0.68, const Color(0xFF9EDC92), 0.3);
        _noticeBoard(
            canvas, Rect.fromLTWH(w * 0.08, h * 0.6, w * 0.84, h * 0.25));
        _hills(canvas, w, h, h * 0.92, const Color(0xFF6CC27A), 0.7);
        _flowers(canvas, w, h);
        break;
      case 'forge':
        _wall(canvas, r, const Color(0xFF5A3E36), const Color(0xFF2E1F1C),
            const Color(0x22000000));
        _torch(canvas, Offset(w * 0.12, h * 0.3), w);
        _torch(canvas, Offset(w * 0.88, h * 0.3), w);
        _toolRack(canvas, Rect.fromLTWH(w * 0.25, h * 0.12, w * 0.5, h * 0.14));
        _floor(canvas, w, h, h * 0.8, const Color(0xFF4A3530),
            const Color(0xFF2A1C18));
        _furnace(canvas, Rect.fromLTWH(w * 0.55, h * 0.52, w * 0.42, h * 0.3));
        _anvil(canvas, Offset(w * 0.3, h * 0.8), w * 0.42);
        _sparksUp(
            canvas, Offset(w * 0.3, h * 0.66), w, h, const Color(0xFFFFB347));
        break;
      case 'tournament':
        _dayBase(canvas, r, w, h);
        _mountains(canvas, w, h, h * 0.6, const Color(0xFFB9B3E6), 4);
        _hills(canvas, w, h, h * 0.66, const Color(0xFFA8E39B), 0.5);
        _tent(canvas, Offset(w * 0.2, h * 0.76), w * 0.32, h * 0.16,
            const Color(0xFFE23D5C), Colors.white);
        _tent(canvas, Offset(w * 0.8, h * 0.76), w * 0.32, h * 0.16,
            const Color(0xFF3D5BD9), Colors.white);
        _tent(canvas, Offset(w * 0.5, h * 0.72), w * 0.36, h * 0.19,
            const Color(0xFF7B5CE0), const Color(0xFFF2B53A));
        _hills(canvas, w, h, h * 0.84, const Color(0xFF8ED48A), 0.2);
        _fence(canvas, w, h * 0.87);
        for (final x in [0.08, 0.36, 0.64, 0.92]) {
          _shieldPost(canvas, Offset(w * x, h * 0.92), w * 0.1,
              x < 0.5 ? const Color(0xFFE23D5C) : const Color(0xFF3D5BD9));
        }
        break;
      case 'treasury':
        _wall(canvas, r, const Color(0xFF5B4128), const Color(0xFF2E2014),
            const Color(0x22000000));
        _vaultArch(canvas, Rect.fromLTWH(w * 0.2, h * 0.36, w * 0.6, h * 0.46));
        _floor(canvas, w, h, h * 0.82, const Color(0xFF4A3520),
            const Color(0xFF2A1C10));
        _coinPile(canvas, Offset(w * 0.18, h * 0.86), w * 0.3, 5);
        _coinPile(canvas, Offset(w * 0.84, h * 0.88), w * 0.26, 4);
        _chest(canvas, Rect.fromLTWH(w * 0.36, h * 0.72, w * 0.28, h * 0.12));
        _book(canvas, Rect.fromLTWH(w * 0.08, h * 0.9, w * 0.3, h * 0.07));
        _sparkleField(canvas, w, h, const Color(0xFFFFD84D));
        break;
      case 'market':
        _dayBase(canvas, r, w, h);
        _mountains(canvas, w, h, h * 0.6, const Color(0xFFB9B3E6), 5);
        _castle(
            canvas,
            Offset(w * 0.5, h * 0.64),
            w * 0.42,
            const Color(0xFFE9E2FF),
            const Color(0xFF8E7CC3),
            const Color(0xFFF4C542));
        _bunting(canvas, w, h * 0.06);
        canvas.drawRect(
            Rect.fromLTWH(0, h * 0.64, w, h * 0.36),
            Paint()
              ..shader = const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFE9DCC0), Color(0xFFCDB894)])
                  .createShader(Rect.fromLTWH(0, h * 0.64, w, h * 0.36)));
        _cobbles(canvas, w, h, h * 0.66);
        _stall(canvas, Rect.fromLTWH(w * 0.02, h * 0.68, w * 0.46, h * 0.2),
            const Color(0xFFE23D5C), 0);
        _stall(canvas, Rect.fromLTWH(w * 0.52, h * 0.7, w * 0.46, h * 0.2),
            const Color(0xFF1FA67A), 1);
        break;
      case 'clocktower':
        _sky(
            canvas,
            r,
            const [Color(0xFF8FB8FF), Color(0xFFC9B6FF), Color(0xFFFFD6B8)],
            const [0, 0.55, 1]);
        _cloud(canvas, Offset(w * ((0.2 + t * 0.5) % 1.3 - 0.15), h * 0.12),
            w * 0.08);
        _cloud(canvas, Offset(w * ((0.7 + t * 0.3) % 1.3 - 0.15), h * 0.22),
            w * 0.06);
        _hills(canvas, w, h, h * 0.78, const Color(0xFFA8E39B), 0.5);
        _clockTower(canvas, Offset(w * 0.5, h * 0.86), w * 0.36, h * 0.6);
        _cottage(canvas, Offset(w * 0.14, h * 0.86), w * 0.2);
        _cottage(canvas, Offset(w * 0.86, h * 0.87), w * 0.18);
        _hills(canvas, w, h, h * 0.88, const Color(0xFF6CC27A), 0.7);
        _flowers(canvas, w, h);
        break;
      case 'mint':
        _wall(canvas, r, const Color(0xFF6B4A2E), const Color(0xFF3A2614),
            const Color(0x22000000));
        _fallingCoins(canvas, w, h);
        _floor(canvas, w, h, h * 0.84, const Color(0xFF4A3520),
            const Color(0xFF2A1C10));
        _coinPress(canvas, Offset(w * 0.5, h * 0.86), w * 0.6, h * 0.42);
        _coinStack(canvas, Offset(w * 0.12, h * 0.9), w * 0.07, 7);
        _coinStack(canvas, Offset(w * 0.22, h * 0.92), w * 0.07, 4);
        _coinStack(canvas, Offset(w * 0.86, h * 0.91), w * 0.07, 6);
        break;
      case 'tailor':
        _wall(canvas, r, const Color(0xFFF1E8FF), const Color(0xFFD9CBF5),
            const Color(0x14000000));
        _shelfOfFabric(
            canvas, Rect.fromLTWH(w * 0.04, h * 0.1, w * 0.92, h * 0.12));
        _shelfOfFabric(
            canvas, Rect.fromLTWH(w * 0.04, h * 0.26, w * 0.92, h * 0.12));
        _floor(canvas, w, h, h * 0.84, const Color(0xFFC9A27E),
            const Color(0xFF9C7656));
        _dressForm(canvas, Offset(w * 0.72, h * 0.86), w * 0.34, h * 0.34);
        _spools(canvas, Offset(w * 0.12, h * 0.9), w);
        _measuringTape(canvas, w, h);
        break;
      case 'gears':
        _wall(canvas, r, const Color(0xFF3A4170), const Color(0xFF1A1E3A),
            const Color(0x22000000));
        _gear(canvas, Offset(w * 0.22, h * 0.22), w * 0.2, 12,
            const Color(0xFFC9A66B), t * 2 * math.pi);
        _gear(canvas, Offset(w * 0.52, h * 0.32), w * 0.13, 9,
            const Color(0xFFF2B53A), -t * 2 * math.pi * 1.4);
        _gear(canvas, Offset(w * 0.82, h * 0.18), w * 0.16, 10,
            const Color(0xFFB0B8C8), -t * 2 * math.pi * 1.2);
        _gear(canvas, Offset(w * 0.8, h * 0.78), w * 0.24, 14,
            const Color(0xFFC9A66B), t * 2 * math.pi * 0.8);
        _gear(canvas, Offset(w * 0.45, h * 0.86), w * 0.15, 10,
            const Color(0xFFB0B8C8), -t * 2 * math.pi * 1.3);
        _pendulum(canvas, Offset(w * 0.18, h * 0.5), h * 0.36, w);
        break;
      case 'treasure':
        _sky(
            canvas,
            r,
            const [Color(0xFF2A1640), Color(0xFF4A2B3A), Color(0xFF6B3E24)],
            const [0, 0.6, 1]);
        _caveRocks(canvas, w, h);
        _goldMound(canvas, w, h);
        _chest(canvas, Rect.fromLTWH(w * 0.32, h * 0.7, w * 0.36, h * 0.15));
        _gems(canvas, w, h);
        _sparkleField(canvas, w, h, const Color(0xFFFFD84D));
        break;
      case 'mirror':
        _wall(canvas, r, const Color(0xFFFFE6F0), const Color(0xFFF1D3FF),
            const Color(0x10000000));
        _diamondPattern(canvas, w, h, const Color(0x18B07BFF));
        _mirror(
            canvas,
            Rect.fromCenter(
                center: Offset(w * 0.5, h * 0.5),
                width: w * 0.62,
                height: h * 0.46));
        _curtain(canvas, w, h, left: true);
        _curtain(canvas, w, h, left: false);
        _floor(canvas, w, h, h * 0.86, const Color(0xFFC9A27E),
            const Color(0xFF9C7656));
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(w * 0.5, h * 0.93),
                width: w * 0.8,
                height: h * 0.08),
            Paint()..color = const Color(0xFFD7263D));
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(w * 0.5, h * 0.93),
                width: w * 0.66,
                height: h * 0.055),
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = w * 0.008
              ..color = const Color(0xFFF2B53A));
        break;
      case 'toyshop':
        _wall(canvas, r, const Color(0xFFFFF4DE), const Color(0xFFF6DDB8),
            const Color(0x12000000));
        _awning(canvas, Rect.fromLTWH(0, 0, w, h * 0.07),
            const Color(0xFFE23D5C), Colors.white);
        _squishyShelf(
            canvas, Rect.fromLTWH(w * 0.04, h * 0.14, w * 0.92, h * 0.13), 0);
        _squishyShelf(
            canvas, Rect.fromLTWH(w * 0.04, h * 0.32, w * 0.92, h * 0.13), 1);
        _floor(canvas, w, h, h * 0.84, const Color(0xFFE9DCC0),
            const Color(0xFFCDB894));
        _checkerFloor(canvas, w, h, h * 0.84);
        _candyJars(canvas, w, h);
        break;
      case 'road':
        _dayBase(canvas, r, w, h);
        _mountains(canvas, w, h, h * 0.42, const Color(0xFFB9B3E6), 6);
        _hills(canvas, w, h, h * 0.44, const Color(0xFFBDEBA8), 0.4);
        _castle(
            canvas,
            Offset(w * 0.62, h * 0.4),
            w * 0.42,
            const Color(0xFFE9E2FF),
            const Color(0xFF8E7CC3),
            const Color(0xFFF4C542));
        _hills(canvas, w, h, h * 0.5, const Color(0xFF9EDC92), 0.6);
        _windingRoad(canvas, w, h);
        _chest(canvas, Rect.fromLTWH(w * 0.5, h * 0.45, w * 0.16, h * 0.06));
        for (final p in [
          const Offset(0.12, 0.58),
          const Offset(0.86, 0.66),
          const Offset(0.16, 0.8),
          const Offset(0.9, 0.86)
        ]) {
          _tree(canvas, Offset(w * p.dx, h * p.dy), w * 0.09);
        }
        _signpost(canvas, Offset(w * 0.78, h * 0.95), w);
        _flowers(canvas, w, h);
        break;
      default: // castle (bright day)
        _sky(
            canvas,
            r,
            const [Color(0xFF7CC6FF), Color(0xFFB9E2FF), Color(0xFFEAF6FF)],
            const [0, 0.45, 1]);
        canvas.drawCircle(
            Offset(w * 0.15, h * 0.08),
            w * 0.18,
            Paint()
              ..shader = RadialGradient(colors: [
                const Color(0xFFFFF4C2),
                const Color(0xFFFFF4C2).withOpacity(0)
              ]).createShader(Rect.fromCircle(
                  center: Offset(w * 0.15, h * 0.08), radius: w * 0.18)));
        _cloud(canvas, Offset(w * ((0.25 + t * 0.5) % 1.3 - 0.15), h * 0.1),
            w * 0.09);
        _cloud(canvas, Offset(w * ((0.75 + t * 0.35) % 1.3 - 0.15), h * 0.2),
            w * 0.065);
        _mountains(canvas, w, h, h * 0.66, const Color(0xFFB9B3E6), 2);
        _castle(
            canvas,
            Offset(w * 0.6, h * 0.8),
            w * 0.7,
            const Color(0xFFE9E2FF),
            const Color(0xFF8E7CC3),
            const Color(0xFFF4C542));
        _hills(canvas, w, h, h * 0.8, const Color(0xFF9EDC92), 0.3);
        _hills(canvas, w, h, h * 0.88, const Color(0xFF6CC27A), 0.7);
        _flowers(canvas, w, h);
    }
  }

  void _sky(Canvas canvas, Rect r, List<Color> colors, List<double> stops) {
    canvas.drawRect(
        r,
        Paint()
          ..shader = LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors,
                  stops: stops)
              .createShader(r));
  }

  void _stars(Canvas canvas, double w, double maxY, int n, double strength) {
    final rnd = math.Random(42);
    for (var i = 0; i < n; i++) {
      final p = Offset(rnd.nextDouble() * w, rnd.nextDouble() * maxY);
      final tw =
          0.35 + 0.65 * (0.5 + 0.5 * math.sin(t * 2 * math.pi * 3 + i * 2.1));
      final rad = (0.6 + rnd.nextDouble() * 1.6) * (w / 400);
      canvas.drawCircle(
          p, rad, Paint()..color = Colors.white.withOpacity(tw * strength));
    }
  }

  void _cloud(Canvas canvas, Offset c, double r) {
    final p = Paint()..color = Colors.white.withOpacity(0.92);
    canvas.drawCircle(c, r, p);
    canvas.drawCircle(c + Offset(-r * 0.95, r * 0.35), r * 0.7, p);
    canvas.drawCircle(c + Offset(r * 0.95, r * 0.3), r * 0.78, p);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(c.dx - r * 1.6, c.dy + r * 0.15, r * 3.2, r * 0.8),
            Radius.circular(r * 0.4)),
        p);
  }

  void _mountains(
      Canvas canvas, double w, double h, double base, Color c, int seed) {
    final rnd = math.Random(seed);
    final p = Path()
      ..moveTo(0, h)
      ..lineTo(0, base);
    var x = 0.0;
    while (x < w) {
      final peakW = w * (0.18 + rnd.nextDouble() * 0.14);
      final peakH = h * (0.08 + rnd.nextDouble() * 0.1);
      p.lineTo(x + peakW / 2, base - peakH);
      p.lineTo(x + peakW, base);
      x += peakW;
    }
    p
      ..lineTo(w, h)
      ..close();
    canvas.drawPath(p, Paint()..color = c);
  }

  void _hills(
      Canvas canvas, double w, double h, double y, Color c, double phase) {
    final p = Path()
      ..moveTo(0, h)
      ..lineTo(0, y);
    p.cubicTo(w * (0.2 + phase * 0.2), y - h * 0.07, w * (0.6 - phase * 0.2),
        y + h * 0.04, w, y - h * 0.03);
    p
      ..lineTo(w, h)
      ..close();
    canvas.drawPath(p, Paint()..color = c);
  }

  void _castle(Canvas canvas, Offset base, double width, Color wall, Color dark,
      Color accent) {
    final hgt = width * 0.5;
    final left = base.dx - width / 2;
    final top = base.dy - hgt;
    final wallPaint = Paint()..color = wall;
    final shade = Paint()..color = Color.lerp(wall, dark, 0.35)!;
    canvas.drawRect(
        Rect.fromLTWH(
            left + width * 0.18, top + hgt * 0.32, width * 0.64, hgt * 0.68),
        wallPaint);
    canvas.drawRect(
        Rect.fromLTWH(
            left + width * 0.18, top + hgt * 0.32, width * 0.64, hgt * 0.08),
        shade);
    for (var i = 0; i < 8; i++) {
      canvas.drawRect(
          Rect.fromLTWH(left + width * 0.18 + i * width * 0.083,
              top + hgt * 0.25, width * 0.045, hgt * 0.08),
          wallPaint);
    }
    final towers = [
      (0.1, 0.16, 0.9),
      (0.9, 0.16, 0.9),
      (0.5, 0.2, 1.15),
      (0.32, 0.12, 0.7),
      (0.68, 0.12, 0.7)
    ];
    for (final tw in towers) {
      final twW = width * tw.$2;
      final th = hgt * tw.$3;
      final x = left + width * tw.$1 - twW / 2;
      canvas.drawRect(Rect.fromLTWH(x, base.dy - th, twW, th), wallPaint);
      canvas.drawRect(
          Rect.fromLTWH(x + twW * 0.75, base.dy - th, twW * 0.25, th), shade);
      final roof = Path()
        ..moveTo(x - twW * 0.14, base.dy - th)
        ..lineTo(x + twW / 2, base.dy - th - twW * 1.1)
        ..lineTo(x + twW * 1.14, base.dy - th)
        ..close();
      canvas.drawPath(
          roof,
          Paint()
            ..shader = LinearGradient(
                    colors: [const Color(0xFFE2486A), const Color(0xFF9C1F3A)])
                .createShader(roof.getBounds()));
      final fx = x + twW / 2;
      final fy = base.dy - th - twW * 1.1;
      canvas.drawLine(
          Offset(fx, fy),
          Offset(fx, fy - twW * 0.55),
          Paint()
            ..color = dark
            ..strokeWidth = math.max(1, width * 0.006));
      final wave = math.sin(t * 2 * math.pi * 4 + tw.$1 * 7) * twW * 0.08;
      canvas.drawPath(
          Path()
            ..moveTo(fx, fy - twW * 0.55)
            ..quadraticBezierTo(fx + twW * 0.3, fy - twW * 0.55 + wave,
                fx + twW * 0.55, fy - twW * 0.45)
            ..lineTo(fx, fy - twW * 0.32)
            ..close(),
          Paint()..color = accent);
      canvas.drawRRect(
          RRect.fromRectAndCorners(
              Rect.fromLTWH(
                  x + twW * 0.36, base.dy - th * 0.72, twW * 0.28, twW * 0.42),
              topLeft: Radius.circular(twW * 0.14),
              topRight: Radius.circular(twW * 0.14)),
          Paint()..color = dark);
    }
    canvas.drawRRect(
      RRect.fromRectAndCorners(
          Rect.fromLTWH(base.dx - width * 0.075, base.dy - hgt * 0.36,
              width * 0.15, hgt * 0.36),
          topLeft: Radius.circular(width * 0.075),
          topRight: Radius.circular(width * 0.075)),
      Paint()..color = dark,
    );
  }

  void _dragon(Canvas canvas, Offset c, double w, Color color) {
    final flap = math.sin(t * 2 * math.pi * 6) * w * 0.25;
    final paint = Paint()..color = color;
    final body = Path()
      ..moveTo(c.dx - w * 1.1, c.dy + w * 0.1)
      ..quadraticBezierTo(c.dx - w * 0.5, c.dy - w * 0.05, c.dx, c.dy)
      ..quadraticBezierTo(
          c.dx + w * 0.45, c.dy - w * 0.02, c.dx + w * 0.75, c.dy - w * 0.22)
      ..lineTo(c.dx + w * 0.95, c.dy - w * 0.2)
      ..lineTo(c.dx + w * 0.78, c.dy - w * 0.08)
      ..quadraticBezierTo(
          c.dx + w * 0.4, c.dy + w * 0.16, c.dx, c.dy + w * 0.13)
      ..quadraticBezierTo(
          c.dx - w * 0.6, c.dy + w * 0.15, c.dx - w * 1.1, c.dy + w * 0.1)
      ..close();
    canvas.drawPath(body, paint);
    final wing = Path()
      ..moveTo(c.dx - w * 0.15, c.dy + w * 0.02)
      ..lineTo(c.dx - w * 0.45, c.dy - w * 0.55 - flap)
      ..lineTo(c.dx - w * 0.1, c.dy - w * 0.38 - flap)
      ..lineTo(c.dx + w * 0.05, c.dy - w * 0.6 - flap)
      ..lineTo(c.dx + w * 0.3, c.dy - w * 0.05)
      ..close();
    canvas.drawPath(wing, paint);
  }

  void _embers(Canvas canvas, double w, double h) {
    for (var i = 0; i < 18; i++) {
      final phase = (t * 3 + i / 18) % 1.0;
      final x = w * ((i * 0.137) % 1.0) + math.sin(phase * 8 + i) * w * 0.02;
      final y = h * (1.0 - 0.6 * phase);
      canvas.drawCircle(Offset(x, y), w * 0.005,
          Paint()..color = const Color(0xFFFFB347).withOpacity(1 - phase));
    }
  }

  void _flowers(Canvas canvas, double w, double h) {
    final rnd = math.Random(9);
    const colors = [
      Color(0xFFFF8FB1),
      Color(0xFFFFFFFF),
      Color(0xFFFFE27A),
      Color(0xFFB79CFF)
    ];
    for (var i = 0; i < 26; i++) {
      final p =
          Offset(rnd.nextDouble() * w, h * (0.9 + rnd.nextDouble() * 0.09));
      final r = w * 0.008;
      for (var k = 0; k < 5; k++) {
        final a = k * 2 * math.pi / 5;
        canvas.drawCircle(p + Offset(math.cos(a), math.sin(a)) * r, r * 0.85,
            Paint()..color = colors[i % colors.length]);
      }
      canvas.drawCircle(p, r * 0.6, Paint()..color = const Color(0xFFFFC94D));
    }
  }

  void _diamondPattern(Canvas canvas, double w, double h, Color c) {
    final step = w / 7;
    final p = Paint()..color = c;
    var row = 0;
    for (var y = 0.0; y < h + step; y += step * 0.6) {
      for (var x = (row.isOdd ? step / 2 : 0.0); x < w + step; x += step) {
        canvas.drawPath(
            Path()
              ..moveTo(x, y - step * 0.18)
              ..lineTo(x + step * 0.12, y)
              ..lineTo(x, y + step * 0.18)
              ..lineTo(x - step * 0.12, y)
              ..close(),
            p);
      }
      row++;
    }
  }

  void _banner(Canvas canvas, Offset top, double bw, double bh) {
    final rect = Rect.fromLTWH(top.dx - bw / 2, top.dy, bw, bh);
    final path = Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.center.dx, rect.bottom - bw * 0.35)
      ..lineTo(rect.left, rect.bottom)
      ..close();
    canvas.drawPath(
        path,
        Paint()
          ..shader = const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF9C1F3A),
                Color(0xFFD7263D),
                Color(0xFF9C1F3A)
              ]).createShader(rect));
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = bw * 0.05
          ..color = const Color(0xFFF4C542));
    _star(canvas, Offset(rect.center.dx, rect.top + bh * 0.45), bw * 0.22,
        Paint()..color = const Color(0xFFF4C542));
  }

  void _sparkleField(Canvas canvas, double w, double h, Color c) {
    final rnd = math.Random(17);
    for (var i = 0; i < 14; i++) {
      final p = Offset(rnd.nextDouble() * w, rnd.nextDouble() * h * 0.8);
      final tw = 0.3 + 0.7 * (0.5 + 0.5 * math.sin(t * 2 * math.pi * 3 + i));
      final r = w * 0.008 * (0.6 + tw);
      canvas.drawPath(
          Path()
            ..moveTo(p.dx, p.dy - r * 2)
            ..quadraticBezierTo(p.dx, p.dy, p.dx + r * 2, p.dy)
            ..quadraticBezierTo(p.dx, p.dy, p.dx, p.dy + r * 2)
            ..quadraticBezierTo(p.dx, p.dy, p.dx - r * 2, p.dy)
            ..quadraticBezierTo(p.dx, p.dy, p.dx, p.dy - r * 2)
            ..close(),
          Paint()..color = c.withOpacity(tw * 0.8));
    }
  }

  void _crestWatermark(Canvas canvas, Offset c, double size) {
    final w = size, h = size * 1.2;
    final shield = Path()
      ..moveTo(c.dx - w / 2, c.dy - h / 2)
      ..lineTo(c.dx + w / 2, c.dy - h / 2)
      ..lineTo(c.dx + w / 2, c.dy)
      ..quadraticBezierTo(c.dx + w / 2, c.dy + h * 0.35, c.dx, c.dy + h / 2)
      ..quadraticBezierTo(c.dx - w / 2, c.dy + h * 0.35, c.dx - w / 2, c.dy)
      ..close();
    canvas.drawPath(shield, Paint()..color = const Color(0x12A0782D));
    canvas.drawPath(
        shield,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size * 0.03
          ..color = const Color(0x22A0782D));
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

  // ===================================================================== v4 scene kit
  Paint _grad(Rect r, List<Color> c,
          {Alignment begin = Alignment.topCenter,
          Alignment end = Alignment.bottomCenter}) =>
      Paint()
        ..shader =
            LinearGradient(begin: begin, end: end, colors: c).createShader(r);

  void _dayBase(Canvas canvas, Rect r, double w, double h) {
    _sky(
        canvas,
        r,
        const [Color(0xFF7CC6FF), Color(0xFFB9E2FF), Color(0xFFEAF6FF)],
        const [0, 0.45, 1]);
    final sun = Offset(w * 0.15, h * 0.08);
    canvas.drawCircle(
        sun,
        w * 0.18,
        Paint()
          ..shader = RadialGradient(colors: [
            const Color(0xFFFFF4C2),
            const Color(0xFFFFF4C2).withOpacity(0)
          ]).createShader(Rect.fromCircle(center: sun, radius: w * 0.18)));
    _cloud(
        canvas, Offset(w * ((0.25 + t * 0.5) % 1.3 - 0.15), h * 0.1), w * 0.09);
    _cloud(canvas, Offset(w * ((0.75 + t * 0.35) % 1.3 - 0.15), h * 0.2),
        w * 0.065);
  }

  void _wall(Canvas canvas, Rect r, Color top, Color bottom, Color mortar) {
    canvas.drawRect(r, _grad(r, [top, bottom]));
    final bh = r.width * 0.07;
    final bw = r.width * 0.16;
    final p = Paint()
      ..color = mortar
      ..strokeWidth = math.max(1, r.width * 0.004);
    var row = 0;
    for (var y = 0.0; y < r.height; y += bh) {
      canvas.drawLine(Offset(0, y), Offset(r.width, y), p);
      for (var x = (row.isOdd ? bw / 2 : 0.0); x < r.width; x += bw) {
        canvas.drawLine(Offset(x, y), Offset(x, y + bh), p);
      }
      row++;
    }
    // Soft vignette.
    canvas.drawRect(
        r,
        Paint()
          ..shader = RadialGradient(
              radius: 0.9,
              colors: [Colors.transparent, Colors.black.withOpacity(0.28)],
              stops: const [0.55, 1]).createShader(r));
  }

  void _floor(Canvas canvas, double w, double h, double y, Color a, Color b) {
    final r = Rect.fromLTWH(0, y, w, h - y);
    canvas.drawRect(r, _grad(r, [a, b]));
    final p = Paint()
      ..color = Colors.black.withOpacity(0.15)
      ..strokeWidth = math.max(1, w * 0.004);
    for (var i = 1; i < 5; i++) {
      final yy = y + (h - y) * (i / 5) * (i / 5);
      canvas.drawLine(Offset(0, yy), Offset(w, yy), p);
    }
    canvas.drawRect(Rect.fromLTWH(0, y, w, w * 0.012),
        Paint()..color = Colors.black.withOpacity(0.25));
  }

  void _flame(Canvas canvas, Offset base, double fw, double fh, int seed) {
    final flick = 1 + 0.12 * math.sin(t * 2 * math.pi * 6 + seed);
    for (var layer = 0; layer < 3; layer++) {
      final k = [1.0, 0.68, 0.38][layer];
      final c = [
        const Color(0xFFFF5A1F),
        const Color(0xFFFF9F1C),
        const Color(0xFFFFE066)
      ][layer];
      final hh = fh * k * flick;
      final ww = fw * k;
      final path = Path()
        ..moveTo(base.dx - ww / 2, base.dy)
        ..quadraticBezierTo(
            base.dx - ww * 0.6,
            base.dy - hh * 0.5,
            base.dx + math.sin(t * 2 * math.pi * 4 + seed) * ww * 0.15,
            base.dy - hh)
        ..quadraticBezierTo(
            base.dx + ww * 0.6, base.dy - hh * 0.5, base.dx + ww / 2, base.dy)
        ..close();
      canvas.drawPath(path, Paint()..color = c);
    }
  }

  void _torch(Canvas canvas, Offset c, double w) {
    canvas.drawCircle(
        c - Offset(0, w * 0.08),
        w * 0.16,
        Paint()
          ..shader = RadialGradient(
                  colors: [const Color(0x66FFB347), const Color(0x00FFB347)])
              .createShader(Rect.fromCircle(
                  center: c - Offset(0, w * 0.08), radius: w * 0.16)));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: c + Offset(0, w * 0.04),
                width: w * 0.03,
                height: w * 0.12),
            Radius.circular(w * 0.01)),
        Paint()..color = const Color(0xFF6B4423));
    canvas.drawRect(
        Rect.fromCenter(
            center: c - Offset(0, w * 0.01),
            width: w * 0.05,
            height: w * 0.025),
        Paint()..color = const Color(0xFF8D99AE));
    _flame(canvas, c - Offset(0, w * 0.02), w * 0.06, w * 0.1, c.dx.round());
  }

  void _toolRack(Canvas canvas, Rect r) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(r.left, r.top, r.width, r.height * 0.12),
            Radius.circular(r.height * 0.05)),
        Paint()..color = const Color(0xFF6B4423));
    final metal = Paint()..color = const Color(0xFF9AA5B8);
    final n = 5;
    for (var i = 0; i < n; i++) {
      final x = r.left + r.width * (i + 0.5) / n;
      canvas.drawLine(Offset(x, r.top + r.height * 0.1), Offset(x, r.bottom),
          metal..strokeWidth = r.width * 0.012);
      if (i.isEven) {
        canvas.drawRect(
            Rect.fromCenter(
                center: Offset(x, r.bottom),
                width: r.width * 0.09,
                height: r.height * 0.18),
            metal);
      } else {
        canvas.drawCircle(Offset(x, r.bottom), r.width * 0.03, metal);
      }
    }
  }

  void _furnace(Canvas canvas, Rect r) {
    final stone = RRect.fromRectAndCorners(r,
        topLeft: Radius.circular(r.width * 0.5),
        topRight: Radius.circular(r.width * 0.5));
    canvas.drawRRect(
        stone, _grad(r, [const Color(0xFF7A6A66), const Color(0xFF4A3E3B)]));
    final mouth = Rect.fromLTWH(r.left + r.width * 0.2, r.top + r.height * 0.35,
        r.width * 0.6, r.height * 0.55);
    canvas.drawRRect(
        RRect.fromRectAndCorners(mouth,
            topLeft: Radius.circular(mouth.width * 0.5),
            topRight: Radius.circular(mouth.width * 0.5)),
        Paint()..color = const Color(0xFF2A0F08));
    canvas.drawCircle(
        mouth.center + Offset(0, mouth.height * 0.15),
        mouth.width * 0.7,
        Paint()
          ..shader = RadialGradient(
                  colors: [const Color(0xAAFF8A3D), const Color(0x00FF8A3D)])
              .createShader(Rect.fromCircle(
                  center: mouth.center, radius: mouth.width * 0.7)));
    for (var i = 0; i < 4; i++) {
      _flame(
          canvas,
          Offset(mouth.left + mouth.width * (0.2 + i * 0.2), mouth.bottom),
          mouth.width * 0.28,
          mouth.height * 0.7,
          i);
    }
  }

  void _anvil(Canvas canvas, Offset base, double size) {
    canvas.drawRect(
        Rect.fromCenter(
            center: base - Offset(0, size * 0.12),
            width: size * 0.32,
            height: size * 0.24),
        Paint()..color = const Color(0xFF7A4A21));
    final top = Path()
      ..moveTo(base.dx - size * 0.5, base.dy - size * 0.42)
      ..lineTo(base.dx + size * 0.32, base.dy - size * 0.42)
      ..quadraticBezierTo(base.dx + size * 0.5, base.dy - size * 0.4,
          base.dx + size * 0.32, base.dy - size * 0.32)
      ..lineTo(base.dx + size * 0.12, base.dy - size * 0.32)
      ..lineTo(base.dx + size * 0.08, base.dy - size * 0.24)
      ..lineTo(base.dx - size * 0.12, base.dy - size * 0.24)
      ..lineTo(base.dx - size * 0.18, base.dy - size * 0.32)
      ..lineTo(base.dx - size * 0.38, base.dy - size * 0.34)
      ..close();
    canvas.drawPath(
        top,
        _grad(top.getBounds(),
            [const Color(0xFF9AA5B8), const Color(0xFF4A5568)]));
    // Glowing sword on the anvil.
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(base.dx - size * 0.36, base.dy - size * 0.47,
                size * 0.6, size * 0.04),
            Radius.circular(size * 0.02)),
        Paint()..color = const Color(0xFFFF9F4D));
    canvas.drawRect(
        Rect.fromLTWH(base.dx + size * 0.24, base.dy - size * 0.5, size * 0.03,
            size * 0.1),
        Paint()..color = const Color(0xFFD79A1E));
  }

  void _sparksUp(Canvas canvas, Offset origin, double w, double h, Color c) {
    for (var i = 0; i < 16; i++) {
      final phase = (t * 3 + i / 16) % 1.0;
      final p = origin +
          Offset(math.sin(i * 1.7) * w * 0.12 * phase, -h * 0.35 * phase);
      canvas.drawCircle(p, w * 0.006 * (1 - phase) + 0.6,
          Paint()..color = c.withOpacity(1 - phase));
    }
  }

  void _tent(
      Canvas canvas, Offset base, double tw, double th, Color a, Color b) {
    final body =
        Rect.fromLTWH(base.dx - tw / 2, base.dy - th * 0.55, tw, th * 0.55);
    final roofTop = Offset(base.dx, base.dy - th);
    final stripes = 6;
    for (var i = 0; i < stripes; i++) {
      final x0 = body.left + body.width * i / stripes;
      final x1 = body.left + body.width * (i + 1) / stripes;
      canvas.drawRect(Rect.fromLTRB(x0, body.top, x1, body.bottom),
          Paint()..color = i.isEven ? a : b);
      canvas.drawPath(
          Path()
            ..moveTo(roofTop.dx, roofTop.dy)
            ..lineTo(x0 - tw * 0.04 * (1 - 2 * i / stripes), body.top)
            ..lineTo(x1 - tw * 0.04 * (1 - 2 * (i + 1) / stripes), body.top)
            ..close(),
          Paint()..color = i.isEven ? a : b);
    }
    // Scalloped valance.
    for (var i = 0; i < stripes; i++) {
      final cx = body.left + body.width * (i + 0.5) / stripes;
      canvas.drawCircle(Offset(cx, body.top), body.width / stripes / 2,
          Paint()..color = i.isEven ? b : a);
    }
    canvas.drawPath(
        Path()
          ..moveTo(base.dx - tw * 0.1, base.dy)
          ..lineTo(base.dx, body.top + th * 0.12)
          ..lineTo(base.dx + tw * 0.1, base.dy)
          ..close(),
        Paint()..color = const Color(0x55000000));
    canvas.drawLine(
        roofTop,
        roofTop - Offset(0, th * 0.25),
        Paint()
          ..color = const Color(0xFF6B4423)
          ..strokeWidth = tw * 0.02);
    final wave = math.sin(t * 2 * math.pi * 3 + base.dx) * th * 0.03;
    canvas.drawPath(
        Path()
          ..moveTo(roofTop.dx, roofTop.dy - th * 0.25)
          ..quadraticBezierTo(
              roofTop.dx + tw * 0.12,
              roofTop.dy - th * 0.22 + wave,
              roofTop.dx + tw * 0.22,
              roofTop.dy - th * 0.18)
          ..lineTo(roofTop.dx, roofTop.dy - th * 0.12)
          ..close(),
        Paint()..color = const Color(0xFFF2B53A));
  }

  void _fence(Canvas canvas, double w, double y) {
    final wood = Paint()..color = const Color(0xFF8B5A2B);
    canvas.drawRect(Rect.fromLTWH(0, y - w * 0.03, w, w * 0.025), wood);
    canvas.drawRect(Rect.fromLTWH(0, y + w * 0.01, w, w * 0.025), wood);
    for (var x = w * 0.03; x < w; x += w * 0.14) {
      canvas.drawRect(Rect.fromLTWH(x, y - w * 0.06, w * 0.025, w * 0.12),
          Paint()..color = const Color(0xFF6B4423));
    }
  }

  void _shieldPost(Canvas canvas, Offset base, double size, Color color) {
    canvas.drawRect(
        Rect.fromLTWH(base.dx - size * 0.06, base.dy - size * 1.6, size * 0.12,
            size * 1.6),
        Paint()..color = const Color(0xFF6B4423));
    final c = base - Offset(0, size * 1.3);
    final shield = Path()
      ..moveTo(c.dx - size / 2, c.dy - size * 0.5)
      ..lineTo(c.dx + size / 2, c.dy - size * 0.5)
      ..lineTo(c.dx + size / 2, c.dy)
      ..quadraticBezierTo(
          c.dx + size / 2, c.dy + size * 0.4, c.dx, c.dy + size * 0.6)
      ..quadraticBezierTo(
          c.dx - size / 2, c.dy + size * 0.4, c.dx - size / 2, c.dy)
      ..close();
    canvas.drawPath(shield, Paint()..color = color);
    canvas.drawPath(
        shield,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = size * 0.1
          ..color = const Color(0xFFF2B53A));
    _star(canvas, c, size * 0.22, Paint()..color = const Color(0xFFF2B53A));
  }

  void _vaultArch(Canvas canvas, Rect r) {
    final arch = RRect.fromRectAndCorners(r,
        topLeft: Radius.circular(r.width * 0.5),
        topRight: Radius.circular(r.width * 0.5));
    canvas.drawRRect(arch, Paint()..color = const Color(0xFF1E140C));
    canvas.drawRRect(
        arch,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r.width * 0.05
          ..color = const Color(0xFF8C6B45));
    canvas.drawCircle(
        r.center + Offset(0, r.height * 0.2),
        r.width * 0.5,
        Paint()
          ..shader = RadialGradient(
                  colors: [const Color(0x88FFD84D), const Color(0x00FFD84D)])
              .createShader(
                  Rect.fromCircle(center: r.center, radius: r.width * 0.6)));
    for (var i = 0; i < 4; i++) {
      final y = r.top + r.height * (0.3 + i * 0.16);
      canvas.drawLine(
          Offset(r.left + r.width * 0.1, y),
          Offset(r.right - r.width * 0.1, y),
          Paint()
            ..color = const Color(0x334A3520)
            ..strokeWidth = r.width * 0.01);
    }
  }

  void _coin(Canvas canvas, Offset c, double r, {double squash = 0.45}) {
    final rect =
        Rect.fromCenter(center: c, width: r * 2, height: r * 2 * squash);
    canvas.drawOval(rect.shift(Offset(0, r * 0.18)),
        Paint()..color = const Color(0xFFB07A12));
    canvas.drawOval(
        rect,
        _grad(rect,
            const [Color(0xFFFFF3B0), Color(0xFFF2B53A), Color(0xFFD79A1E)],
            begin: Alignment.topLeft, end: Alignment.bottomRight));
    canvas.drawOval(
        rect.deflate(r * 0.22),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r * 0.08
          ..color = const Color(0x99B07A12));
  }

  void _coinPile(Canvas canvas, Offset base, double width, int rows) {
    final r = width / 7;
    for (var row = 0; row < rows; row++) {
      final count = rows - row + 2;
      for (var i = 0; i < count; i++) {
        final x = base.dx - (count - 1) * r * 0.8 + i * r * 1.6;
        _coin(canvas, Offset(x, base.dy - row * r * 0.55), r);
      }
    }
  }

  void _coinStack(Canvas canvas, Offset base, double r, int n) {
    for (var i = 0; i < n; i++) {
      _coin(canvas, base - Offset(0, i * r * 0.32), r, squash: 0.4);
    }
  }

  void _chest(Canvas canvas, Rect r) {
    canvas.drawCircle(
        r.center - Offset(0, r.height * 0.4),
        r.width * 0.7,
        Paint()
          ..shader = RadialGradient(
                  colors: [const Color(0x99FFE27A), const Color(0x00FFE27A)])
              .createShader(
                  Rect.fromCircle(center: r.center, radius: r.width * 0.7)));
    final body = Rect.fromLTWH(
        r.left, r.top + r.height * 0.35, r.width, r.height * 0.65);
    canvas.drawRRect(
        RRect.fromRectAndRadius(body, Radius.circular(r.height * 0.08)),
        _grad(body, const [Color(0xFF9C5B2B), Color(0xFF6B3A17)]));
    // Open lid tilted back.
    final lid = Path()
      ..moveTo(r.left, r.top + r.height * 0.35)
      ..lineTo(r.left + r.width * 0.06, r.top - r.height * 0.25)
      ..lineTo(r.right - r.width * 0.06, r.top - r.height * 0.25)
      ..lineTo(r.right, r.top + r.height * 0.35)
      ..close();
    canvas.drawPath(lid, Paint()..color = const Color(0xFF7A4520));
    // Gold heaped inside.
    for (var i = 0; i < 7; i++) {
      _coin(
          canvas,
          Offset(r.left + r.width * (0.12 + i * 0.13),
              r.top + r.height * (0.32 + (i.isEven ? 0 : 0.06))),
          r.width * 0.08);
    }
    final band = Paint()..color = const Color(0xFFF2B53A);
    canvas.drawRect(
        Rect.fromLTWH(body.left, body.top, body.width, body.height * 0.14),
        band);
    canvas.drawRect(
        Rect.fromLTWH(body.left + body.width * 0.15, body.top,
            body.width * 0.06, body.height),
        band);
    canvas.drawRect(
        Rect.fromLTWH(body.right - body.width * 0.21, body.top,
            body.width * 0.06, body.height),
        band);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(body.center.dx, body.top + body.height * 0.35),
                width: body.width * 0.12,
                height: body.height * 0.3),
            Radius.circular(body.width * 0.02)),
        band);
  }

  void _book(Canvas canvas, Rect r) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            r.inflate(r.height * 0.08), Radius.circular(r.height * 0.1)),
        Paint()..color = const Color(0xFF7A1F33));
    final left = Rect.fromLTWH(r.left, r.top, r.width / 2, r.height);
    final right = Rect.fromLTWH(r.center.dx, r.top, r.width / 2, r.height);
    canvas.drawRect(left, Paint()..color = const Color(0xFFFBF3DF));
    canvas.drawRect(right, Paint()..color = const Color(0xFFF5EAD0));
    final line = Paint()
      ..color = const Color(0x55A0782D)
      ..strokeWidth = math.max(1, r.height * 0.04);
    for (var i = 1; i < 5; i++) {
      final y = r.top + r.height * i / 5;
      canvas.drawLine(Offset(left.left + left.width * 0.1, y),
          Offset(left.right - left.width * 0.1, y), line);
      canvas.drawLine(Offset(right.left + right.width * 0.1, y),
          Offset(right.right - right.width * 0.1, y), line);
    }
    // Quill.
    canvas.drawLine(
        Offset(r.right - r.width * 0.1, r.bottom),
        Offset(r.right + r.width * 0.1, r.top - r.height * 0.8),
        Paint()
          ..color = Colors.white
          ..strokeWidth = r.height * 0.18
          ..strokeCap = StrokeCap.round);
  }

  void _bunting(Canvas canvas, double w, double y) {
    final rope = Path()
      ..moveTo(0, y)
      ..quadraticBezierTo(w / 2, y + w * 0.12, w, y);
    canvas.drawPath(
        rope,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = w * 0.006
          ..color = const Color(0xFF6B4423));
    const colors = [
      Color(0xFFE23D5C),
      Color(0xFFF2B53A),
      Color(0xFF3D5BD9),
      Color(0xFF1FA67A),
      Color(0xFF7B5CE0)
    ];
    for (var i = 0; i < 10; i++) {
      final x = w * (i + 0.5) / 10;
      final tt = x / w;
      final yy = y + w * 0.12 * 4 * tt * (1 - tt) / 2 * 1.0;
      final sway = math.sin(t * 2 * math.pi * 2 + i) * w * 0.006;
      canvas.drawPath(
          Path()
            ..moveTo(x - w * 0.035, yy)
            ..lineTo(x + w * 0.035, yy)
            ..lineTo(x + sway, yy + w * 0.08)
            ..close(),
          Paint()..color = colors[i % colors.length]);
    }
  }

  void _cobbles(Canvas canvas, double w, double h, double top) {
    final p = Paint()..color = const Color(0x22000000);
    final rnd = math.Random(8);
    for (var i = 0; i < 70; i++) {
      final c =
          Offset(rnd.nextDouble() * w, top + rnd.nextDouble() * (h - top));
      canvas.drawOval(
          Rect.fromCenter(center: c, width: w * 0.06, height: w * 0.03), p);
    }
  }

  void _awning(Canvas canvas, Rect r, Color a, Color b) {
    final n = 8;
    for (var i = 0; i < n; i++) {
      final x0 = r.left + r.width * i / n;
      final sw = r.width / n;
      canvas.drawRect(Rect.fromLTWH(x0, r.top, sw, r.height),
          Paint()..color = i.isEven ? a : b);
      canvas.drawCircle(Offset(x0 + sw / 2, r.bottom), sw / 2,
          Paint()..color = i.isEven ? a : b);
    }
  }

  void _stall(Canvas canvas, Rect r, Color color, int goods) {
    final awn = Rect.fromLTWH(r.left, r.top, r.width, r.height * 0.22);
    final post = Paint()..color = const Color(0xFF6B4423);
    canvas.drawRect(
        Rect.fromLTWH(r.left + r.width * 0.04, r.top, r.width * 0.04, r.height),
        post);
    canvas.drawRect(
        Rect.fromLTWH(
            r.right - r.width * 0.08, r.top, r.width * 0.04, r.height),
        post);
    _awning(canvas, awn, color, Colors.white);
    final counter = Rect.fromLTWH(
        r.left, r.top + r.height * 0.62, r.width, r.height * 0.38);
    canvas.drawRect(
        counter, _grad(counter, const [Color(0xFFB07A4A), Color(0xFF7A4A21)]));
    for (var i = 0; i < 6; i++) {
      final c = Offset(
          r.left + r.width * (0.14 + i * 0.145), counter.top - r.width * 0.03);
      if (goods == 0) {
        canvas.drawCircle(
            c,
            r.width * 0.045,
            Paint()
              ..color =
                  i.isEven ? const Color(0xFFE23D5C) : const Color(0xFF8ED48A));
      } else {
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: c - Offset(0, r.width * 0.02),
                    width: r.width * 0.08,
                    height: r.width * 0.1),
                Radius.circular(r.width * 0.02)),
            Paint()
              ..color = [
                const Color(0xFFF2B53A),
                const Color(0xFF7B5CE0),
                const Color(0xFF3D5BD9)
              ][i % 3]);
      }
    }
  }

  void _clockTower(Canvas canvas, Offset base, double tw, double th) {
    final body = Rect.fromLTWH(base.dx - tw / 2, base.dy - th, tw, th);
    canvas.drawRect(
        body,
        _grad(body, const [Color(0xFFF1EBFF), Color(0xFFC9BCEB)],
            begin: Alignment.centerLeft, end: Alignment.centerRight));
    canvas.drawPath(
        Path()
          ..moveTo(body.left - tw * 0.12, body.top)
          ..lineTo(base.dx, body.top - tw * 0.95)
          ..lineTo(body.right + tw * 0.12, body.top)
          ..close(),
        _grad(Rect.fromLTWH(body.left, body.top - tw, tw, tw),
            const [Color(0xFFE2486A), Color(0xFF9C1F3A)]));
    canvas.drawLine(
        Offset(base.dx, body.top - tw * 0.95),
        Offset(base.dx, body.top - tw * 1.25),
        Paint()
          ..color = const Color(0xFF6B4423)
          ..strokeWidth = tw * 0.03);
    canvas.drawPath(
        Path()
          ..moveTo(base.dx, body.top - tw * 1.25)
          ..lineTo(base.dx + tw * 0.25,
              body.top - tw * 1.18 + math.sin(t * 2 * math.pi * 3) * tw * 0.02)
          ..lineTo(base.dx, body.top - tw * 1.1)
          ..close(),
        Paint()..color = const Color(0xFFF2B53A));
    final cc = Offset(base.dx, body.top + tw * 0.55);
    final cr = tw * 0.38;
    canvas.drawCircle(cc, cr * 1.12, Paint()..color = const Color(0xFFD79A1E));
    canvas.drawCircle(cc, cr, Paint()..color = const Color(0xFFFFFCF5));
    for (var i = 0; i < 12; i++) {
      final a = i * math.pi / 6;
      canvas.drawLine(
          cc + Offset(math.cos(a), math.sin(a)) * cr * 0.82,
          cc + Offset(math.cos(a), math.sin(a)) * cr * 0.95,
          Paint()
            ..color = const Color(0xFF2A1B4D)
            ..strokeWidth = tw * (i % 3 == 0 ? 0.03 : 0.015));
    }
    final ha = t * 2 * math.pi - math.pi / 2;
    final ma = t * 2 * math.pi * 12 - math.pi / 2;
    canvas.drawLine(
        cc,
        cc + Offset(math.cos(ha), math.sin(ha)) * cr * 0.5,
        Paint()
          ..color = const Color(0xFF2A1B4D)
          ..strokeWidth = tw * 0.04
          ..strokeCap = StrokeCap.round);
    canvas.drawLine(
        cc,
        cc + Offset(math.cos(ma), math.sin(ma)) * cr * 0.75,
        Paint()
          ..color = const Color(0xFF5B3CC4)
          ..strokeWidth = tw * 0.025
          ..strokeCap = StrokeCap.round);
    canvas.drawCircle(cc, tw * 0.03, Paint()..color = const Color(0xFFD79A1E));
    for (var i = 0; i < 3; i++) {
      canvas.drawRRect(
          RRect.fromRectAndCorners(
              Rect.fromLTWH(base.dx - tw * 0.1,
                  body.top + th * (0.45 + i * 0.17), tw * 0.2, th * 0.1),
              topLeft: Radius.circular(tw * 0.1),
              topRight: Radius.circular(tw * 0.1)),
          Paint()..color = const Color(0xFF8E7CC3));
    }
  }

  void _cottage(Canvas canvas, Offset base, double size) {
    final body = Rect.fromLTWH(
        base.dx - size / 2, base.dy - size * 0.6, size, size * 0.6);
    canvas.drawRect(body, Paint()..color = const Color(0xFFFFF4DE));
    canvas.drawPath(
        Path()
          ..moveTo(body.left - size * 0.1, body.top)
          ..lineTo(base.dx, body.top - size * 0.45)
          ..lineTo(body.right + size * 0.1, body.top)
          ..close(),
        Paint()..color = const Color(0xFF9C5B2B));
    canvas.drawRect(
        Rect.fromLTWH(
            base.dx - size * 0.1, base.dy - size * 0.3, size * 0.2, size * 0.3),
        Paint()..color = const Color(0xFF6B3A17));
    canvas.drawRect(
        Rect.fromLTWH(body.left + size * 0.1, body.top + size * 0.12,
            size * 0.18, size * 0.15),
        Paint()..color = const Color(0xFF9ED9FF));
  }

  void _fallingCoins(Canvas canvas, double w, double h) {
    for (var i = 0; i < 12; i++) {
      final phase = (t * 2 + i / 12) % 1.0;
      final x = w * ((i * 0.37) % 1.0);
      final y = -w * 0.05 + phase * h * 0.75;
      canvas.save();
      canvas.translate(x, y);
      canvas.scale(math.cos(phase * math.pi * 4 + i).abs() * 0.8 + 0.2, 1);
      _coin(canvas, Offset.zero, w * 0.035, squash: 1);
      canvas.restore();
    }
  }

  void _coinPress(Canvas canvas, Offset base, double pw, double ph) {
    final frame = Paint()..color = const Color(0xFF5A3A22);
    final iron = _grad(Rect.fromCenter(center: base, width: pw, height: ph),
        const [Color(0xFF9AA5B8), Color(0xFF4A5568)],
        begin: Alignment.centerLeft, end: Alignment.centerRight);
    canvas.drawRect(
        Rect.fromLTWH(
            base.dx - pw * 0.45, base.dy - ph * 0.12, pw * 0.9, ph * 0.12),
        frame);
    canvas.drawRect(
        Rect.fromLTWH(base.dx - pw * 0.38, base.dy - ph, pw * 0.1, ph * 0.9),
        iron);
    canvas.drawRect(
        Rect.fromLTWH(base.dx + pw * 0.28, base.dy - ph, pw * 0.1, ph * 0.9),
        iron);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(
                base.dx - pw * 0.42, base.dy - ph * 1.05, pw * 0.84, ph * 0.12),
            Radius.circular(ph * 0.04)),
        iron);
    // Screw + spinning handle bar.
    final press = (math.sin(t * 2 * math.pi * 2) + 1) / 2;
    canvas.drawRect(
        Rect.fromLTWH(base.dx - pw * 0.04, base.dy - ph * 0.95, pw * 0.08,
            ph * (0.45 + 0.12 * press)),
        _grad(Rect.fromLTWH(0, 0, pw, ph),
            const [Color(0xFFF2B53A), Color(0xFFB07A12)],
            begin: Alignment.centerLeft, end: Alignment.centerRight));
    final bar = pw * 0.42 * math.cos(t * 2 * math.pi * 2);
    canvas.drawLine(
        Offset(base.dx - bar, base.dy - ph * 1.02),
        Offset(base.dx + bar, base.dy - ph * 1.02),
        Paint()
          ..color = const Color(0xFF2A2F45)
          ..strokeWidth = ph * 0.03
          ..strokeCap = StrokeCap.round);
    canvas.drawCircle(Offset(base.dx - bar, base.dy - ph * 1.02), ph * 0.04,
        Paint()..color = const Color(0xFFD7263D));
    canvas.drawCircle(Offset(base.dx + bar, base.dy - ph * 1.02), ph * 0.04,
        Paint()..color = const Color(0xFFD7263D));
    canvas.drawRect(
        Rect.fromLTWH(base.dx - pw * 0.1, base.dy - ph * (0.48 - 0.12 * press),
            pw * 0.2, ph * 0.06),
        iron);
    _coin(canvas, Offset(base.dx, base.dy - ph * 0.18), pw * 0.1);
    _sparksUp(canvas, Offset(base.dx, base.dy - ph * 0.2), pw, ph,
        const Color(0xFFFFE27A));
  }

  void _shelfOfFabric(Canvas canvas, Rect r) {
    canvas.drawRect(
        Rect.fromLTWH(
            r.left, r.bottom - r.height * 0.1, r.width, r.height * 0.1),
        Paint()..color = const Color(0xFF9C7656));
    final n = 9;
    for (var i = 0; i < n; i++) {
      final hue = (i * 40 + (r.top * 7) % 40) % 360;
      final color = HSLColor.fromAHSL(1, hue.toDouble(), 0.6, 0.66).toColor();
      final bw = r.width / n * 0.86;
      final x = r.left + r.width * i / n + bw * 0.08;
      final bolt = RRect.fromRectAndRadius(
          Rect.fromLTWH(x, r.top + r.height * 0.1, bw, r.height * 0.8),
          Radius.circular(bw * 0.3));
      canvas.drawRRect(bolt, Paint()..color = color);
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(x + bw * 0.15, r.top + r.height * 0.1, bw * 0.2,
                  r.height * 0.8),
              Radius.circular(bw * 0.1)),
          Paint()..color = Colors.white.withOpacity(0.35));
    }
  }

  void _dressForm(Canvas canvas, Offset base, double fw, double fh) {
    canvas.drawLine(
        Offset(base.dx, base.dy),
        Offset(base.dx, base.dy - fh * 0.45),
        Paint()
          ..color = const Color(0xFF6B4423)
          ..strokeWidth = fw * 0.04);
    canvas.drawLine(
        Offset(base.dx - fw * 0.2, base.dy),
        Offset(base.dx + fw * 0.2, base.dy),
        Paint()
          ..color = const Color(0xFF6B4423)
          ..strokeWidth = fw * 0.05
          ..strokeCap = StrokeCap.round);
    final torso = Path()
      ..moveTo(base.dx - fw * 0.28, base.dy - fh * 0.95)
      ..quadraticBezierTo(base.dx, base.dy - fh * 1.05, base.dx + fw * 0.28,
          base.dy - fh * 0.95)
      ..quadraticBezierTo(base.dx + fw * 0.16, base.dy - fh * 0.7,
          base.dx + fw * 0.3, base.dy - fh * 0.42)
      ..lineTo(base.dx - fw * 0.3, base.dy - fh * 0.42)
      ..quadraticBezierTo(base.dx - fw * 0.16, base.dy - fh * 0.7,
          base.dx - fw * 0.28, base.dy - fh * 0.95)
      ..close();
    canvas.drawPath(torso,
        _grad(torso.getBounds(), const [Color(0xFF8A4FE0), Color(0xFF5B3CC4)]));
    canvas.drawPath(
        Path()
          ..moveTo(base.dx - fw * 0.3, base.dy - fh * 0.92)
          ..quadraticBezierTo(base.dx - fw * 0.5, base.dy - fh * 0.5,
              base.dx - fw * 0.45, base.dy - fh * 0.2)
          ..lineTo(base.dx - fw * 0.2, base.dy - fh * 0.42)
          ..close(),
        Paint()..color = const Color(0xFFE23D5C));
    canvas.drawPath(
        Path()
          ..moveTo(base.dx + fw * 0.3, base.dy - fh * 0.92)
          ..quadraticBezierTo(base.dx + fw * 0.5, base.dy - fh * 0.5,
              base.dx + fw * 0.45, base.dy - fh * 0.2)
          ..lineTo(base.dx + fw * 0.2, base.dy - fh * 0.42)
          ..close(),
        Paint()..color = const Color(0xFFE23D5C));
    canvas.drawCircle(Offset(base.dx, base.dy - fh * 0.88), fw * 0.05,
        Paint()..color = const Color(0xFFF2B53A));
  }

  void _spools(Canvas canvas, Offset base, double w) {
    const colors = [
      Color(0xFFE23D5C),
      Color(0xFF3D5BD9),
      Color(0xFFF2B53A),
      Color(0xFF1FA67A)
    ];
    for (var i = 0; i < 4; i++) {
      final c = base + Offset(i * w * 0.08, (i.isOdd ? w * 0.02 : 0));
      canvas.drawRect(
          Rect.fromCenter(center: c, width: w * 0.06, height: w * 0.07),
          Paint()..color = colors[i]);
      canvas.drawRect(
          Rect.fromCenter(
              center: c - Offset(0, w * 0.04),
              width: w * 0.075,
              height: w * 0.015),
          Paint()..color = const Color(0xFFC9A27E));
      canvas.drawRect(
          Rect.fromCenter(
              center: c + Offset(0, w * 0.04),
              width: w * 0.075,
              height: w * 0.015),
          Paint()..color = const Color(0xFFC9A27E));
    }
  }

  void _measuringTape(Canvas canvas, double w, double h) {
    final p = Path()..moveTo(-w * 0.05, h * 0.47);
    p.cubicTo(w * 0.3, h * 0.42, w * 0.6, h * 0.56, w * 1.05, h * 0.5);
    canvas.drawPath(
        p,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = w * 0.03
          ..color = const Color(0xFFFFD45C));
    canvas.drawPath(
        p,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = w * 0.006
          ..color = const Color(0x88A0782D));
  }

  void _gear(
      Canvas canvas, Offset c, double r, int teeth, Color color, double rot) {
    canvas.save();
    canvas.translate(c.dx, c.dy);
    canvas.rotate(rot);
    final p = Path();
    for (var i = 0; i < teeth * 2; i++) {
      final a0 = i * math.pi / teeth;
      final a1 = (i + 1) * math.pi / teeth;
      final rr = i.isEven ? r : r * 0.82;
      p.lineTo(math.cos(a0) * rr, math.sin(a0) * rr);
      p.lineTo(math.cos(a1) * rr, math.sin(a1) * rr);
    }
    p.close();
    canvas.drawPath(
        p,
        Paint()
          ..shader = RadialGradient(colors: [
            Color.lerp(color, Colors.white, 0.3)!,
            color,
            Color.lerp(color, Colors.black, 0.3)!
          ]).createShader(Rect.fromCircle(center: Offset.zero, radius: r)));
    canvas.drawCircle(
        Offset.zero,
        r * 0.55,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r * 0.08
          ..color = Color.lerp(color, Colors.black, 0.35)!);
    for (var i = 0; i < 4; i++) {
      final a = i * math.pi / 2;
      canvas.drawLine(
          Offset.zero,
          Offset(math.cos(a), math.sin(a)) * r * 0.55,
          Paint()
            ..color = Color.lerp(color, Colors.black, 0.35)!
            ..strokeWidth = r * 0.1);
    }
    canvas.drawCircle(Offset.zero, r * 0.16,
        Paint()..color = Color.lerp(color, Colors.black, 0.45)!);
    canvas.restore();
  }

  void _pendulum(Canvas canvas, Offset pivot, double len, double w) {
    final a = math.sin(t * 2 * math.pi * 3) * 0.35;
    final bob = pivot + Offset(math.sin(a), math.cos(a)) * len;
    canvas.drawLine(
        pivot,
        bob,
        Paint()
          ..color = const Color(0xFFC9A66B)
          ..strokeWidth = w * 0.012);
    canvas.drawCircle(
        bob,
        w * 0.07,
        Paint()
          ..shader = RadialGradient(
                  colors: const [Color(0xFFFFF3B0), Color(0xFFD79A1E)])
              .createShader(Rect.fromCircle(center: bob, radius: w * 0.07)));
    canvas.drawCircle(
        pivot, w * 0.02, Paint()..color = const Color(0xFFC9A66B));
  }

  void _caveRocks(Canvas canvas, double w, double h) {
    final rock = Paint()..color = const Color(0xFF1C1026);
    canvas.drawPath(
        Path()
          ..moveTo(0, 0)
          ..lineTo(w, 0)
          ..lineTo(w, h * 0.08)
          ..quadraticBezierTo(w * 0.8, h * 0.18, w * 0.6, h * 0.09)
          ..quadraticBezierTo(w * 0.4, h * 0.16, w * 0.22, h * 0.1)
          ..quadraticBezierTo(w * 0.1, h * 0.2, 0, h * 0.12)
          ..close(),
        rock);
    for (var i = 0; i < 6; i++) {
      final x = w * (0.08 + i * 0.17);
      canvas.drawPath(
          Path()
            ..moveTo(x - w * 0.03, h * 0.1)
            ..lineTo(x, h * (0.16 + (i % 3) * 0.03))
            ..lineTo(x + w * 0.03, h * 0.1)
            ..close(),
          rock);
    }
    canvas.drawPath(
        Path()
          ..moveTo(0, h)
          ..lineTo(0, h * 0.3)
          ..quadraticBezierTo(w * 0.12, h * 0.55, w * 0.06, h)
          ..close(),
        rock);
    canvas.drawPath(
        Path()
          ..moveTo(w, h)
          ..lineTo(w, h * 0.35)
          ..quadraticBezierTo(w * 0.86, h * 0.6, w * 0.95, h)
          ..close(),
        rock);
  }

  void _goldMound(Canvas canvas, double w, double h) {
    final mound = Path()
      ..moveTo(0, h)
      ..lineTo(0, h * 0.86)
      ..quadraticBezierTo(w * 0.5, h * 0.66, w, h * 0.86)
      ..lineTo(w, h)
      ..close();
    canvas.drawPath(mound,
        _grad(mound.getBounds(), const [Color(0xFFFFE27A), Color(0xFFD79A1E)]));
    final rnd = math.Random(12);
    for (var i = 0; i < 40; i++) {
      final x = rnd.nextDouble() * w;
      final top = h * 0.86 - (1 - ((x / w - 0.5).abs() * 2)) * h * 0.12;
      _coin(canvas, Offset(x, top + rnd.nextDouble() * (h - top)), w * 0.035);
    }
  }

  void _gems(Canvas canvas, double w, double h) {
    const colors = [
      Color(0xFFE23D5C),
      Color(0xFF3D8BE2),
      Color(0xFF1FA67A),
      Color(0xFFB07BFF)
    ];
    final rnd = math.Random(5);
    for (var i = 0; i < 9; i++) {
      final c = Offset(w * (0.08 + rnd.nextDouble() * 0.84),
          h * (0.8 + rnd.nextDouble() * 0.16));
      final s = w * 0.035;
      canvas.drawPath(
          Path()
            ..moveTo(c.dx, c.dy - s)
            ..lineTo(c.dx + s * 0.8, c.dy - s * 0.2)
            ..lineTo(c.dx, c.dy + s)
            ..lineTo(c.dx - s * 0.8, c.dy - s * 0.2)
            ..close(),
          Paint()..color = colors[i % colors.length]);
      canvas.drawLine(
          Offset(c.dx - s * 0.8, c.dy - s * 0.2),
          Offset(c.dx + s * 0.8, c.dy - s * 0.2),
          Paint()
            ..color = Colors.white.withOpacity(0.6)
            ..strokeWidth = s * 0.12);
    }
  }

  void _mirror(Canvas canvas, Rect r) {
    canvas.drawOval(
        r.inflate(r.width * 0.07),
        _grad(
            r, const [Color(0xFFFFF3B0), Color(0xFFF2B53A), Color(0xFFD79A1E)],
            begin: Alignment.topLeft, end: Alignment.bottomRight));
    for (var i = 0; i < 12; i++) {
      final a = i * math.pi / 6;
      final p = r.center +
          Offset(math.cos(a) * (r.width / 2 + r.width * 0.035),
              math.sin(a) * (r.height / 2 + r.width * 0.035));
      canvas.drawCircle(
          p, r.width * 0.025, Paint()..color = const Color(0xFFFFF3B0));
    }
    canvas.drawOval(
        r,
        _grad(
            r, const [Color(0xFFE8F4FF), Color(0xFFCFE3FF), Color(0xFFE9DDFF)],
            begin: Alignment.topLeft, end: Alignment.bottomRight));
    final shine = (t * 1.5) % 1.0;
    canvas.save();
    canvas.clipPath(Path()..addOval(r));
    final x = r.left + r.width * (shine * 1.6 - 0.3);
    canvas.drawPath(
        Path()
          ..moveTo(x, r.top)
          ..lineTo(x + r.width * 0.15, r.top)
          ..lineTo(x - r.width * 0.15, r.bottom)
          ..lineTo(x - r.width * 0.3, r.bottom)
          ..close(),
        Paint()..color = Colors.white.withOpacity(0.5));
    canvas.restore();
    _star(canvas, Offset(r.center.dx, r.top - r.width * 0.12), r.width * 0.08,
        Paint()..color = const Color(0xFFF2B53A));
  }

  void _curtain(Canvas canvas, double w, double h, {required bool left}) {
    final x0 = left ? 0.0 : w;
    final dir = left ? 1.0 : -1.0;
    final sway = math.sin(t * 2 * math.pi) * w * 0.01;
    final p = Path()
      ..moveTo(x0, 0)
      ..lineTo(x0 + dir * w * 0.3, 0)
      ..quadraticBezierTo(
          x0 + dir * w * 0.12, h * 0.35, x0 + dir * (w * 0.2 + sway), h * 0.55)
      ..quadraticBezierTo(x0 + dir * w * 0.06, h * 0.75, x0 + dir * w * 0.12, h)
      ..lineTo(x0, h)
      ..close();
    canvas.drawPath(
        p,
        _grad(p.getBounds(), const [Color(0xFFD7263D), Color(0xFF8A1530)],
            begin: Alignment.centerLeft, end: Alignment.centerRight));
    for (var i = 1; i < 4; i++) {
      canvas.drawLine(
          Offset(x0 + dir * w * 0.06 * i, 0),
          Offset(x0 + dir * w * 0.04 * i, h),
          Paint()
            ..color = Colors.black.withOpacity(0.12)
            ..strokeWidth = w * 0.01);
    }
    canvas.drawCircle(Offset(x0 + dir * (w * 0.19 + sway), h * 0.55), w * 0.03,
        Paint()..color = const Color(0xFFF2B53A));
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h * 0.03),
        Paint()..color = const Color(0xFFB07A12));
  }

  void _squishyShelf(Canvas canvas, Rect r, int row) {
    canvas.drawRect(
        Rect.fromLTWH(
            r.left, r.bottom - r.height * 0.1, r.width, r.height * 0.1),
        Paint()..color = const Color(0xFF9C5B2B));
    final n = 5;
    for (var i = 0; i < n; i++) {
      final hue = ((i + row * 2) * 67) % 360;
      final color = HSLColor.fromAHSL(1, hue.toDouble(), 0.7, 0.75).toColor();
      final cw = r.width / n * 0.8;
      final bounce = math.sin(t * 2 * math.pi * 2 + i + row) * r.height * 0.03;
      final body = Rect.fromLTWH(
          r.left + r.width * i / n + cw * 0.12,
          r.bottom - r.height * 0.1 - r.height * 0.72 - bounce,
          cw,
          r.height * 0.72);
      canvas.drawRRect(
          RRect.fromRectAndCorners(body,
              topLeft: Radius.circular(cw * 0.5),
              topRight: Radius.circular(cw * 0.5),
              bottomLeft: Radius.circular(cw * 0.3),
              bottomRight: Radius.circular(cw * 0.3)),
          Paint()..color = color);
      if ((i + row).isEven) {
        canvas.drawCircle(Offset(body.left + cw * 0.25, body.top + cw * 0.05),
            cw * 0.13, Paint()..color = color);
        canvas.drawCircle(Offset(body.right - cw * 0.25, body.top + cw * 0.05),
            cw * 0.13, Paint()..color = color);
      }
      final eyeY = body.top + body.height * 0.45;
      canvas.drawCircle(Offset(body.center.dx - cw * 0.16, eyeY), cw * 0.06,
          Paint()..color = const Color(0xFF2A1B3D));
      canvas.drawCircle(Offset(body.center.dx + cw * 0.16, eyeY), cw * 0.06,
          Paint()..color = const Color(0xFF2A1B3D));
      canvas.drawOval(
          Rect.fromCenter(
              center: Offset(body.center.dx - cw * 0.3, eyeY + cw * 0.12),
              width: cw * 0.14,
              height: cw * 0.07),
          Paint()..color = const Color(0x66FF7FA0));
      canvas.drawOval(
          Rect.fromCenter(
              center: Offset(body.center.dx + cw * 0.3, eyeY + cw * 0.12),
              width: cw * 0.14,
              height: cw * 0.07),
          Paint()..color = const Color(0x66FF7FA0));
    }
  }

  void _checkerFloor(Canvas canvas, double w, double h, double top) {
    final c = w / 8;
    var row = 0;
    for (var y = top; y < h; y += c * 0.6) {
      for (var i = 0; i < 9; i++) {
        if ((i + row).isEven)
          canvas.drawRect(
              Rect.fromLTWH(i * c - (row.isOdd ? c / 2 : 0), y, c, c * 0.6),
              Paint()..color = const Color(0x22000000));
      }
      row++;
    }
  }

  void _candyJars(Canvas canvas, double w, double h) {
    for (var j = 0; j < 3; j++) {
      final base = Offset(w * (0.2 + j * 0.3), h * 0.84);
      final jar = RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: base - Offset(0, w * 0.09),
              width: w * 0.18,
              height: w * 0.18),
          Radius.circular(w * 0.05));
      canvas.drawRRect(jar, Paint()..color = Colors.white.withOpacity(0.5));
      final rnd = math.Random(j + 3);
      for (var i = 0; i < 9; i++) {
        canvas.drawCircle(
            Offset(jar.left + w * (0.03 + rnd.nextDouble() * 0.12),
                jar.top + w * (0.05 + rnd.nextDouble() * 0.11)),
            w * 0.018,
            Paint()
              ..color = HSLColor.fromAHSL(1, rnd.nextDouble() * 360, 0.75, 0.65)
                  .toColor());
      }
      canvas.drawRRect(
          jar,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = w * 0.006
            ..color = const Color(0x66FFFFFF));
      canvas.drawRect(
          Rect.fromCenter(
              center: Offset(base.dx, jar.top),
              width: w * 0.12,
              height: w * 0.025),
          Paint()..color = const Color(0xFFE23D5C));
    }
  }

  void _windingRoad(Canvas canvas, double w, double h) {
    final path = Path()
      ..moveTo(w * 0.3, h * 1.02)
      ..cubicTo(w * 0.9, h * 0.85, w * 0.05, h * 0.7, w * 0.55, h * 0.6)
      ..cubicTo(w * 0.85, h * 0.54, w * 0.45, h * 0.5, w * 0.58, h * 0.46);
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = w * 0.13
          ..strokeCap = StrokeCap.round
          ..color = const Color(0xFFC9B48A));
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = w * 0.1
          ..strokeCap = StrokeCap.round
          ..color = const Color(0xFFEFE3C6));
    for (final metric in path.computeMetrics()) {
      for (var d = 0.0; d < metric.length; d += w * 0.06) {
        final seg = metric.extractPath(d, d + w * 0.025);
        canvas.drawPath(
            seg,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = w * 0.012
              ..color = const Color(0xFFF2B53A));
      }
    }
  }

  void _tree(Canvas canvas, Offset base, double size) {
    canvas.drawRect(
        Rect.fromCenter(
            center: base - Offset(0, size * 0.3),
            width: size * 0.25,
            height: size * 0.6),
        Paint()..color = const Color(0xFF8B5A2B));
    canvas.drawCircle(base - Offset(0, size * 0.9), size * 0.55,
        Paint()..color = const Color(0xFF4FB06A));
    canvas.drawCircle(base - Offset(size * 0.3, size * 0.7), size * 0.4,
        Paint()..color = const Color(0xFF5CC27A));
    canvas.drawCircle(base - Offset(-size * 0.3, size * 0.7), size * 0.4,
        Paint()..color = const Color(0xFF3F9E5C));
  }

  void _signpost(Canvas canvas, Offset base, double w) {
    canvas.drawRect(
        Rect.fromLTWH(
            base.dx - w * 0.012, base.dy - w * 0.25, w * 0.024, w * 0.25),
        Paint()..color = const Color(0xFF6B4423));
    final sign = Path()
      ..moveTo(base.dx - w * 0.12, base.dy - w * 0.24)
      ..lineTo(base.dx + w * 0.08, base.dy - w * 0.24)
      ..lineTo(base.dx + w * 0.12, base.dy - w * 0.2)
      ..lineTo(base.dx + w * 0.08, base.dy - w * 0.16)
      ..lineTo(base.dx - w * 0.12, base.dy - w * 0.16)
      ..close();
    canvas.drawPath(sign, Paint()..color = const Color(0xFFB07A4A));
    _star(canvas, Offset(base.dx - w * 0.03, base.dy - w * 0.2), w * 0.025,
        Paint()..color = const Color(0xFFF2B53A));
  }

  void _noticeBoard(Canvas canvas, Rect r) {
    final post = Paint()..color = const Color(0xFF6B4423);
    canvas.drawRect(
        Rect.fromLTWH(
            r.left + r.width * 0.08, r.top, r.width * 0.05, r.height * 1.1),
        post);
    canvas.drawRect(
        Rect.fromLTWH(
            r.right - r.width * 0.13, r.top, r.width * 0.05, r.height * 1.1),
        post);
    canvas.drawPath(
        Path()
          ..moveTo(r.left - r.width * 0.04, r.top + r.height * 0.06)
          ..lineTo(r.center.dx, r.top - r.height * 0.18)
          ..lineTo(r.right + r.width * 0.04, r.top + r.height * 0.06)
          ..close(),
        Paint()..color = const Color(0xFF9C1F3A));
    final board =
        Rect.fromLTWH(r.left, r.top + r.height * 0.06, r.width, r.height * 0.7);
    canvas.drawRRect(
        RRect.fromRectAndRadius(board, Radius.circular(r.width * 0.02)),
        _grad(board, const [Color(0xFFB07A4A), Color(0xFF7A4A21)]));
    canvas.drawRRect(
        RRect.fromRectAndRadius(board, Radius.circular(r.width * 0.02)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = r.width * 0.015
          ..color = const Color(0xFF5A3A22));
    final scrolls = [
      const Offset(0.16, 0.2),
      const Offset(0.4, 0.14),
      const Offset(0.64, 0.22),
      const Offset(0.86, 0.16),
      const Offset(0.28, 0.55),
      const Offset(0.56, 0.58),
      const Offset(0.8, 0.56)
    ];
    for (var i = 0; i < scrolls.length; i++) {
      final c = Offset(board.left + board.width * scrolls[i].dx,
          board.top + board.height * scrolls[i].dy + board.height * 0.12);
      canvas.save();
      canvas.translate(c.dx, c.dy);
      canvas.rotate((i.isEven ? 1 : -1) * 0.08);
      final pr = Rect.fromCenter(
          center: Offset.zero,
          width: board.width * 0.18,
          height: board.height * 0.32);
      canvas.drawRect(pr, Paint()..color = const Color(0xFFFBF3DF));
      for (var k = 1; k < 4; k++) {
        canvas.drawLine(
            Offset(pr.left + pr.width * 0.15, pr.top + pr.height * k / 4),
            Offset(pr.right - pr.width * 0.15, pr.top + pr.height * k / 4),
            Paint()
              ..color = const Color(0x55A0782D)
              ..strokeWidth = math.max(1, pr.height * 0.04));
      }
      canvas.drawCircle(
          Offset(0, pr.top + pr.height * 0.05),
          pr.width * 0.08,
          Paint()
            ..color =
                i % 3 == 0 ? const Color(0xFFD7263D) : const Color(0xFFF2B53A));
      canvas.restore();
    }
  }

  void _throneChair(Canvas canvas, Offset base, double tw) {
    final back = Path()
      ..moveTo(base.dx - tw * 0.35, base.dy - tw * 0.55)
      ..lineTo(base.dx - tw * 0.38, base.dy - tw * 1.25)
      ..quadraticBezierTo(base.dx, base.dy - tw * 1.55, base.dx + tw * 0.38,
          base.dy - tw * 1.25)
      ..lineTo(base.dx + tw * 0.35, base.dy - tw * 0.55)
      ..close();
    canvas.drawPath(
        back,
        _grad(back.getBounds(),
            const [Color(0xFFFFF3B0), Color(0xFFF2B53A), Color(0xFFD79A1E)],
            begin: Alignment.topLeft, end: Alignment.bottomRight));
    final cushion = RRect.fromRectAndRadius(
        Rect.fromLTWH(
            base.dx - tw * 0.26, base.dy - tw * 1.15, tw * 0.52, tw * 0.55),
        Radius.circular(tw * 0.08));
    canvas.drawRRect(cushion, Paint()..color = const Color(0xFF8A1530));
    _star(canvas, cushion.center, tw * 0.1,
        Paint()..color = const Color(0xFFF2B53A));
    final seat = RRect.fromRectAndRadius(
        Rect.fromLTWH(
            base.dx - tw * 0.45, base.dy - tw * 0.62, tw * 0.9, tw * 0.22),
        Radius.circular(tw * 0.06));
    canvas.drawRRect(seat, Paint()..color = const Color(0xFFB8283F));
    canvas.drawRect(
        Rect.fromLTWH(
            base.dx - tw * 0.45, base.dy - tw * 0.4, tw * 0.9, tw * 0.4),
        _grad(Rect.fromLTWH(0, 0, tw, tw),
            const [Color(0xFFF2B53A), Color(0xFFB07A12)]));
    for (final dx in [-0.5, 0.5]) {
      canvas.drawCircle(Offset(base.dx + dx * tw, base.dy - tw * 0.62),
          tw * 0.07, Paint()..color = const Color(0xFFFFF3B0));
    }
    canvas.drawCircle(Offset(base.dx, base.dy - tw * 1.45), tw * 0.07,
        Paint()..color = const Color(0xFFE23D5C));
  }

  @override
  bool shouldRepaint(covariant _KingdomPainter old) =>
      old.t != t || old.scene != scene;
}
