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

/// A high-resolution, vector-drawn "squishy" avatar.
///
/// [look] is a compact description such as
/// `species:dragon|color:#5CC98A|texture:scales|fill:gold|hat:crown|gear:sword|bg:castle|fx:sparkles`.
/// Keys: species, color, texture, fill, hat, gear, bg, fx (class is ignored).
///
/// Whenever [burstKey] changes to a new non-empty value the squishy jumps for
/// joy inside a burst of stars (equip, purchase, unlock celebrations).
class SquishyAvatar extends StatefulWidget {
  const SquishyAvatar({
    super.key,
    this.width,
    this.height,
    this.look,
    this.animate,
    this.showBackground,
    this.burstKey,
  });

  final double? width;
  final double? height;
  final String? look;
  final bool? animate;
  final bool? showBackground;
  final String? burstKey;

  @override
  State<SquishyAvatar> createState() => _SquishyAvatarState();
}

class _SquishyAvatarState extends State<SquishyAvatar>
    with TickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2600),
  );
  late final AnimationController _burst = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate ?? true) _c.repeat();
  }

  @override
  void didUpdateWidget(covariant SquishyAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final a = widget.animate ?? true;
    if (a && !_c.isAnimating) _c.repeat();
    if (!a && _c.isAnimating) _c.stop();
    final k = widget.burstKey ?? '';
    if (k.isNotEmpty && k != (oldWidget.burstKey ?? '')) {
      _burst.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    _burst.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final look = _SquishyLook.parse(widget.look ?? '');
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: Listenable.merge([_c, _burst]),
        builder: (context, _) => CustomPaint(
          painter: _SquishyPainter(
            look: look,
            t: _c.value,
            showBackground: widget.showBackground ?? true,
            burst: _burst.isAnimating ? _burst.value : -1,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class _SquishyLook {
  _SquishyLook(this.v);
  final Map<String, String> v;

  static _SquishyLook parse(String raw) {
    final m = <String, String>{};
    for (final part in raw.split('|')) {
      final i = part.indexOf(':');
      if (i <= 0) continue;
      final k = part.substring(0, i).trim();
      final val = part.substring(i + 1).trim();
      if (val.isNotEmpty) m[k] = val;
    }
    return _SquishyLook(m);
  }

  String get species => v['species'] ?? 'bunny';
  String get color => v['color'] ?? _defaultColor[species] ?? '#F8B6C8';
  String get texture => v['texture'] ?? '';
  String get fill =>
      v['fill'] ?? (species == 'penguin' ? '#FFFFFF' : '#FFF4DE');
  String get hat => v['hat'] ?? '';
  String get gear => v['gear'] ?? '';
  String get bg => v['bg'] ?? '';
  String get fx => v['fx'] ?? '';

  static const _defaultColor = {
    'bunny': '#F8B6C8',
    'cat': '#FFC98B',
    'bear': '#C9A27E',
    'frog': '#8FD694',
    'penguin': '#4A5578',
    'dragon': '#5CC98A',
    'unicorn': '#F4ECFF',
    'axolotl': '#FFB3D1',
    'dumpling': '#FFF1DE',
    'butter': '#FFE27A',
    'cube': '#9EE6C9',
  };
}

Color _hex(String s, [Color fallback = const Color(0xFFF8B6C8)]) {
  var h = s.replaceAll('#', '').trim();
  if (h.length == 6) h = 'FF$h';
  final v = int.tryParse(h, radix: 16);
  return v == null ? fallback : Color(v);
}

Color _lighten(Color c, double t) => Color.lerp(c, Colors.white, t)!;
Color _darken(Color c, double t) => Color.lerp(c, Colors.black, t)!;

class _SquishyPainter extends CustomPainter {
  _SquishyPainter(
      {required this.look,
      required this.t,
      required this.showBackground,
      this.burst = -1});

  final _SquishyLook look;
  final double t;
  final bool showBackground;

  /// Celebration progress 0..1, or negative when idle.
  final double burst;

  static const _rainbow = [
    Color(0xFFFF8A8A),
    Color(0xFFFFC46B),
    Color(0xFFFFF07A),
    Color(0xFF8BE39A),
    Color(0xFF7CC8FF),
    Color(0xFFB79CFF),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final s = math.min(size.width, size.height);
    if (s <= 0) return;
    final origin = Offset((size.width - s) / 2, (size.height - s) / 2);
    canvas.save();
    canvas.translate(origin.dx, origin.dy);
    final full = Rect.fromLTWH(0, 0, s, s);

    if (showBackground) _background(canvas, full, s);

    final phase = math.sin(t * 2 * math.pi);
    var sx = 1 + 0.035 * phase;
    var sy = 1 - 0.035 * phase;
    // Celebration: squash, leap for joy, land with a wobble.
    var jump = 0.0;
    if (burst >= 0) {
      final b = burst;
      if (b < 0.12) {
        final k = b / 0.12;
        sx += 0.14 * k;
        sy -= 0.14 * k;
      } else if (b < 0.55) {
        final k = (b - 0.12) / 0.43;
        jump = math.sin(k * math.pi) * s * 0.11;
        sx -= 0.06 * math.sin(k * math.pi);
        sy += 0.08 * math.sin(k * math.pi);
      } else {
        final k = (b - 0.55) / 0.45;
        final wob = math.sin(k * math.pi * 4) * (1 - k) * 0.08;
        sx += wob;
        sy -= wob;
      }
    }

    final cx = s / 2;
    final bodyW = s * 0.60;
    final bodyH = s * 0.50;
    final bottom = s * 0.86;
    final body = Rect.fromLTWH(cx - bodyW / 2, bottom - bodyH, bodyW, bodyH);

    if (burst >= 0) _burstBack(canvas, body, s);

    // Ground shadow (shrinks while airborne).
    final air = 1 - (jump / (s * 0.11)) * 0.35;
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(cx, bottom + s * 0.01),
          width: bodyW * 0.95 * sx * air,
          height: s * 0.07 * air),
      Paint()
        ..color = Colors.black.withOpacity(0.16)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.015),
    );

    canvas.save();
    canvas.translate(0, -jump);
    // Effects behind the body.
    if (look.fx == 'glow') _glow(canvas, body, s);
    if (look.fx == 'flames') _flames(canvas, body, s);
    // Squish around the bottom centre.
    canvas.translate(cx, bottom);
    canvas.scale(sx, sy);
    canvas.translate(-cx, -bottom);

    final base = _bodyBase();
    if (look.gear == 'cape') _cape(canvas, body, s);
    _speciesBack(canvas, body, s, base);
    final bodyPath = _bodyPath(body);
    _bodyFill(canvas, bodyPath, body, base, s);
    canvas.save();
    canvas.clipPath(bodyPath);
    _texture(canvas, body, s, base);
    _belly(canvas, body, s);
    canvas.restore();
    // Soft rim + highlight.
    canvas.drawPath(
        bodyPath,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.012
          ..color = _darken(base, 0.25).withOpacity(0.55));
    canvas.drawOval(
      Rect.fromLTWH(body.left + bodyW * 0.16, body.top + bodyH * 0.10,
          bodyW * 0.26, bodyH * 0.14),
      Paint()
        ..color = Colors.white.withOpacity(0.45)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.012),
    );
    _speciesFront(canvas, body, s, base);
    _face(canvas, body, s);
    _hat(canvas, body, s);
    _gear(canvas, body, s);
    canvas.restore();

    // Effects in front.
    switch (look.fx) {
      case 'sparkles':
        _sparkles(canvas, s);
        break;
      case 'hearts':
        _hearts(canvas, s);
        break;
      case 'orbit':
        _orbit(canvas, body, s);
        break;
      case 'bubbles':
        _bubbles(canvas, s);
        break;
      case 'glow':
        _sparkles(canvas, s, gold: true);
        break;
      case 'snow':
        _fallers(
            canvas,
            s,
            14,
            (c, r, k) =>
                _snowflake(canvas, c, r, Colors.white.withOpacity(0.95 * k)),
            sway: 0.03);
        break;
      case 'leaves':
        const lc = [
          Color(0xFFE2763D),
          Color(0xFFF2B53A),
          Color(0xFFC0392B),
          Color(0xFF8B5A2B)
        ];
        var li = 0;
        _fallers(canvas, s, 10, (c, r, k) {
          canvas.save();
          canvas.translate(c.dx, c.dy);
          canvas.rotate(t * 6 + li);
          canvas.drawOval(
              Rect.fromCenter(
                  center: Offset.zero, width: r * 2.2, height: r * 1.2),
              Paint()..color = lc[li++ % lc.length].withOpacity(k));
          canvas.restore();
        }, sway: 0.06);
        break;
      case 'confetti':
        const cc = [
          Color(0xFFFF6F91),
          Color(0xFFFFE27A),
          Color(0xFF7CC8FF),
          Color(0xFF8BE39A),
          Color(0xFFB79CFF)
        ];
        var ci = 0;
        _fallers(canvas, s, 18, (c, r, k) {
          canvas.save();
          canvas.translate(c.dx, c.dy);
          canvas.rotate(t * 10 + ci);
          canvas.drawRect(
              Rect.fromCenter(
                  center: Offset.zero, width: r * 1.6, height: r * 0.8),
              Paint()..color = cc[ci++ % cc.length].withOpacity(k));
          canvas.restore();
        }, sway: 0.04);
        break;
      case 'bats':
        for (var i = 0; i < 4; i++) {
          final a = t * 2 * math.pi + i * math.pi / 2;
          final c = Offset(s * 0.5 + math.cos(a) * s * 0.38,
              s * 0.42 + math.sin(a) * s * 0.18 - s * 0.1);
          _bat(
              canvas,
              c,
              s * (0.035 + 0.01 * math.sin(t * 2 * math.pi * 4 + i)),
              const Color(0xFF3B2163));
        }
        break;
      case 'fireworks':
        const fc = [Color(0xFFFF6F91), Color(0xFFFFE27A), Color(0xFF7CC8FF)];
        for (var i = 0; i < 3; i++) {
          final k = (t * 1.5 + i / 3) % 1.0;
          final c = Offset(s * (0.18 + 0.32 * i), s * (0.16 + 0.08 * (i % 2)));
          for (var j = 0; j < 10; j++) {
            final a = j * math.pi / 5;
            final p0 =
                c + Offset(math.cos(a), math.sin(a)) * s * 0.12 * k * 0.4;
            final p1 = c + Offset(math.cos(a), math.sin(a)) * s * 0.12 * k;
            canvas.drawLine(
                p0,
                p1,
                Paint()
                  ..color = fc[i].withOpacity((1 - k).clamp(0.0, 1.0))
                  ..strokeWidth = s * 0.008
                  ..strokeCap = StrokeCap.round);
          }
        }
        break;
      case 'clovers':
        _fallers(canvas, s, 8, (c, r, k) => _clover(canvas, c, r * 1.2),
            sway: 0.05, up: true);
        break;
    }
    if (burst >= 0) _burstFront(canvas, body, s);
    canvas.restore();
  }

  // ---------------------------------------------------------------- celebration
  void _burstBack(Canvas canvas, Rect body, double s) {
    final c = body.center;
    // Golden shockwave rings.
    for (var i = 0; i < 2; i++) {
      final k = ((burst - i * 0.12) / 0.6).clamp(0.0, 1.0);
      if (k <= 0 || k >= 1) continue;
      canvas.drawCircle(
        c,
        s * (0.15 + 0.45 * Curves.easeOut.transform(k)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.03 * (1 - k)
          ..color = (i == 0 ? const Color(0xFFFFD84D) : const Color(0xFFFF8FD0))
              .withOpacity(1 - k),
      );
    }
    // Soft glow flash.
    final g = (1 - (burst / 0.5)).clamp(0.0, 1.0);
    if (g > 0) {
      canvas.drawCircle(
          c,
          s * 0.5,
          Paint()
            ..shader = RadialGradient(colors: [
              const Color(0xFFFFF3B0).withOpacity(0.8 * g),
              const Color(0xFFFFF3B0).withOpacity(0)
            ]).createShader(Rect.fromCircle(center: c, radius: s * 0.5)));
    }
  }

  void _burstFront(Canvas canvas, Rect body, double s) {
    final c = Offset(body.center.dx, body.center.dy - s * 0.05);
    const colors = [
      Color(0xFFFFD84D),
      Color(0xFFFFFFFF),
      Color(0xFFFF8FD0),
      Color(0xFFB79CFF),
      Color(0xFF7CE3C0),
      Color(0xFFFFB347)
    ];
    const n = 16;
    for (var i = 0; i < n; i++) {
      final delay = (i % 3) * 0.06;
      final k = ((burst - delay) / (1 - delay)).clamp(0.0, 1.0);
      if (k <= 0) continue;
      final a = i * 2 * math.pi / n + (i.isEven ? 0.15 : -0.1);
      final dist = s *
          (0.12 +
              (0.38 + 0.12 * (i % 4) / 3) * Curves.easeOutCubic.transform(k));
      final gravity = s * 0.18 * k * k;
      final p = c + Offset(math.cos(a) * dist, math.sin(a) * dist + gravity);
      final fade = (k < 0.7 ? 1.0 : (1 - (k - 0.7) / 0.3)).clamp(0.0, 1.0);
      final size = s * (0.028 + 0.018 * (i % 3)) * (k < 0.2 ? k / 0.2 : 1.0);
      canvas.save();
      canvas.translate(p.dx, p.dy);
      canvas.rotate(k * math.pi * (i.isEven ? 2 : -2));
      _star(canvas, Offset.zero, size,
          Paint()..color = colors[i % colors.length].withOpacity(fade));
      canvas.restore();
    }
    // Twinkles that pop near the avatar.
    for (var i = 0; i < 6; i++) {
      final k = ((burst - 0.25 - i * 0.05) / 0.4).clamp(0.0, 1.0);
      if (k <= 0 || k >= 1) continue;
      final a = i * math.pi / 3 + 0.5;
      final p = c + Offset(math.cos(a), math.sin(a)) * s * 0.3;
      _sparkleAt(canvas, p, s * 0.025 * math.sin(k * math.pi), gold: i.isOdd);
    }
  }

  // ---------------------------------------------------------------- shapes
  Path _bodyPath(Rect b) {
    if (_isBlock)
      return Path()
        ..addRRect(RRect.fromRectAndRadius(
            _blockFront(b), Radius.circular(b.width * 0.13)));
    if (look.species == 'dumpling') {
      // Plump dumpling: wide soft base rising to a pinched, pleated knot.
      final w = b.width * 1.12;
      final l = b.center.dx - w / 2;
      final r = l + w;
      final bot = b.bottom;
      final top = b.top + b.height * 0.04;
      return Path()
        ..moveTo(l + w * 0.14, bot)
        ..quadraticBezierTo(
            l - w * 0.02, bot, l + w * 0.01, bot - b.height * 0.30)
        ..cubicTo(l + w * 0.05, top + b.height * 0.28, b.center.dx - w * 0.16,
            top + b.height * 0.06, b.center.dx, top)
        ..cubicTo(b.center.dx + w * 0.16, top + b.height * 0.06, r - w * 0.05,
            top + b.height * 0.28, r - w * 0.01, bot - b.height * 0.30)
        ..quadraticBezierTo(r + w * 0.02, bot, r - w * 0.14, bot)
        ..close();
    }
    return Path()
      ..addRRect(RRect.fromRectAndCorners(
        b,
        topLeft: Radius.elliptical(b.width * 0.5, b.height * 0.62),
        topRight: Radius.elliptical(b.width * 0.5, b.height * 0.62),
        bottomLeft: Radius.elliptical(b.width * 0.40, b.height * 0.36),
        bottomRight: Radius.elliptical(b.width * 0.40, b.height * 0.36),
      ));
  }

  Color _bodyBase() {
    switch (look.color) {
      case 'gold':
        return const Color(0xFFF4C542);
      case 'rainbow':
        return const Color(0xFFFFC4E1);
      case 'galaxy':
        return const Color(0xFF3B2A78);
      case 'crystal':
        return const Color(0xFFBDEBFF);
      case 'silver':
        return const Color(0xFFCFD6E3);
    }
    return _hex(look.color);
  }

  Shader _specialShader(String kind, Rect r, Color base) {
    switch (kind) {
      case 'gold':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFF3B0),
            Color(0xFFF4C542),
            Color(0xFFD79A1E),
            Color(0xFFFFE27A)
          ],
          stops: [0, 0.4, 0.75, 1],
        ).createShader(r);
      case 'silver':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFC9D2E0),
            Color(0xFF8D99AE),
            Color(0xFFE8EDF5)
          ],
          stops: [0, 0.4, 0.75, 1],
        ).createShader(r);
      case 'rainbow':
        return LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _rainbow)
            .createShader(r);
      case 'galaxy':
        return const RadialGradient(
          center: Alignment(-0.3, -0.4),
          radius: 1.1,
          colors: [Color(0xFF8A6CFF), Color(0xFF3B2A78), Color(0xFF15123A)],
        ).createShader(r);
      case 'crystal':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFBDEBFF),
            Color(0xFFD9C8FF),
            Color(0xFF9FD8FF)
          ],
          stops: [0, 0.35, 0.7, 1],
        ).createShader(r);
    }
    return RadialGradient(
      center: const Alignment(-0.35, -0.45),
      radius: 1.05,
      colors: [_lighten(base, 0.38), base, _darken(base, 0.14)],
      stops: const [0, 0.55, 1],
    ).createShader(r);
  }

  Paint _skin(Rect r, Color base) =>
      Paint()..shader = _specialShader(look.color, r, base);

  void _bodyFill(Canvas canvas, Path path, Rect body, Color base, double s) {
    canvas.drawPath(path, _skin(body, base));
    if (look.color == 'galaxy') {
      final rnd = math.Random(7);
      canvas.save();
      canvas.clipPath(path);
      for (var i = 0; i < 40; i++) {
        final p = Offset(body.left + rnd.nextDouble() * body.width,
            body.top + rnd.nextDouble() * body.height);
        final tw = 0.5 + 0.5 * math.sin((t * 2 * math.pi) + i);
        canvas.drawCircle(p, s * (0.003 + rnd.nextDouble() * 0.006),
            Paint()..color = Colors.white.withOpacity(0.4 + 0.6 * tw));
      }
      canvas.restore();
    }
    if (look.color == 'crystal') {
      canvas.save();
      canvas.clipPath(path);
      final facet = Paint()..color = Colors.white.withOpacity(0.35);
      final w = body.width, h = body.height;
      canvas.drawPath(
          Path()
            ..moveTo(body.left + w * 0.1, body.top + h * 0.5)
            ..lineTo(body.left + w * 0.45, body.top)
            ..lineTo(body.left + w * 0.6, body.top + h * 0.35)
            ..close(),
          facet);
      canvas.drawPath(
          Path()
            ..moveTo(body.left + w * 0.7, body.bottom)
            ..lineTo(body.right, body.top + h * 0.45)
            ..lineTo(body.left + w * 0.8, body.top + h * 0.7)
            ..close(),
          facet);
      canvas.restore();
    }
  }

  // ---------------------------------------------------------------- species
  bool get _isBlock => look.species == 'butter' || look.species == 'cube';

  /// Front face of a block-shaped squishy (butter / cube).
  Rect _blockFront(Rect b) => look.species == 'butter'
      ? Rect.fromLTWH(b.left - b.width * 0.06, b.top + b.height * 0.26,
          b.width * 1.06, b.height * 0.74)
      : Rect.fromLTWH(b.left + b.width * 0.02, b.top + b.height * 0.16,
          b.width * 0.86, b.height * 0.84);

  /// 3D extrusion offset (to the back-right) of a block squishy.
  Offset _blockDepth(Rect b) => look.species == 'butter'
      ? Offset(b.width * 0.1, -b.height * 0.16)
      : Offset(b.width * 0.12, -b.height * 0.18);

  void _blockBack(Canvas canvas, Rect b, double s, Color base) {
    final f = _blockFront(b);
    final d = _blockDepth(b);
    final rad = Radius.circular(b.width * 0.13);
    final back = f.shift(d);
    canvas.drawRRect(RRect.fromRectAndRadius(back, rad),
        Paint()..color = _darken(base, 0.16));
    // Top face (lighter) and side face (darker) join the front to the back.
    final top = Path()
      ..moveTo(f.left + rad.x * 0.6, f.top + rad.y * 0.2)
      ..lineTo(back.left + rad.x * 0.6, back.top + rad.y * 0.2)
      ..lineTo(back.right - rad.x * 0.6, back.top + rad.y * 0.2)
      ..lineTo(f.right - rad.x * 0.6, f.top + rad.y * 0.2)
      ..close();
    canvas.drawPath(top, Paint()..color = _lighten(base, 0.22));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(back.left, back.top, back.right,
                back.top + (f.top - back.top) + rad.y),
            rad),
        Paint()..color = _lighten(base, 0.22));
    final side = Path()
      ..moveTo(f.right - rad.x * 0.2, f.top + rad.y * 0.6)
      ..lineTo(back.right - rad.x * 0.2, back.top + rad.y * 0.6)
      ..lineTo(back.right - rad.x * 0.2, back.bottom - rad.y * 0.6)
      ..lineTo(f.right - rad.x * 0.2, f.bottom - rad.y * 0.6)
      ..close();
    canvas.drawPath(side, Paint()..color = _darken(base, 0.1));
  }

  void _blockFront2(Canvas canvas, Rect b, double s, Color base) {
    final f = _blockFront(b);
    final d = _blockDepth(b);
    if (look.species == 'butter') {
      // A soft melting pat sitting on top, with drips over the front edge.
      final pat = Rect.fromCenter(
          center: Offset(f.center.dx + d.dx * 0.5, f.top + d.dy * 0.45),
          width: f.width * 0.42,
          height: (-d.dy) * 0.55);
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              pat.shift(Offset(0, s * 0.008)), Radius.circular(s * 0.03)),
          Paint()..color = _darken(base, 0.1));
      canvas.drawRRect(RRect.fromRectAndRadius(pat, Radius.circular(s * 0.03)),
          Paint()..color = const Color(0xFFFFF6CF));
      final drip = Paint()..color = _lighten(base, 0.35);
      final dripTop = f.top + s * 0.004;
      for (final x in [0.28, 0.52, 0.7]) {
        final cx = f.left + f.width * x;
        final len = s * (0.035 + 0.025 * ((x * 10).round() % 3));
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromLTWH(
                    cx - s * 0.018, dripTop - s * 0.01, s * 0.036, len),
                Radius.circular(s * 0.018)),
            drip);
        canvas.drawCircle(
            Offset(cx, dripTop + len - s * 0.01), s * 0.022, drip);
      }
      canvas.drawRect(
          Rect.fromLTWH(f.left + f.width * 0.12, dripTop - s * 0.012,
              f.width * 0.76, s * 0.02),
          drip);
    } else {
      // Jelly-cube shine.
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(f.left + f.width * 0.1, f.top + f.height * 0.08,
                  f.width * 0.12, f.height * 0.34),
              Radius.circular(s * 0.02)),
          Paint()..color = Colors.white.withOpacity(0.45));
      canvas.drawCircle(Offset(f.left + f.width * 0.16, f.top + f.height * 0.5),
          s * 0.012, Paint()..color = Colors.white.withOpacity(0.45));
    }
  }

  void _speciesBack(Canvas canvas, Rect b, double s, Color base) {
    if (_isBlock) {
      _blockBack(canvas, b, s, base);
      return;
    }
    final skin = _skin(b.inflate(s * 0.2), base);
    final inner = _fillPaint(b, s);
    final w = b.width, top = b.top;
    switch (look.species) {
      case 'bunny':
        for (final dir in [-1.0, 1.0]) {
          canvas.save();
          canvas.translate(b.center.dx + dir * w * 0.2, top + s * 0.06);
          canvas.rotate(dir * 0.18);
          final ear = RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset(0, -s * 0.13),
                  width: s * 0.12,
                  height: s * 0.30),
              Radius.circular(s * 0.06));
          canvas.drawRRect(ear, skin);
          canvas.drawRRect(ear.deflate(s * 0.025), inner);
          canvas.restore();
        }
        break;
      case 'cat':
      case 'unicorn':
        for (final dir in [-1.0, 1.0]) {
          final x = b.center.dx + dir * w * 0.28;
          final ear = Path()
            ..moveTo(x - dir * s * 0.10, top + s * 0.07)
            ..quadraticBezierTo(x - dir * s * 0.02, top - s * 0.12,
                x + dir * s * 0.03, top - s * 0.09)
            ..quadraticBezierTo(x + dir * s * 0.07, top - s * 0.02,
                x + dir * s * 0.07, top + s * 0.08)
            ..close();
          canvas.drawPath(ear, skin);
          final innerEar = Path()
            ..moveTo(x - dir * s * 0.06, top + s * 0.06)
            ..quadraticBezierTo(x - dir * s * 0.01, top - s * 0.07,
                x + dir * s * 0.02, top - s * 0.05)
            ..quadraticBezierTo(
                x + dir * s * 0.045, top, x + dir * s * 0.04, top + s * 0.07)
            ..close();
          canvas.drawPath(innerEar, inner);
        }
        break;
      case 'bear':
        for (final dir in [-1.0, 1.0]) {
          final c = Offset(b.center.dx + dir * w * 0.33, top + s * 0.04);
          canvas.drawCircle(c, s * 0.075, skin);
          canvas.drawCircle(c, s * 0.042, inner);
        }
        break;
      case 'dragon':
        // Wings.
        for (final dir in [-1.0, 1.0]) {
          final x = b.center.dx + dir * w * 0.45;
          final y = b.center.dy - s * 0.04;
          final wing = Path()
            ..moveTo(x, y + s * 0.06)
            ..quadraticBezierTo(x + dir * s * 0.10, y - s * 0.16,
                x + dir * s * 0.20, y - s * 0.14)
            ..quadraticBezierTo(x + dir * s * 0.15, y - s * 0.06,
                x + dir * s * 0.19, y - s * 0.02)
            ..quadraticBezierTo(
                x + dir * s * 0.12, y, x + dir * s * 0.14, y + s * 0.05)
            ..quadraticBezierTo(
                x + dir * s * 0.06, y + s * 0.03, x, y + s * 0.09)
            ..close();
          canvas.drawPath(wing, Paint()..color = _darken(base, 0.18));
          canvas.drawPath(
              wing,
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = s * 0.008
                ..color = _darken(base, 0.4));
        }
        // Back spikes.
        final spike = Paint()..color = _darken(base, 0.22);
        for (var i = -1; i <= 1; i++) {
          final x = b.center.dx + i * s * 0.08;
          final y = top + (i == 0 ? -s * 0.005 : s * 0.012);
          canvas.drawPath(
              Path()
                ..moveTo(x - s * 0.04, y + s * 0.04)
                ..lineTo(x, y - s * 0.05)
                ..lineTo(x + s * 0.04, y + s * 0.04)
                ..close(),
              spike);
        }
        break;
      case 'frog':
        for (final dir in [-1.0, 1.0]) {
          canvas.drawCircle(
              Offset(b.center.dx + dir * w * 0.24, top + s * 0.035),
              s * 0.085,
              skin);
        }
        break;
      case 'axolotl':
        final gill = Paint()
          ..color = _darken(_hex('#FF7FAE'), 0.05)
          ..strokeCap = StrokeCap.round
          ..strokeWidth = s * 0.035;
        for (final dir in [-1.0, 1.0]) {
          for (var i = 0; i < 3; i++) {
            final start = Offset(b.center.dx + dir * w * 0.42,
                b.top + b.height * (0.22 + i * 0.13));
            final end =
                start + Offset(dir * s * 0.11, (i - 1) * s * 0.055 - s * 0.02);
            canvas.drawLine(start, end, gill);
            canvas.drawCircle(end, s * 0.022, Paint()..color = _hex('#FF7FAE'));
          }
        }
        break;
      case 'penguin':
        for (final dir in [-1.0, 1.0]) {
          canvas.save();
          canvas.translate(
              b.center.dx + dir * w * 0.48, b.center.dy + s * 0.05);
          canvas.rotate(dir * -0.5);
          canvas.drawOval(
              Rect.fromCenter(
                  center: Offset.zero, width: s * 0.08, height: s * 0.18),
              Paint()..color = _darken(base, 0.1));
          canvas.restore();
        }
        break;
    }
  }

  void _speciesFront(Canvas canvas, Rect b, double s, Color base) {
    if (_isBlock) {
      _blockFront2(canvas, b, s, base);
      return;
    }
    switch (look.species) {
      case 'dumpling':
        final top = Offset(b.center.dx, b.top + b.height * 0.04);
        final pleat = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.011
          ..strokeCap = StrokeCap.round
          ..color = _darken(base, 0.22).withOpacity(0.55);
        for (var i = -3; i <= 3; i++) {
          if (i == 0) continue;
          final end = Offset(b.center.dx + i * b.width * 0.085,
              b.top + b.height * (0.30 - i.abs() * 0.025));
          final ctrl =
              Offset(b.center.dx + i * b.width * 0.03, b.top + b.height * 0.12);
          canvas.drawPath(
              Path()
                ..moveTo(top.dx, top.dy + s * 0.01)
                ..quadraticBezierTo(ctrl.dx, ctrl.dy, end.dx, end.dy),
              pleat);
        }
        // Little twisted knot on top.
        canvas.drawOval(
            Rect.fromCenter(
                center: top + Offset(0, s * 0.005),
                width: s * 0.06,
                height: s * 0.035),
            Paint()..color = _lighten(base, 0.15));
        canvas.drawOval(
            Rect.fromCenter(
                center: top + Offset(0, s * 0.005),
                width: s * 0.06,
                height: s * 0.035),
            pleat);
        break;
      case 'unicorn':
        final x = b.center.dx, top = b.top;
        final horn = Path()
          ..moveTo(x - s * 0.045, top + s * 0.03)
          ..lineTo(x, top - s * 0.17)
          ..lineTo(x + s * 0.045, top + s * 0.03)
          ..close();
        canvas.drawPath(
            horn,
            Paint()
              ..shader = const LinearGradient(
                      colors: [Color(0xFFFFF3B0), Color(0xFFF4C542)])
                  .createShader(horn.getBounds()));
        final line = Paint()
          ..color = const Color(0xFFD79A1E)
          ..strokeWidth = s * 0.008;
        for (var i = 1; i <= 3; i++) {
          final y = top + s * 0.03 - i * s * 0.045;
          final half = s * 0.045 * (1 - i * 0.22);
          canvas.drawLine(Offset(x - half, y + s * 0.01),
              Offset(x + half, y - s * 0.01), line);
        }
        // Mane tuft.
        for (var i = 0; i < 4; i++) {
          canvas.drawCircle(
              Offset(x - s * 0.12 + i * s * 0.03,
                  top + s * 0.05 + (i.isEven ? 0 : s * 0.01)),
              s * 0.03,
              Paint()..color = _rainbow[(i + 2) % _rainbow.length]);
        }
        break;
      case 'dragon':
        for (final dir in [-1.0, 1.0]) {
          final x = b.center.dx + dir * b.width * 0.2;
          final y = b.top + s * 0.03;
          final horn = Path()
            ..moveTo(x - s * 0.03, y + s * 0.02)
            ..quadraticBezierTo(x + dir * s * 0.02, y - s * 0.08,
                x + dir * s * 0.07, y - s * 0.10)
            ..quadraticBezierTo(
                x + dir * s * 0.03, y - s * 0.04, x + s * 0.03, y + s * 0.02)
            ..close();
          canvas.drawPath(horn, Paint()..color = const Color(0xFFFFF1D0));
          canvas.drawPath(
              horn,
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = s * 0.006
                ..color = const Color(0xFFC9A66B));
        }
        break;
    }
  }

  Paint _fillPaint(Rect b, double s) {
    switch (look.fill) {
      case 'gold':
      case 'rainbow':
      case 'silver':
        return Paint()..shader = _specialShader(look.fill, b, Colors.white);
      case 'starry':
        return Paint()..color = const Color(0xFF2B2363);
    }
    return Paint()..color = _hex(look.fill, const Color(0xFFFFF4DE));
  }

  void _belly(Canvas canvas, Rect b, double s) {
    final belly = _isBlock
        ? Rect.fromCenter(
            center:
                Offset(_blockFront(b).center.dx, b.bottom - b.height * 0.16),
            width: b.width * 0.5,
            height: b.height * 0.3)
        : Rect.fromCenter(
            center: Offset(b.center.dx, b.bottom - b.height * 0.22),
            width: b.width * 0.56,
            height: b.height * 0.46);
    if (_isBlock) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(belly, Radius.circular(belly.height * 0.35)),
          _fillPaint(belly, s));
    } else {
      canvas.drawOval(belly, _fillPaint(belly, s));
    }
    if (look.fill == 'starry') {
      final rnd = math.Random(3);
      for (var i = 0; i < 12; i++) {
        final p = Offset(
            belly.left + belly.width * (0.15 + rnd.nextDouble() * 0.7),
            belly.top + belly.height * (0.15 + rnd.nextDouble() * 0.7));
        _star(canvas, p, s * 0.012, Paint()..color = const Color(0xFFFFE27A));
      }
    }
  }

  // ---------------------------------------------------------------- textures
  void _texture(Canvas canvas, Rect b, double s, Color base) {
    final light = Paint()..color = Colors.white.withOpacity(0.42);
    final dark = Paint()..color = _darken(base, 0.22).withOpacity(0.55);
    switch (look.texture) {
      case 'dots':
        for (var y = b.top; y < b.bottom; y += s * 0.07) {
          final odd = ((y - b.top) / (s * 0.07)).round().isOdd;
          for (var x = b.left + (odd ? s * 0.035 : 0);
              x < b.right;
              x += s * 0.07) {
            canvas.drawCircle(Offset(x, y), s * 0.016, light);
          }
        }
        break;
      case 'stripes':
        final p = Paint()
          ..color = Colors.white.withOpacity(0.35)
          ..strokeWidth = s * 0.03;
        for (var x = b.left - b.height; x < b.right; x += s * 0.075) {
          canvas.drawLine(Offset(x, b.bottom), Offset(x + b.height, b.top), p);
        }
        break;
      case 'hearts':
        for (var y = b.top + s * 0.03; y < b.bottom; y += s * 0.09) {
          final odd = ((y - b.top) / (s * 0.09)).round().isOdd;
          for (var x = b.left + (odd ? s * 0.045 : 0);
              x < b.right;
              x += s * 0.09) {
            _heart(canvas, Offset(x, y), s * 0.022,
                Paint()..color = const Color(0xFFFF6F91).withOpacity(0.55));
          }
        }
        break;
      case 'stars':
        for (var y = b.top + s * 0.03; y < b.bottom; y += s * 0.09) {
          final odd = ((y - b.top) / (s * 0.09)).round().isOdd;
          for (var x = b.left + (odd ? s * 0.045 : 0);
              x < b.right;
              x += s * 0.09) {
            _star(canvas, Offset(x, y), s * 0.02,
                Paint()..color = const Color(0xFFFFF3B0).withOpacity(0.85));
          }
        }
        break;
      case 'scales':
        final p = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.008
          ..color = _darken(base, 0.28).withOpacity(0.6);
        final r = s * 0.035;
        var row = 0;
        for (var y = b.top; y < b.bottom + r; y += r * 1.1) {
          for (var x = b.left - r + (row.isOdd ? r : 0);
              x < b.right + r;
              x += r * 2) {
            canvas.drawArc(Rect.fromCircle(center: Offset(x, y), radius: r), 0,
                math.pi, false, p);
          }
          row++;
        }
        break;
      case 'sparkle':
        final rnd = math.Random(11);
        for (var i = 0; i < 46; i++) {
          final p = Offset(b.left + rnd.nextDouble() * b.width,
              b.top + rnd.nextDouble() * b.height);
          final tw =
              0.45 + 0.55 * (0.5 + 0.5 * math.sin(t * 2 * math.pi * 2 + i));
          final c = i.isEven ? Colors.white : const Color(0xFFFFE27A);
          _diamond(canvas, p, s * (0.006 + rnd.nextDouble() * 0.01),
              Paint()..color = c.withOpacity(tw));
        }
        break;
      case 'fuzzy':
        final rnd = math.Random(5);
        final p = Paint()
          ..strokeWidth = s * 0.006
          ..strokeCap = StrokeCap.round;
        for (var i = 0; i < 260; i++) {
          final o = Offset(b.left + rnd.nextDouble() * b.width,
              b.top + rnd.nextDouble() * b.height);
          final a = rnd.nextDouble() * math.pi * 2;
          p.color = (i.isEven
              ? Colors.white.withOpacity(0.35)
              : _darken(base, 0.18).withOpacity(0.35));
          canvas.drawLine(
              o, o + Offset(math.cos(a), math.sin(a)) * s * 0.018, p);
        }
        break;
      case 'checker':
        final c = s * 0.07;
        var r = 0;
        for (var y = b.top; y < b.bottom; y += c) {
          var col = 0;
          for (var x = b.left; x < b.right; x += c) {
            if ((r + col).isEven)
              canvas.drawRect(Rect.fromLTWH(x, y, c, c),
                  Paint()..color = Colors.white.withOpacity(0.28));
            col++;
          }
          r++;
        }
        break;
      case 'swirl':
        final p = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.012
          ..color = Colors.white.withOpacity(0.4);
        for (var i = 0; i < 5; i++) {
          canvas.drawArc(
              Rect.fromCircle(
                  center: Offset(b.left + b.width * (0.2 + 0.15 * i),
                      b.top + b.height * (0.3 + 0.12 * (i % 3))),
                  radius: s * 0.05),
              0,
              math.pi * 1.5,
              false,
              p);
        }
        break;
      case 'candystripe':
        final p = Paint()
          ..color = const Color(0xFFE23D4B).withOpacity(0.75)
          ..strokeWidth = s * 0.035;
        for (var x = b.left - b.height; x < b.right; x += s * 0.1) {
          canvas.drawLine(Offset(x, b.bottom), Offset(x + b.height, b.top), p);
        }
        final w2 = Paint()
          ..color = Colors.white.withOpacity(0.55)
          ..strokeWidth = s * 0.012;
        for (var x = b.left - b.height + s * 0.05; x < b.right; x += s * 0.1) {
          canvas.drawLine(Offset(x, b.bottom), Offset(x + b.height, b.top), w2);
        }
        break;
      case 'snowflakes':
        var row = 0;
        for (var y = b.top + s * 0.03; y < b.bottom; y += s * 0.09) {
          for (var x = b.left + (row.isOdd ? s * 0.045 : 0);
              x < b.right;
              x += s * 0.09) {
            _snowflake(canvas, Offset(x, y), s * 0.022,
                Colors.white.withOpacity(0.85));
          }
          row++;
        }
        break;
      case 'pumpkinribs':
        final p = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.012
          ..color = _darken(base, 0.3).withOpacity(0.55);
        for (var i = -3; i <= 3; i++) {
          final x = b.center.dx + i * b.width * 0.14;
          canvas.drawPath(
              Path()
                ..moveTo(x, b.top)
                ..quadraticBezierTo(x + i * s * 0.03, b.center.dy, x, b.bottom),
              p);
        }
        for (var i = 0; i < 4; i++) {
          final c = Offset(b.left + b.width * (0.18 + 0.22 * i),
              b.top + b.height * (0.2 + 0.15 * (i % 2)));
          _bat(canvas, c, s * 0.03, const Color(0xFF3B2163).withOpacity(0.5));
        }
        break;
      case 'eastereggs':
        const bands = [
          Color(0xFFFFB8D0),
          Color(0xFFB8E6FF),
          Color(0xFFFFF0A0),
          Color(0xFFCDB4FF),
          Color(0xFFB8F0C8)
        ];
        var i = 0;
        for (var y = b.top; y < b.bottom; y += s * 0.07) {
          final zig = Path()..moveTo(b.left, y);
          for (var x = b.left; x < b.right + s * 0.04; x += s * 0.04) {
            zig.lineTo(x + s * 0.02, y + s * 0.025);
            zig.lineTo(x + s * 0.04, y);
          }
          canvas.drawPath(
              zig,
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = s * 0.018
                ..color = bands[i++ % bands.length].withOpacity(0.85));
        }
        break;
      case 'shamrocks':
        var row = 0;
        for (var y = b.top + s * 0.03; y < b.bottom; y += s * 0.1) {
          for (var x = b.left + (row.isOdd ? s * 0.05 : 0);
              x < b.right;
              x += s * 0.1) {
            _clover(canvas, Offset(x, y), s * 0.024);
          }
          row++;
        }
        break;
      case 'starsstripes':
        for (var y = b.top + b.height * 0.45; y < b.bottom; y += s * 0.07) {
          canvas.drawRect(Rect.fromLTWH(b.left, y, b.width, s * 0.035),
              Paint()..color = const Color(0xFFE23D4B).withOpacity(0.6));
        }
        canvas.drawRect(Rect.fromLTWH(b.left, b.top, b.width, b.height * 0.42),
            Paint()..color = const Color(0xFF2F5BD9).withOpacity(0.55));
        for (var i = 0; i < 12; i++) {
          _star(
              canvas,
              Offset(
                  b.left +
                      b.width * (0.12 + 0.19 * (i % 5)) +
                      ((i ~/ 5).isOdd ? s * 0.03 : 0.0),
                  b.top + b.height * (0.08 + 0.12 * (i ~/ 5))),
              s * 0.016,
              Paint()..color = Colors.white.withOpacity(0.9));
        }
        break;
    }
    // Keep the variables used even for textures that don't need them.
    if (look.texture == 'unused') canvas.drawRect(b, dark);
  }

  // ---------------------------------------------------------------- face
  void _face(Canvas canvas, Rect b, double s) {
    final cx = _isBlock ? _blockFront(b).center.dx : b.center.dx;
    final eyeY = b.top +
        b.height *
            (look.species == 'frog'
                ? 0.20
                : look.species == 'dumpling'
                    ? 0.52
                    : _isBlock
                        ? 0.5
                        : 0.40);
    final eyeDx = b.width *
        (look.species == 'frog'
            ? 0.24
            : look.species == 'dumpling'
                ? 0.19
                : 0.17);
    final blink = (t > 0.93 && t < 0.97);
    for (final dir in [-1.0, 1.0]) {
      final c = Offset(cx + dir * eyeDx, eyeY);
      if (look.species == 'frog')
        canvas.drawCircle(c, s * 0.05, Paint()..color = Colors.white);
      if (blink) {
        canvas.drawLine(
            c - Offset(s * 0.028, 0),
            c + Offset(s * 0.028, 0),
            Paint()
              ..color = const Color(0xFF2A1B3D)
              ..strokeWidth = s * 0.012
              ..strokeCap = StrokeCap.round);
      } else {
        canvas.drawOval(
            Rect.fromCenter(center: c, width: s * 0.056, height: s * 0.068),
            Paint()..color = const Color(0xFF2A1B3D));
        canvas.drawCircle(c + Offset(-s * 0.011, -s * 0.014), s * 0.012,
            Paint()..color = Colors.white);
        canvas.drawCircle(c + Offset(s * 0.012, s * 0.013), s * 0.006,
            Paint()..color = Colors.white.withOpacity(0.8));
      }
      // Blush.
      canvas.drawOval(
        Rect.fromCenter(
            center: Offset(cx + dir * eyeDx * 1.45, eyeY + s * 0.055),
            width: s * 0.07,
            height: s * 0.035),
        Paint()..color = const Color(0xFFFF7FA0).withOpacity(0.45),
      );
    }
    final mouthY = eyeY + s * 0.05;
    if (look.species == 'penguin') {
      canvas.drawPath(
          Path()
            ..moveTo(cx - s * 0.03, mouthY - s * 0.01)
            ..lineTo(cx + s * 0.03, mouthY - s * 0.01)
            ..lineTo(cx, mouthY + s * 0.03)
            ..close(),
          Paint()..color = const Color(0xFFFFA63D));
    } else {
      final mouth = Path()
        ..moveTo(cx - s * 0.03, mouthY)
        ..quadraticBezierTo(cx - s * 0.015, mouthY + s * 0.022, cx, mouthY)
        ..quadraticBezierTo(
            cx + s * 0.015, mouthY + s * 0.022, cx + s * 0.03, mouthY);
      canvas.drawPath(
          mouth,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = s * 0.009
            ..strokeCap = StrokeCap.round
            ..color = const Color(0xFF2A1B3D));
    }
  }

  // ---------------------------------------------------------------- hats
  void _hat(Canvas canvas, Rect b, double s) {
    final cx = b.center.dx;
    final top = b.top;
    final gold = Paint()
      ..shader = _specialShader(
          'gold',
          Rect.fromLTWH(cx - s * 0.2, top - s * 0.2, s * 0.4, s * 0.25),
          Colors.white);
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.007
      ..color = const Color(0xFFB07A12);
    switch (look.hat) {
      case 'crown':
        final y = top + s * 0.04;
        final crown = Path()
          ..moveTo(cx - s * 0.14, y)
          ..lineTo(cx - s * 0.16, y - s * 0.12)
          ..lineTo(cx - s * 0.08, y - s * 0.06)
          ..lineTo(cx, y - s * 0.16)
          ..lineTo(cx + s * 0.08, y - s * 0.06)
          ..lineTo(cx + s * 0.16, y - s * 0.12)
          ..lineTo(cx + s * 0.14, y)
          ..close();
        canvas.drawPath(crown, gold);
        canvas.drawPath(crown, outline);
        canvas.drawCircle(Offset(cx, y - s * 0.035), s * 0.022,
            Paint()..color = const Color(0xFFE23D5C));
        canvas.drawCircle(Offset(cx - s * 0.09, y - s * 0.025), s * 0.014,
            Paint()..color = const Color(0xFF3D8BE2));
        canvas.drawCircle(Offset(cx + s * 0.09, y - s * 0.025), s * 0.014,
            Paint()..color = const Color(0xFF3DC28A));
        for (final p in [
          Offset(cx - s * 0.16, y - s * 0.12),
          Offset(cx, y - s * 0.16),
          Offset(cx + s * 0.16, y - s * 0.12)
        ]) {
          canvas.drawCircle(p, s * 0.016, gold);
        }
        break;
      case 'tiara':
        final y = top + s * 0.05;
        final tiara = Path()
          ..moveTo(cx - s * 0.15, y)
          ..quadraticBezierTo(cx, y - s * 0.13, cx + s * 0.15, y)
          ..quadraticBezierTo(cx, y - s * 0.07, cx - s * 0.15, y)
          ..close();
        canvas.drawPath(
            tiara,
            Paint()
              ..shader =
                  _specialShader('silver', tiara.getBounds(), Colors.white));
        canvas.drawCircle(Offset(cx, y - s * 0.085), s * 0.026,
            Paint()..color = const Color(0xFFB07BFF));
        canvas.drawCircle(Offset(cx - s * 0.006, y - s * 0.092), s * 0.008,
            Paint()..color = Colors.white);
        break;
      case 'helm':
      case 'dragonhelm':
        final dragon = look.hat == 'dragonhelm';
        final r =
            Rect.fromLTWH(cx - s * 0.2, top - s * 0.07, s * 0.4, s * 0.25);
        final helm = Path()
          ..moveTo(r.left, r.bottom)
          ..quadraticBezierTo(r.left, r.top, cx, r.top)
          ..quadraticBezierTo(r.right, r.top, r.right, r.bottom)
          ..close();
        canvas.drawPath(
            helm,
            Paint()
              ..shader = dragon
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                          Color(0xFF9BE3A8),
                          Color(0xFF2E8B57),
                          Color(0xFF1C5C3A)
                        ]).createShader(r)
                  : _specialShader('silver', r, Colors.white));
        canvas.drawPath(
            helm,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.008
              ..color =
                  dragon ? const Color(0xFF14432A) : const Color(0xFF6B7891));
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromLTWH(
                    cx - s * 0.13, r.bottom - s * 0.06, s * 0.26, s * 0.025),
                Radius.circular(s * 0.01)),
            Paint()..color = const Color(0xFF2A2F45));
        if (dragon) {
          for (var i = -2; i <= 2; i++) {
            final x = cx + i * s * 0.035;
            final yb = r.top + (i.abs() * s * 0.012);
            canvas.drawPath(
                Path()
                  ..moveTo(x - s * 0.02, yb + s * 0.02)
                  ..lineTo(x, yb - s * 0.05 + i.abs() * s * 0.012)
                  ..lineTo(x + s * 0.02, yb + s * 0.02)
                  ..close(),
                Paint()..color = const Color(0xFFE2553D));
          }
        } else {
          final plume = Path()
            ..moveTo(cx, r.top + s * 0.01)
            ..quadraticBezierTo(cx + s * 0.02, r.top - s * 0.13, cx + s * 0.16,
                r.top - s * 0.09)
            ..quadraticBezierTo(cx + s * 0.06, r.top - s * 0.06, cx + s * 0.03,
                r.top + s * 0.02)
            ..close();
          canvas.drawPath(plume, Paint()..color = const Color(0xFFE23D5C));
        }
        break;
      case 'wizard':
        final hat = Path()
          ..moveTo(cx - s * 0.17, top + s * 0.05)
          ..quadraticBezierTo(
              cx - s * 0.02, top - s * 0.05, cx + s * 0.05, top - s * 0.24)
          ..quadraticBezierTo(
              cx + s * 0.05, top - s * 0.05, cx + s * 0.17, top + s * 0.05)
          ..close();
        canvas.drawPath(
            hat,
            Paint()
              ..shader = const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF8A6CFF), Color(0xFF4B2FA6)])
                  .createShader(hat.getBounds()));
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(cx, top + s * 0.05),
                width: s * 0.42,
                height: s * 0.07),
            Paint()..color = const Color(0xFF3B2580));
        _star(canvas, Offset(cx - s * 0.01, top - s * 0.06), s * 0.025,
            Paint()..color = const Color(0xFFFFE27A));
        _star(canvas, Offset(cx + s * 0.04, top - s * 0.14), s * 0.015,
            Paint()..color = const Color(0xFFFFE27A));
        break;
      case 'horns':
        for (final dir in [-1.0, 1.0]) {
          final x = cx + dir * s * 0.16;
          final y = top + s * 0.06;
          final horn = Path()
            ..moveTo(x - dir * s * 0.03, y)
            ..quadraticBezierTo(x + dir * s * 0.08, y - s * 0.02,
                x + dir * s * 0.09, y - s * 0.16)
            ..quadraticBezierTo(x + dir * s * 0.03, y - s * 0.07,
                x - dir * s * 0.03, y - s * 0.06)
            ..close();
          canvas.drawPath(
              horn,
              Paint()
                ..shader = const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFFFFF1D0), Color(0xFFC9A66B)])
                    .createShader(horn.getBounds()));
        }
        break;
      case 'jester':
        final y = top + s * 0.07;
        const jc = [Color(0xFF8A4FE0), Color(0xFFF2B53A), Color(0xFFE23D5C)];
        final tips = [
          Offset(cx - s * 0.25, top - s * 0.02),
          Offset(cx, top - s * 0.17),
          Offset(cx + s * 0.25, top - s * 0.02)
        ];
        for (var i = 0; i < 3; i++) {
          final tip = tips[i];
          final droop = Offset(tip.dx + (i - 1) * s * 0.03, tip.dy + s * 0.05);
          final flap = Path()
            ..moveTo(cx + (i - 1) * s * 0.11 - s * 0.07, y)
            ..quadraticBezierTo(tip.dx - (i - 1) * s * 0.02, tip.dy - s * 0.04,
                droop.dx, droop.dy)
            ..quadraticBezierTo(tip.dx - (i - 1) * s * 0.06, tip.dy + s * 0.04,
                cx + (i - 1) * s * 0.11 + s * 0.07, y)
            ..close();
          canvas.drawPath(flap, Paint()..color = jc[i]);
          canvas.drawPath(
              flap,
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = s * 0.006
                ..color = _darken(jc[i], 0.3));
          canvas.drawCircle(
              droop,
              s * 0.025,
              Paint()
                ..shader = _specialShader(
                    'gold',
                    Rect.fromCircle(center: droop, radius: s * 0.025),
                    Colors.white));
        }
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset(cx, y), width: s * 0.36, height: s * 0.05),
                Radius.circular(s * 0.025)),
            Paint()..color = const Color(0xFFF2B53A));
        for (var i = -2; i <= 2; i++) {
          _diamond(
              canvas,
              Offset(cx + i * s * 0.065, y),
              s * 0.016,
              Paint()
                ..color = i.isEven
                    ? const Color(0xFF8A4FE0)
                    : const Color(0xFFE23D5C));
        }
        break;
      case 'circlet':
        final y = top + s * 0.06;
        final band = Path()
          ..moveTo(cx - s * 0.17, y + s * 0.02)
          ..quadraticBezierTo(cx, y - s * 0.05, cx + s * 0.17, y + s * 0.02)
          ..quadraticBezierTo(cx, y - s * 0.015, cx - s * 0.17, y + s * 0.02)
          ..close();
        canvas.drawPath(band, gold);
        canvas.drawPath(band, outline);
        canvas.drawPath(
            Path()
              ..moveTo(cx - s * 0.03, y - s * 0.02)
              ..lineTo(cx, y - s * 0.075)
              ..lineTo(cx + s * 0.03, y - s * 0.02)
              ..close(),
            gold);
        canvas.drawCircle(Offset(cx, y - s * 0.03), s * 0.018,
            Paint()..color = const Color(0xFF3D8BE2));
        break;
      case 'santa':
        final y = top + s * 0.06;
        final cap = Path()
          ..moveTo(cx - s * 0.18, y)
          ..quadraticBezierTo(
              cx - s * 0.1, top - s * 0.16, cx + s * 0.08, top - s * 0.15)
          ..quadraticBezierTo(
              cx + s * 0.2, top - s * 0.13, cx + s * 0.24, top - s * 0.02)
          ..quadraticBezierTo(cx + s * 0.12, top - s * 0.06, cx + s * 0.18, y)
          ..close();
        canvas.drawPath(
            cap,
            Paint()
              ..shader = const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFF5A6E), Color(0xFFC81E3A)])
                  .createShader(cap.getBounds()));
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset(cx, y), width: s * 0.42, height: s * 0.07),
                Radius.circular(s * 0.035)),
            Paint()..color = Colors.white);
        canvas.drawCircle(Offset(cx + s * 0.24, top - s * 0.01), s * 0.04,
            Paint()..color = Colors.white);
        break;
      case 'witch':
        final brim = Rect.fromCenter(
            center: Offset(cx, top + s * 0.05),
            width: s * 0.5,
            height: s * 0.08);
        final cone = Path()
          ..moveTo(cx - s * 0.15, top + s * 0.05)
          ..quadraticBezierTo(
              cx - s * 0.05, top - s * 0.1, cx + s * 0.1, top - s * 0.27)
          ..quadraticBezierTo(
              cx + s * 0.04, top - s * 0.08, cx + s * 0.15, top + s * 0.05)
          ..close();
        canvas.drawOval(brim, Paint()..color = const Color(0xFF3B2163));
        canvas.drawPath(
            cone,
            Paint()
              ..shader = const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF6B3FA0), Color(0xFF3B2163)])
                  .createShader(cone.getBounds()));
        canvas.drawRect(
            Rect.fromLTWH(cx - s * 0.135, top + s * 0.0, s * 0.27, s * 0.035),
            Paint()..color = const Color(0xFFFF8C2E));
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset(cx, top + s * 0.017),
                    width: s * 0.05,
                    height: s * 0.045),
                Radius.circular(s * 0.008)),
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.008
              ..color = const Color(0xFFFFE27A));
        break;
      case 'antlers':
        final ap = Paint()
          ..color = const Color(0xFF9B6A3C)
          ..strokeWidth = s * 0.03
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;
        for (final d in [-1.0, 1.0]) {
          final b0 = Offset(cx + d * s * 0.1, top + s * 0.05);
          final tip = Offset(cx + d * s * 0.2, top - s * 0.16);
          canvas.drawPath(
              Path()
                ..moveTo(b0.dx, b0.dy)
                ..quadraticBezierTo(
                    cx + d * s * 0.12, top - s * 0.08, tip.dx, tip.dy),
              ap);
          canvas.drawLine(Offset(cx + d * s * 0.14, top - s * 0.06),
              Offset(cx + d * s * 0.24, top - s * 0.08), ap);
          canvas.drawLine(Offset(cx + d * s * 0.16, top - s * 0.11),
              Offset(cx + d * s * 0.12, top - s * 0.19), ap);
        }
        canvas.drawCircle(Offset(cx, top + s * 0.2), s * 0.035,
            Paint()..color = const Color(0xFFFF3B4E));
        canvas.drawCircle(Offset(cx - s * 0.01, top + s * 0.19), s * 0.01,
            Paint()..color = Colors.white.withOpacity(0.8));
        break;
      case 'bunnyears':
        for (final d in [-1.0, 1.0]) {
          final ear = Rect.fromCenter(
              center: Offset(cx + d * s * 0.09, top - s * 0.08),
              width: s * 0.1,
              height: s * 0.26);
          canvas.save();
          canvas.translate(ear.center.dx, ear.center.dy);
          canvas.rotate(d * 0.18);
          canvas.translate(-ear.center.dx, -ear.center.dy);
          canvas.drawOval(ear, Paint()..color = Colors.white);
          canvas.drawOval(
              ear.deflate(s * 0.022), Paint()..color = const Color(0xFFFFB8D0));
          canvas.restore();
        }
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset(cx, top + s * 0.04),
                    width: s * 0.3,
                    height: s * 0.035),
                Radius.circular(s * 0.02)),
            Paint()..color = const Color(0xFFCDB4FF));
        break;
      case 'leprechaun':
        final brim = Rect.fromCenter(
            center: Offset(cx, top + s * 0.05),
            width: s * 0.42,
            height: s * 0.07);
        final body = Rect.fromLTRB(
            cx - s * 0.12, top - s * 0.15, cx + s * 0.12, top + s * 0.05);
        canvas.drawOval(brim, Paint()..color = const Color(0xFF1F7A43));
        canvas.drawPath(
            Path()
              ..moveTo(body.left, body.bottom)
              ..lineTo(body.left + s * 0.02, body.top)
              ..lineTo(body.right - s * 0.02, body.top)
              ..lineTo(body.right, body.bottom)
              ..close(),
            Paint()
              ..shader = const LinearGradient(
                      colors: [Color(0xFF3DBE6C), Color(0xFF1F7A43)])
                  .createShader(body));
        canvas.drawRect(
            Rect.fromLTWH(
                body.left, body.bottom - s * 0.06, body.width, s * 0.035),
            Paint()..color = const Color(0xFF2A1B3D));
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset(cx, body.bottom - s * 0.043),
                    width: s * 0.06,
                    height: s * 0.045),
                Radius.circular(s * 0.006)),
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.008
              ..color = const Color(0xFFFFD84D));
        _clover(canvas, Offset(body.right - s * 0.02, body.top + s * 0.06),
            s * 0.03);
        break;
      case 'partyhat':
        final cone = Path()
          ..moveTo(cx - s * 0.11, top + s * 0.05)
          ..lineTo(cx + s * 0.02, top - s * 0.22)
          ..lineTo(cx + s * 0.13, top + s * 0.05)
          ..close();
        canvas.drawPath(
            cone,
            Paint()
              ..shader = const LinearGradient(
                      colors: [Color(0xFF7CC8FF), Color(0xFFB79CFF)])
                  .createShader(cone.getBounds()));
        canvas.save();
        canvas.clipPath(cone);
        for (var i = 0; i < 5; i++) {
          canvas.drawLine(
              Offset(cx - s * 0.2, top - s * 0.2 + i * s * 0.06),
              Offset(cx + s * 0.2, top - s * 0.12 + i * s * 0.06),
              Paint()
                ..color = const Color(0xFFFFE27A)
                ..strokeWidth = s * 0.02);
        }
        canvas.restore();
        for (var i = 0; i < 6; i++) {
          final a = i * math.pi / 3 + t * 2 * math.pi;
          canvas.drawLine(
              Offset(cx + s * 0.02, top - s * 0.22),
              Offset(cx + s * 0.02, top - s * 0.22) +
                  Offset(math.cos(a), math.sin(a)) * s * 0.04,
              Paint()
                ..color = const Color(0xFFFF6F91)
                ..strokeWidth = s * 0.012
                ..strokeCap = StrokeCap.round);
        }
        break;
      case 'hearthb':
        canvas.drawArc(
            Rect.fromCenter(
                center: Offset(cx, top + s * 0.12),
                width: s * 0.44,
                height: s * 0.3),
            math.pi * 1.1,
            math.pi * 0.8,
            false,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.025
              ..color = const Color(0xFFFF5C8A));
        for (final d in [-1.0, 1.0]) {
          final bob = math.sin(t * 2 * math.pi * 2 + d) * s * 0.01;
          final stem = Offset(cx + d * s * 0.12, top - s * 0.02);
          final hc = Offset(cx + d * s * 0.16, top - s * 0.13 + bob);
          canvas.drawLine(
              stem,
              hc,
              Paint()
                ..color = const Color(0xFFFF5C8A)
                ..strokeWidth = s * 0.008);
          _heart(
              canvas, hc, s * 0.045, Paint()..color = const Color(0xFFFF3B6F));
        }
        break;
      case 'pilgrim':
        final crown = Rect.fromLTRB(
            cx - s * 0.12, top - s * 0.16, cx + s * 0.12, top + s * 0.05);
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(cx, top + s * 0.05),
                width: s * 0.44,
                height: s * 0.07),
            Paint()..color = const Color(0xFF2A2230));
        canvas.drawPath(
            Path()
              ..moveTo(crown.left, crown.bottom)
              ..lineTo(crown.left + s * 0.025, crown.top)
              ..lineTo(crown.right - s * 0.025, crown.top)
              ..lineTo(crown.right, crown.bottom)
              ..close(),
            Paint()..color = const Color(0xFF3B3340));
        canvas.drawRect(
            Rect.fromLTWH(crown.left + s * 0.004, crown.bottom - s * 0.065,
                crown.width - s * 0.008, s * 0.035),
            Paint()..color = const Color(0xFF8B5A2B));
        canvas.drawRect(
            Rect.fromCenter(
                center: Offset(cx, crown.bottom - s * 0.047),
                width: s * 0.06,
                height: s * 0.05),
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.01
              ..color = const Color(0xFFFFD84D));
        break;
      case 'starhat':
        final crown = Rect.fromLTRB(
            cx - s * 0.11, top - s * 0.17, cx + s * 0.11, top + s * 0.05);
        canvas.drawOval(
            Rect.fromCenter(
                center: Offset(cx, top + s * 0.05),
                width: s * 0.42,
                height: s * 0.07),
            Paint()..color = const Color(0xFF2F5BD9));
        canvas.drawRect(crown, Paint()..color = Colors.white);
        for (var i = 0; i < 3; i++) {
          canvas.drawRect(
              Rect.fromLTWH(crown.left, crown.top + i * crown.height / 3,
                  crown.width, crown.height / 6),
              Paint()..color = const Color(0xFFE23D4B));
        }
        canvas.drawRect(
            Rect.fromLTWH(
                crown.left, crown.bottom - s * 0.05, crown.width, s * 0.05),
            Paint()..color = const Color(0xFF2F5BD9));
        _star(canvas, Offset(cx, crown.bottom - s * 0.025), s * 0.022,
            Paint()..color = Colors.white);
        break;
      case 'flowers':
        final colors = [
          const Color(0xFFFF8FB1),
          const Color(0xFFFFE27A),
          const Color(0xFFB79CFF),
          const Color(0xFF8BE39A),
          const Color(0xFF7CC8FF)
        ];
        for (var i = 0; i < 7; i++) {
          final a = math.pi + (i / 6) * math.pi;
          final p = Offset(cx + math.cos(a) * s * 0.19,
              top + s * 0.12 + math.sin(a) * s * 0.11);
          final c = colors[i % colors.length];
          for (var k = 0; k < 5; k++) {
            final pa = k * 2 * math.pi / 5;
            canvas.drawCircle(
                p + Offset(math.cos(pa), math.sin(pa)) * s * 0.016,
                s * 0.014,
                Paint()..color = c);
          }
          canvas.drawCircle(p, s * 0.011, Paint()..color = Colors.white);
        }
        break;
    }
  }

  // ---------------------------------------------------------------- gear
  void _cape(Canvas canvas, Rect b, double s) {
    // Drapes from the shoulders and flares out behind the body, so only the
    // flowing sides and scalloped hem peek out.
    final sway = math.sin(t * 2 * math.pi) * s * 0.008;
    final cape = Path()
      ..moveTo(b.left + b.width * 0.2, b.top + b.height * 0.28)
      ..quadraticBezierTo(b.left - s * 0.05, b.top + b.height * 0.55,
          b.left - s * 0.09 + sway, b.bottom - s * 0.03)
      ..quadraticBezierTo(b.left - s * 0.02, b.bottom - s * 0.06,
          b.left + b.width * 0.12, b.bottom - s * 0.03)
      ..lineTo(b.right - b.width * 0.12, b.bottom - s * 0.03)
      ..quadraticBezierTo(b.right + s * 0.02, b.bottom - s * 0.06,
          b.right + s * 0.09 - sway, b.bottom - s * 0.03)
      ..quadraticBezierTo(b.right + s * 0.05, b.top + b.height * 0.55,
          b.right - b.width * 0.2, b.top + b.height * 0.28)
      ..close();
    canvas.drawPath(
        cape,
        Paint()
          ..shader = const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFE23D5C), Color(0xFF9C1F3A)])
              .createShader(cape.getBounds()));
    canvas.drawPath(
        cape,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = s * 0.012
          ..color = const Color(0xFFF4C542));
  }

  void _gear(Canvas canvas, Rect b, double s) {
    switch (look.gear) {
      case 'sword':
        canvas.save();
        canvas.translate(b.right + s * 0.02, b.center.dy + s * 0.02);
        canvas.rotate(0.35);
        final blade = Rect.fromLTWH(-s * 0.018, -s * 0.26, s * 0.036, s * 0.24);
        canvas.drawRRect(
            RRect.fromRectAndCorners(blade,
                topLeft: Radius.circular(s * 0.02),
                topRight: Radius.circular(s * 0.02)),
            Paint()..shader = _specialShader('silver', blade, Colors.white));
        canvas.drawLine(
            Offset(0, -s * 0.25),
            Offset(0, -s * 0.03),
            Paint()
              ..color = Colors.white.withOpacity(0.7)
              ..strokeWidth = s * 0.006);
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromCenter(
                    center: Offset.zero, width: s * 0.12, height: s * 0.025),
                Radius.circular(s * 0.01)),
            Paint()..color = const Color(0xFFD79A1E));
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromLTWH(-s * 0.012, 0, s * 0.024, s * 0.07),
                Radius.circular(s * 0.01)),
            Paint()..color = const Color(0xFF7A4A21));
        canvas.drawCircle(Offset(0, s * 0.075), s * 0.016,
            Paint()..color = const Color(0xFFF4C542));
        canvas.restore();
        break;
      case 'shield':
        final c = Offset(b.left + s * 0.01, b.center.dy + s * 0.06);
        final w = s * 0.17, h = s * 0.21;
        final shield = Path()
          ..moveTo(c.dx - w / 2, c.dy - h / 2)
          ..lineTo(c.dx + w / 2, c.dy - h / 2)
          ..lineTo(c.dx + w / 2, c.dy)
          ..quadraticBezierTo(c.dx + w / 2, c.dy + h * 0.35, c.dx, c.dy + h / 2)
          ..quadraticBezierTo(c.dx - w / 2, c.dy + h * 0.35, c.dx - w / 2, c.dy)
          ..close();
        canvas.drawPath(shield, Paint()..color = const Color(0xFF3D5BD9));
        canvas.save();
        canvas.clipPath(shield);
        canvas.drawRect(
            Rect.fromLTWH(c.dx - s * 0.018, c.dy - h / 2, s * 0.036, h),
            Paint()..color = const Color(0xFFF4C542));
        canvas.drawRect(
            Rect.fromLTWH(c.dx - w / 2, c.dy - h * 0.12, w, s * 0.036),
            Paint()..color = const Color(0xFFF4C542));
        canvas.restore();
        canvas.drawPath(
            shield,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.012
              ..color = const Color(0xFFD79A1E));
        break;
      case 'wand':
        canvas.save();
        canvas.translate(b.right, b.center.dy + s * 0.04);
        canvas.rotate(0.45);
        canvas.drawRRect(
            RRect.fromRectAndRadius(
                Rect.fromLTWH(-s * 0.01, -s * 0.16, s * 0.02, s * 0.2),
                Radius.circular(s * 0.01)),
            Paint()..color = const Color(0xFF6B3FA0));
        final tw = 0.85 + 0.15 * math.sin(t * 2 * math.pi * 2);
        _star(canvas, Offset(0, -s * 0.18), s * 0.05 * tw,
            Paint()..color = const Color(0xFFFFD84D));
        canvas.restore();
        _sparkleAt(canvas, Offset(b.right + s * 0.12, b.center.dy - s * 0.16),
            s * 0.02);
        break;
      case 'candycane':
        canvas.save();
        canvas.translate(b.right + s * 0.01, b.center.dy + s * 0.06);
        canvas.rotate(0.3);
        final cane = Path()
          ..moveTo(0, s * 0.1)
          ..lineTo(0, -s * 0.12)
          ..arcToPoint(Offset(-s * 0.08, -s * 0.12),
              radius: Radius.circular(s * 0.04), clockwise: false);
        canvas.drawPath(
            cane,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.035
              ..strokeCap = StrokeCap.round
              ..color = Colors.white);
        canvas.save();
        canvas.clipPath(Path()
          ..addRect(Rect.fromLTWH(-s * 0.15, -s * 0.2, s * 0.25, s * 0.35)));
        for (var i = 0; i < 6; i++) {
          canvas.drawLine(
              Offset(-s * 0.02, s * 0.09 - i * s * 0.04),
              Offset(s * 0.02, s * 0.07 - i * s * 0.04),
              Paint()
                ..color = const Color(0xFFE23D4B)
                ..strokeWidth = s * 0.012);
        }
        canvas.restore();
        canvas.restore();
        break;
      case 'pumpkin':
        final c = Offset(b.right + s * 0.02, b.center.dy + s * 0.12);
        final r = s * 0.075;
        canvas.drawArc(
            Rect.fromCircle(center: c - Offset(0, r * 0.4), radius: r * 1.05),
            math.pi,
            math.pi,
            false,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.008
              ..color = const Color(0xFF3B2163));
        for (final dx in [-0.45, 0.45, 0.0]) {
          canvas.drawOval(
              Rect.fromCenter(
                  center: c + Offset(dx * r, 0),
                  width: r * 1.2,
                  height: r * 1.6),
              Paint()
                ..color = dx == 0
                    ? const Color(0xFFFF9A3C)
                    : const Color(0xFFF07C1E));
        }
        canvas.drawPath(
            Path()
              ..moveTo(c.dx - r * 0.45, c.dy - r * 0.15)
              ..lineTo(c.dx - r * 0.25, c.dy - r * 0.38)
              ..lineTo(c.dx - r * 0.08, c.dy - r * 0.15)
              ..close(),
            Paint()..color = const Color(0xFF3B2163));
        canvas.drawPath(
            Path()
              ..moveTo(c.dx + r * 0.08, c.dy - r * 0.15)
              ..lineTo(c.dx + r * 0.25, c.dy - r * 0.38)
              ..lineTo(c.dx + r * 0.45, c.dy - r * 0.15)
              ..close(),
            Paint()..color = const Color(0xFF3B2163));
        canvas.drawArc(
            Rect.fromCenter(
                center: c + Offset(0, r * 0.1),
                width: r * 0.9,
                height: r * 0.6),
            0.2,
            math.pi - 0.4,
            false,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.01
              ..color = const Color(0xFF3B2163));
        canvas.drawRect(
            Rect.fromCenter(
                center: c - Offset(0, r * 0.8),
                width: r * 0.22,
                height: r * 0.3),
            Paint()..color = const Color(0xFF3DBE6C));
        break;
      case 'heartballoon':
        final sway = math.sin(t * 2 * math.pi) * s * 0.015;
        final hand = Offset(b.right - s * 0.02, b.center.dy + s * 0.04);
        final bal = Offset(b.right + s * 0.08 + sway, b.top - s * 0.04);
        canvas.drawPath(
            Path()
              ..moveTo(hand.dx, hand.dy)
              ..quadraticBezierTo(hand.dx + s * 0.06, (hand.dy + bal.dy) / 2,
                  bal.dx, bal.dy + s * 0.06),
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.006
              ..color = const Color(0xFF6B5E80));
        _heart(canvas, bal, s * 0.07, Paint()..color = const Color(0xFFFF3B6F));
        canvas.drawCircle(bal + Offset(-s * 0.03, -s * 0.02), s * 0.012,
            Paint()..color = Colors.white.withOpacity(0.8));
        break;
      case 'eggbasket':
        final c = Offset(b.right, b.center.dy + s * 0.13);
        final basket =
            Rect.fromCenter(center: c, width: s * 0.18, height: s * 0.09);
        canvas.drawArc(
            Rect.fromCenter(
                center: c - Offset(0, s * 0.03),
                width: s * 0.16,
                height: s * 0.16),
            math.pi,
            math.pi,
            false,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.012
              ..color = const Color(0xFFB07A3A));
        const eggs = [Color(0xFFFFB8D0), Color(0xFFB8E6FF), Color(0xFFFFF0A0)];
        for (var i = 0; i < 3; i++) {
          canvas.drawOval(
              Rect.fromCenter(
                  center: c + Offset((i - 1) * s * 0.05, -s * 0.045),
                  width: s * 0.05,
                  height: s * 0.065),
              Paint()..color = eggs[i]);
        }
        canvas.drawRRect(
            RRect.fromRectAndCorners(basket,
                bottomLeft: Radius.circular(s * 0.04),
                bottomRight: Radius.circular(s * 0.04)),
            Paint()..color = const Color(0xFFD9A35B));
        for (var i = 1; i < 4; i++) {
          canvas.drawLine(
              Offset(basket.left + i * basket.width / 4, basket.top),
              Offset(basket.left + i * basket.width / 4, basket.bottom),
              Paint()
                ..color = const Color(0xFFB07A3A)
                ..strokeWidth = s * 0.006);
        }
        break;
      case 'sparkler':
        canvas.save();
        canvas.translate(b.right, b.center.dy + s * 0.04);
        canvas.rotate(0.4);
        canvas.drawLine(
            const Offset(0, 0),
            Offset(0, -s * 0.18),
            Paint()
              ..color = const Color(0xFF8D99AE)
              ..strokeWidth = s * 0.012);
        final tip = Offset(0, -s * 0.18);
        for (var i = 0; i < 12; i++) {
          final a = i * math.pi / 6 + t * 2 * math.pi * 3;
          final len = s *
              (0.04 + 0.03 * ((i * 5) % 3) / 2) *
              (0.8 + 0.2 * math.sin(t * 40 + i));
          canvas.drawLine(
              tip,
              tip + Offset(math.cos(a), math.sin(a)) * len,
              Paint()
                ..color = i.isEven ? const Color(0xFFFFE27A) : Colors.white
                ..strokeWidth = s * 0.006
                ..strokeCap = StrokeCap.round);
        }
        canvas.drawCircle(tip, s * 0.015, Paint()..color = Colors.white);
        canvas.restore();
        break;
      case 'present':
        final box = Rect.fromCenter(
            center: Offset(b.right, b.center.dy + s * 0.12),
            width: s * 0.15,
            height: s * 0.13);
        canvas.drawRRect(
            RRect.fromRectAndRadius(box, Radius.circular(s * 0.015)),
            Paint()..color = const Color(0xFF3DBE6C));
        canvas.drawRect(
            Rect.fromCenter(
                center: box.center, width: s * 0.03, height: box.height),
            Paint()..color = const Color(0xFFE23D4B));
        canvas.drawRect(
            Rect.fromCenter(
                center: box.center, width: box.width, height: s * 0.03),
            Paint()..color = const Color(0xFFE23D4B));
        for (final d in [-1.0, 1.0]) {
          canvas.drawOval(
              Rect.fromCenter(
                  center:
                      Offset(box.center.dx + d * s * 0.03, box.top - s * 0.015),
                  width: s * 0.06,
                  height: s * 0.035),
              Paint()..color = const Color(0xFFE23D4B));
        }
        break;
    }
  }

  void _clover(Canvas canvas, Offset c, double r) {
    final p = Paint()..color = const Color(0xFF3DBE6C);
    for (var i = 0; i < 3; i++) {
      final a = -math.pi / 2 + i * 2 * math.pi / 3;
      canvas.save();
      canvas.translate(
          c.dx + math.cos(a) * r * 0.55, c.dy + math.sin(a) * r * 0.55);
      canvas.rotate(a + math.pi / 2);
      _heart(canvas, Offset.zero, r * 0.6, p);
      canvas.restore();
    }
    canvas.drawLine(
        c,
        c + Offset(r * 0.4, r * 1.1),
        Paint()
          ..color = const Color(0xFF1F7A43)
          ..strokeWidth = r * 0.18);
  }

  // ---------------------------------------------------------------- effects
  void _glow(Canvas canvas, Rect b, double s) {
    final pulse = 0.85 + 0.15 * math.sin(t * 2 * math.pi);
    canvas.drawCircle(
        b.center,
        b.width * 0.75 * pulse,
        Paint()
          ..shader = RadialGradient(colors: [
            const Color(0xFFFFE27A).withOpacity(0.75),
            const Color(0xFFFFE27A).withOpacity(0)
          ]).createShader(
              Rect.fromCircle(center: b.center, radius: b.width * 0.75)));
  }

  void _flames(Canvas canvas, Rect b, double s) {
    final c = Offset(b.center.dx, b.center.dy + b.height * 0.1);
    for (var layer = 0; layer < 3; layer++) {
      final color = [
        const Color(0xFFFF5A1F),
        const Color(0xFFFF9F1C),
        const Color(0xFFFFE066)
      ][layer];
      final scale = [1.0, 0.72, 0.45][layer];
      for (var i = 0; i < 11; i++) {
        final a = math.pi * 0.95 + (i / 10) * math.pi * 1.1;
        final dir = Offset(math.cos(a), math.sin(a));
        final base =
            c + Offset(dir.dx * b.width * 0.42, dir.dy * b.height * 0.55);
        final flick = 1 + 0.18 * math.sin(t * 2 * math.pi * 3 + i * 1.9);
        final len = s * (0.13 + 0.06 * ((i * 7) % 3) / 2) * scale * flick;
        final tip = base +
            dir * len +
            Offset(math.sin(t * 2 * math.pi * 2 + i) * s * 0.01, 0);
        final perp = Offset(-dir.dy, dir.dx) * s * 0.055 * (0.6 + scale * 0.4);
        final p = Path()
          ..moveTo(base.dx + perp.dx, base.dy + perp.dy)
          ..quadraticBezierTo(base.dx + dir.dx * len * 0.55 + perp.dx * 1.1,
              base.dy + dir.dy * len * 0.55 + perp.dy * 1.1, tip.dx, tip.dy)
          ..quadraticBezierTo(
              base.dx + dir.dx * len * 0.55 - perp.dx * 1.1,
              base.dy + dir.dy * len * 0.55 - perp.dy * 1.1,
              base.dx - perp.dx,
              base.dy - perp.dy)
          ..close();
        canvas.drawPath(p, Paint()..color = color.withOpacity(0.92));
      }
    }
  }

  void _sparkles(Canvas canvas, double s, {bool gold = false}) {
    final pts = [
      const Offset(0.16, 0.22),
      const Offset(0.84, 0.18),
      const Offset(0.1, 0.62),
      const Offset(0.9, 0.58),
      const Offset(0.5, 0.08)
    ];
    for (var i = 0; i < pts.length; i++) {
      final tw = 0.5 + 0.5 * math.sin(t * 2 * math.pi * 2 + i * 1.3);
      _sparkleAt(
          canvas, Offset(pts[i].dx * s, pts[i].dy * s), s * (0.02 + 0.02 * tw),
          gold: gold || i.isEven);
    }
  }

  void _sparkleAt(Canvas canvas, Offset c, double r, {bool gold = true}) {
    final p = Path()
      ..moveTo(c.dx, c.dy - r * 2)
      ..quadraticBezierTo(c.dx, c.dy, c.dx + r * 2, c.dy)
      ..quadraticBezierTo(c.dx, c.dy, c.dx, c.dy + r * 2)
      ..quadraticBezierTo(c.dx, c.dy, c.dx - r * 2, c.dy)
      ..quadraticBezierTo(c.dx, c.dy, c.dx, c.dy - r * 2)
      ..close();
    canvas.drawPath(
        p, Paint()..color = gold ? const Color(0xFFFFD84D) : Colors.white);
  }

  void _hearts(Canvas canvas, double s) {
    for (var i = 0; i < 5; i++) {
      final phase = (t + i / 5) % 1.0;
      final x = s * (0.15 + 0.7 * ((i * 37) % 10) / 10);
      final y = s * (0.75 - 0.6 * phase);
      _heart(canvas, Offset(x, y), s * 0.03,
          Paint()..color = const Color(0xFFFF5C8A).withOpacity(1 - phase));
    }
  }

  void _bubbles(Canvas canvas, double s) {
    for (var i = 0; i < 7; i++) {
      final phase = (t + i / 7) % 1.0;
      final x = s * (0.12 + 0.76 * ((i * 53) % 10) / 10) +
          math.sin(phase * 6 + i) * s * 0.02;
      final y = s * (0.85 - 0.75 * phase);
      final r = s * (0.018 + (i % 3) * 0.008);
      canvas.drawCircle(
          Offset(x, y),
          r,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = s * 0.005
            ..color = const Color(0xFF7CC8FF).withOpacity(1 - phase * 0.7));
      canvas.drawCircle(Offset(x - r * 0.35, y - r * 0.35), r * 0.25,
          Paint()..color = Colors.white.withOpacity(0.8 * (1 - phase)));
    }
  }

  /// Particles drifting down (or up) across the avatar tile, looping with [t].
  void _fallers(Canvas canvas, double s, int n,
      void Function(Offset c, double r, double alpha) draw,
      {double sway = 0.03, bool up = false}) {
    for (var i = 0; i < n; i++) {
      final phase = (t + i / n) % 1.0;
      final x = s * (0.08 + 0.84 * ((i * 41) % 13) / 12) +
          math.sin(phase * 2 * math.pi * 2 + i) * s * sway;
      final y = up ? s * (0.9 - 0.85 * phase) : s * (0.02 + 0.9 * phase);
      final alpha = (phase < 0.1
              ? phase / 0.1
              : phase > 0.85
                  ? (1 - phase) / 0.15
                  : 1.0)
          .clamp(0.0, 1.0);
      draw(Offset(x, y), s * (0.016 + (i % 3) * 0.006), alpha);
    }
  }

  void _snowflake(Canvas canvas, Offset c, double r, Color color) {
    final p = Paint()
      ..color = color
      ..strokeWidth = r * 0.22
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < 3; i++) {
      final a = i * math.pi / 3;
      final d = Offset(math.cos(a), math.sin(a)) * r;
      canvas.drawLine(c - d, c + d, p);
    }
    canvas.drawCircle(c, r * 0.25, Paint()..color = color);
  }

  void _bat(Canvas canvas, Offset c, double r, Color color) {
    final flap = math.sin(t * 2 * math.pi * 8) * r * 0.3;
    final p = Path()
      ..moveTo(c.dx, c.dy)
      ..quadraticBezierTo(c.dx - r * 0.8, c.dy - r * 0.9 - flap, c.dx - r * 1.8,
          c.dy - r * 0.2 - flap)
      ..quadraticBezierTo(
          c.dx - r * 1.2, c.dy + r * 0.1, c.dx - r * 1.1, c.dy + r * 0.5)
      ..quadraticBezierTo(c.dx - r * 0.6, c.dy + r * 0.1, c.dx, c.dy + r * 0.5)
      ..quadraticBezierTo(
          c.dx + r * 0.6, c.dy + r * 0.1, c.dx + r * 1.1, c.dy + r * 0.5)
      ..quadraticBezierTo(
          c.dx + r * 1.2, c.dy + r * 0.1, c.dx + r * 1.8, c.dy - r * 0.2 - flap)
      ..quadraticBezierTo(c.dx + r * 0.8, c.dy - r * 0.9 - flap, c.dx, c.dy)
      ..close();
    canvas.drawPath(p, Paint()..color = color);
    canvas.drawCircle(c + Offset(0, r * 0.1), r * 0.42, Paint()..color = color);
  }

  void _orbit(Canvas canvas, Rect b, double s) {
    for (var i = 0; i < 4; i++) {
      final a = t * 2 * math.pi + i * math.pi / 2;
      final p = Offset(b.center.dx + math.cos(a) * b.width * 0.62,
          b.center.dy - s * 0.02 + math.sin(a) * b.height * 0.32);
      _star(
          canvas,
          p,
          s * 0.028,
          Paint()
            ..color =
                i.isEven ? const Color(0xFFFFD84D) : const Color(0xFFB79CFF));
    }
  }

  // ---------------------------------------------------------------- backgrounds
  void _background(Canvas canvas, Rect r, double s) {
    final clip = RRect.fromRectAndRadius(r, Radius.circular(s * 0.5));
    canvas.save();
    canvas.clipRRect(clip);
    switch (look.bg) {
      case 'castle':
        _sky(canvas, r, const [Color(0xFF9FD8FF), Color(0xFFDDF2FF)]);
        _cloud(canvas, Offset(s * 0.25, s * 0.2), s * 0.07);
        _cloud(canvas, Offset(s * 0.75, s * 0.14), s * 0.05);
        _castle(canvas, s, Offset(s * 0.5, s * 0.66), s * 0.55,
            const Color(0xFFB8A9D9), const Color(0xFF8E7CC3));
        _hill(canvas, r, s * 0.68, const Color(0xFF8FD694));
        _hill(canvas, r, s * 0.78, const Color(0xFF6CC27A), offset: 0.3);
        break;
      case 'dragonlair':
        _sky(canvas, r, const [Color(0xFF5B2A86), Color(0xFFFF8A5C)]);
        canvas.drawCircle(Offset(s * 0.72, s * 0.3), s * 0.11,
            Paint()..color = const Color(0xFFFFD7A0));
        _mountains(canvas, r, s, const Color(0xFF3A1E5C));
        _dragonSilhouette(canvas, Offset(s * 0.3, s * 0.22), s * 0.16,
            const Color(0xFF2A1240));
        for (var i = 0; i < 10; i++) {
          final phase = (t + i / 10) % 1.0;
          canvas.drawCircle(
              Offset(s * (0.1 + 0.08 * i), s * (0.95 - 0.5 * phase)),
              s * 0.006,
              Paint()..color = const Color(0xFFFFB347).withOpacity(1 - phase));
        }
        break;
      case 'throne':
        _sky(canvas, r, const [Color(0xFF8E1F3A), Color(0xFF4A0F22)]);
        final banner = Paint()..color = const Color(0xFFB8283F);
        for (final x in [0.12, 0.88]) {
          final rect = Rect.fromLTWH(s * x - s * 0.08, 0, s * 0.16, s * 0.55);
          canvas.drawPath(
              Path()
                ..moveTo(rect.left, rect.top)
                ..lineTo(rect.right, rect.top)
                ..lineTo(rect.right, rect.bottom)
                ..lineTo(rect.center.dx, rect.bottom - s * 0.06)
                ..lineTo(rect.left, rect.bottom)
                ..close(),
              banner);
          _star(canvas, Offset(rect.center.dx, s * 0.25), s * 0.035,
              Paint()..color = const Color(0xFFF4C542));
        }
        canvas.drawRect(Rect.fromLTWH(0, s * 0.78, s, s * 0.22),
            Paint()..color = const Color(0xFF6B1229));
        canvas.drawRect(Rect.fromLTWH(s * 0.3, s * 0.78, s * 0.4, s * 0.22),
            Paint()..color = const Color(0xFFD7263D));
        break;
      case 'starry':
        _sky(canvas, r, const [Color(0xFF141A4A), Color(0xFF3B2A78)]);
        final rnd = math.Random(21);
        for (var i = 0; i < 40; i++) {
          final tw = 0.4 + 0.6 * (0.5 + 0.5 * math.sin(t * 2 * math.pi + i));
          canvas.drawCircle(
              Offset(rnd.nextDouble() * s, rnd.nextDouble() * s * 0.7),
              s * (0.003 + rnd.nextDouble() * 0.006),
              Paint()..color = Colors.white.withOpacity(tw));
        }
        canvas.drawCircle(Offset(s * 0.78, s * 0.22), s * 0.08,
            Paint()..color = const Color(0xFFFFF3C4));
        canvas.drawCircle(Offset(s * 0.81, s * 0.2), s * 0.07,
            Paint()..color = const Color(0xFF1E2560));
        _castle(canvas, s, Offset(s * 0.5, s * 0.74), s * 0.5,
            const Color(0xFF2A2F6B), const Color(0xFF1E2252));
        _hill(canvas, r, s * 0.8, const Color(0xFF1A1F4D));
        break;
      case 'meadow':
        _sky(canvas, r, const [Color(0xFFBDE7FF), Color(0xFFF0FBFF)]);
        canvas.drawCircle(Offset(s * 0.8, s * 0.2), s * 0.08,
            Paint()..color = const Color(0xFFFFE27A));
        _hill(canvas, r, s * 0.66, const Color(0xFFA8E6A1));
        _hill(canvas, r, s * 0.76, const Color(0xFF7FD48A), offset: 0.4);
        final rnd = math.Random(4);
        for (var i = 0; i < 16; i++) {
          final p =
              Offset(rnd.nextDouble() * s, s * (0.8 + rnd.nextDouble() * 0.18));
          canvas.drawCircle(
              p,
              s * 0.012,
              Paint()
                ..color = [
                  const Color(0xFFFF8FB1),
                  const Color(0xFFFFFFFF),
                  const Color(0xFFFFE27A)
                ][i % 3]);
        }
        break;
      case 'rainbow':
        _sky(canvas, r, const [Color(0xFFFFF0FA), Color(0xFFE8F4FF)]);
        for (var i = 0; i < _rainbow.length; i++) {
          canvas.drawCircle(
              Offset(s * 0.5, s * 0.95),
              s * (0.6 - i * 0.05),
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = s * 0.05
                ..color = _rainbow[i].withOpacity(0.7));
        }
        _cloud(canvas, Offset(s * 0.15, s * 0.82), s * 0.08);
        _cloud(canvas, Offset(s * 0.85, s * 0.82), s * 0.08);
        break;
      default:
        canvas.drawRect(
            r,
            Paint()
              ..shader = const RadialGradient(
                      colors: [Color(0xFFFFFFFF), Color(0xFFEDE7FF)],
                      radius: 0.8)
                  .createShader(r));
    }
    canvas.restore();
  }

  void _sky(Canvas canvas, Rect r, List<Color> colors) {
    canvas.drawRect(
        r,
        Paint()
          ..shader = LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colors)
              .createShader(r));
  }

  void _hill(Canvas canvas, Rect r, double y, Color c, {double offset = 0}) {
    final p = Path()
      ..moveTo(r.left, r.bottom)
      ..lineTo(r.left, y);
    p.cubicTo(
        r.width * (0.25 + offset * 0.2),
        y - r.height * 0.12,
        r.width * (0.55 - offset * 0.1),
        y + r.height * 0.06,
        r.right,
        y - r.height * 0.04);
    p
      ..lineTo(r.right, r.bottom)
      ..close();
    canvas.drawPath(p, Paint()..color = c);
  }

  void _cloud(Canvas canvas, Offset c, double r) {
    final p = Paint()..color = Colors.white.withOpacity(0.9);
    canvas.drawCircle(c, r, p);
    canvas.drawCircle(c + Offset(-r * 0.9, r * 0.3), r * 0.7, p);
    canvas.drawCircle(c + Offset(r * 0.9, r * 0.3), r * 0.75, p);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(c.dx - r * 1.5, c.dy + r * 0.1, r * 3, r * 0.8),
            Radius.circular(r * 0.4)),
        p);
  }

  void _mountains(Canvas canvas, Rect r, double s, Color c) {
    final p = Path()
      ..moveTo(0, s)
      ..lineTo(0, s * 0.7)
      ..lineTo(s * 0.2, s * 0.5)
      ..lineTo(s * 0.35, s * 0.65)
      ..lineTo(s * 0.55, s * 0.42)
      ..lineTo(s * 0.75, s * 0.62)
      ..lineTo(s * 0.9, s * 0.52)
      ..lineTo(s, s * 0.6)
      ..lineTo(s, s)
      ..close();
    canvas.drawPath(p, Paint()..color = c);
  }

  void _castle(
      Canvas canvas, double s, Offset base, double w, Color wall, Color dark) {
    final h = w * 0.55;
    final left = base.dx - w / 2;
    final top = base.dy - h;
    final wallPaint = Paint()..color = wall;
    // Main keep.
    canvas.drawRect(
        Rect.fromLTWH(left + w * 0.2, top + h * 0.3, w * 0.6, h * 0.7),
        wallPaint);
    // Crenellations.
    for (var i = 0; i < 6; i++) {
      canvas.drawRect(
          Rect.fromLTWH(left + w * 0.2 + i * w * 0.11, top + h * 0.22, w * 0.06,
              h * 0.09),
          wallPaint);
    }
    // Towers.
    for (final tx in [0.08, 0.92, 0.5]) {
      final tw = tx == 0.5 ? w * 0.18 : w * 0.16;
      final th = tx == 0.5 ? h * 1.0 : h * 0.85;
      final x = left + w * tx - tw / 2;
      canvas.drawRect(Rect.fromLTWH(x, base.dy - th, tw, th), wallPaint);
      canvas.drawPath(
          Path()
            ..moveTo(x - tw * 0.12, base.dy - th)
            ..lineTo(x + tw / 2, base.dy - th - tw * 0.9)
            ..lineTo(x + tw * 1.12, base.dy - th)
            ..close(),
          Paint()..color = const Color(0xFFD7263D).withOpacity(0.85));
      // Flag.
      final fx = x + tw / 2;
      final fy = base.dy - th - tw * 0.9;
      canvas.drawLine(
          Offset(fx, fy),
          Offset(fx, fy - tw * 0.5),
          Paint()
            ..color = dark
            ..strokeWidth = s * 0.004);
      final wave = math.sin(t * 2 * math.pi + tx * 5) * tw * 0.06;
      canvas.drawPath(
          Path()
            ..moveTo(fx, fy - tw * 0.5)
            ..quadraticBezierTo(fx + tw * 0.25, fy - tw * 0.5 + wave,
                fx + tw * 0.45, fy - tw * 0.4)
            ..lineTo(fx, fy - tw * 0.3)
            ..close(),
          Paint()..color = const Color(0xFFF4C542));
      // Window.
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromLTWH(
                  x + tw * 0.35, base.dy - th * 0.7, tw * 0.3, tw * 0.4),
              Radius.circular(tw * 0.15)),
          Paint()..color = dark);
    }
    // Gate.
    canvas.drawRRect(
      RRect.fromRectAndCorners(
          Rect.fromLTWH(
              base.dx - w * 0.08, base.dy - h * 0.38, w * 0.16, h * 0.38),
          topLeft: Radius.circular(w * 0.08),
          topRight: Radius.circular(w * 0.08)),
      Paint()..color = dark,
    );
  }

  void _dragonSilhouette(Canvas canvas, Offset c, double w, Color color) {
    final flap = math.sin(t * 2 * math.pi * 2) * w * 0.12;
    final p = Path()
      ..moveTo(c.dx - w, c.dy)
      ..quadraticBezierTo(c.dx - w * 0.4, c.dy - w * 0.1, c.dx, c.dy)
      ..quadraticBezierTo(
          c.dx + w * 0.5, c.dy - w * 0.05, c.dx + w * 0.8, c.dy - w * 0.25)
      ..lineTo(c.dx + w * 0.75, c.dy - w * 0.05)
      ..quadraticBezierTo(
          c.dx + w * 0.4, c.dy + w * 0.15, c.dx, c.dy + w * 0.12)
      ..quadraticBezierTo(c.dx - w * 0.5, c.dy + w * 0.12, c.dx - w, c.dy)
      ..close();
    canvas.drawPath(p, Paint()..color = color);
    final wing = Path()
      ..moveTo(c.dx - w * 0.1, c.dy)
      ..lineTo(c.dx - w * 0.3, c.dy - w * 0.6 - flap)
      ..lineTo(c.dx + w * 0.1, c.dy - w * 0.4 - flap)
      ..lineTo(c.dx + w * 0.3, c.dy - w * 0.05)
      ..close();
    canvas.drawPath(wing, Paint()..color = color);
  }

  // ---------------------------------------------------------------- primitives
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

  void _heart(Canvas canvas, Offset c, double r, Paint p) {
    final path = Path()
      ..moveTo(c.dx, c.dy + r)
      ..cubicTo(c.dx - r * 1.6, c.dy - r * 0.2, c.dx - r * 0.6, c.dy - r * 1.4,
          c.dx, c.dy - r * 0.5)
      ..cubicTo(c.dx + r * 0.6, c.dy - r * 1.4, c.dx + r * 1.6, c.dy - r * 0.2,
          c.dx, c.dy + r)
      ..close();
    canvas.drawPath(path, p);
  }

  void _diamond(Canvas canvas, Offset c, double r, Paint p) {
    canvas.drawPath(
        Path()
          ..moveTo(c.dx, c.dy - r)
          ..lineTo(c.dx + r * 0.6, c.dy)
          ..lineTo(c.dx, c.dy + r)
          ..lineTo(c.dx - r * 0.6, c.dy)
          ..close(),
        p);
  }

  @override
  bool shouldRepaint(covariant _SquishyPainter old) => true;
}
