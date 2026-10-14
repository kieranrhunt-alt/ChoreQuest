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

/// Reward Road: a snaking game board with one space per gold coin of the
/// reward. The hero's squishy token sits on the space matching how close their
/// gold is to the reward cost. Mystery chests reveal their surprise when the
/// token reaches them.
///
/// [prizes]: entries joined by ';', fields joined by '~':
/// `space~kind(gold|item)~gold~revealed(1|0)~claimed(1|0)~look`.
class RewardBoard extends StatelessWidget {
  const RewardBoard({
    super.key,
    this.width,
    this.height,
    this.spaces,
    this.position,
    this.prizes,
    this.tokenLook,
    this.goalIcon,
    this.burstKey,
    this.theme,
  });

  final double? width;
  final double? height;
  final int? spaces;
  final int? position;
  final String? prizes;
  final String? tokenLook;
  final String? goalIcon;
  final String? burstKey;

  /// Optional KingdomBackdrop scene used as the board's illustrated background.
  final String? theme;

  static const int _cols = 5;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
        style: GoogleFonts.comicNeue(fontWeight: FontWeight.w700),
        child: LayoutBuilder(builder: (context, cons) {
          final w = (width != null && width!.isFinite)
              ? width!
              : (cons.maxWidth.isFinite ? cons.maxWidth : 360.0);
          final n = math.max(1, spaces ?? 1);
          final total = n + 1;
          final rows = (total / _cols).ceil();
          final cell = w / _cols;
          final rowH = cell * 1.08;
          final pad = cell * 0.22;
          final h = rows * rowH + pad * 2;
          final pos = (position ?? 0).clamp(0, n);
          final list = _RoadPrize.parse(prizes ?? '');
          final byspace = {for (final p in list) p.space: p};

          Offset center(int i) {
            final r = i ~/ _cols;
            final c = r.isEven ? i % _cols : _cols - 1 - i % _cols;
            return Offset(c * cell + cell / 2, pad + r * rowH + rowH / 2);
          }

          final tile = cell * 0.74;
          final themed = (theme ?? '').isNotEmpty;
          final children = <Widget>[
            if (themed)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(cell * 0.35),
                  child: Stack(fit: StackFit.expand, children: [
                    KingdomBackdrop(scene: theme, animate: false),
                    Container(color: Colors.white.withOpacity(0.16)),
                  ]),
                ),
              ),
            Positioned.fill(
              child: CustomPaint(
                painter: _RoadPainter(
                  n: n,
                  pos: pos,
                  cell: cell,
                  tile: tile,
                  center: center,
                  prizes: byspace,
                  themed: (theme ?? '').isNotEmpty,
                ),
              ),
            ),
          ];

          Widget at(int i, double size, Widget child, {double dy = 0}) {
            final c = center(i);
            return Positioned(
              left: c.dx - size / 2,
              top: c.dy - size / 2 + dy,
              width: size,
              height: size,
              child: Center(child: child),
            );
          }

          // Space numbers.
          for (var i = 1; i < n; i++) {
            if (byspace.containsKey(i)) continue;
            children.add(at(
              i,
              tile,
              Text(
                '$i',
                style: TextStyle(
                  fontSize: tile * 0.3,
                  fontWeight: FontWeight.w800,
                  color: i <= pos
                      ? const Color(0xFF5A3A00)
                      : const Color(0xFF8C7A5B),
                ),
              ),
            ));
          }
          children.add(at(
              0,
              tile,
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text('🏰', style: TextStyle(fontSize: tile * 0.36)),
                Text('START',
                    style: TextStyle(
                        fontSize: tile * 0.15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
              ])));
          children.add(at(
              n,
              cell * 0.95,
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text(goalIcon?.isNotEmpty == true ? goalIcon! : '🎁',
                    style: TextStyle(fontSize: cell * 0.36)),
                Text('GOAL',
                    style: TextStyle(
                        fontSize: tile * 0.16,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF5A3A00))),
              ])));

          // Prize markers.
          for (final p in list) {
            if (p.space <= 0 || p.space >= n) continue;
            Widget marker;
            if (!p.revealed) {
              marker = Text('?',
                  style: TextStyle(
                      fontSize: tile * 0.46,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFFFD84D)));
            } else if (p.kind == 'item' && p.look.isNotEmpty) {
              marker = Opacity(
                opacity: p.claimed ? 0.45 : 1,
                child: SquishyAvatar(
                    width: tile * 0.95,
                    height: tile * 0.95,
                    look: p.look,
                    animate: false,
                    showBackground: false),
              );
            } else {
              marker = Opacity(
                opacity: p.claimed ? 0.45 : 1,
                child: Text('+${p.gold}🪙',
                    style: TextStyle(
                        fontSize: tile * 0.24,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF5A3A00))),
              );
            }
            children.add(at(p.space, tile, marker));
            if (p.claimed) {
              children.add(at(
                  p.space,
                  tile,
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: tile * 0.32,
                      height: tile * 0.32,
                      decoration: const BoxDecoration(
                          color: Color(0xFF1FA67A), shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Icon(Icons.check_rounded,
                          size: tile * 0.24, color: Colors.white),
                    ),
                  )));
            }
          }

          // The hero's token slides along the road.
          final tokenSize = cell * 1.05;
          final tc = center(pos);
          children.add(AnimatedPositioned(
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutBack,
            left: tc.dx - tokenSize / 2,
            top: tc.dy - tokenSize * 0.78,
            width: tokenSize,
            height: tokenSize,
            child: SquishyAvatar(
              width: tokenSize,
              height: tokenSize,
              look: tokenLook ?? 'species:bunny',
              animate: true,
              showBackground: false,
              burstKey: burstKey,
            ),
          ));

          return SizedBox(
            width: w,
            height: h,
            child: Stack(clipBehavior: Clip.none, children: children),
          );
        }));
  }
}

class _RoadPrize {
  _RoadPrize(
      this.space, this.kind, this.gold, this.revealed, this.claimed, this.look);
  final int space;
  final String kind;
  final int gold;
  final bool revealed;
  final bool claimed;
  final String look;

  static List<_RoadPrize> parse(String raw) {
    final out = <_RoadPrize>[];
    for (final e in raw.split(';')) {
      final f = e.split('~');
      if (f.length < 5) continue;
      final space = int.tryParse(f[0]);
      if (space == null) continue;
      out.add(_RoadPrize(space, f[1], int.tryParse(f[2]) ?? 0, f[3] == '1',
          f[4] == '1', f.length > 5 ? f[5] : ''));
    }
    return out;
  }
}

class _RoadPainter extends CustomPainter {
  _RoadPainter({
    required this.n,
    required this.pos,
    required this.cell,
    required this.tile,
    required this.center,
    required this.prizes,
    required this.themed,
  });

  final int n;
  final int pos;
  final double cell;
  final double tile;
  final Offset Function(int) center;
  final Map<int, _RoadPrize> prizes;
  final bool themed;

  @override
  void paint(Canvas canvas, Size size) {
    final r = Offset.zero & size;
    final board = RRect.fromRectAndRadius(r, Radius.circular(cell * 0.35));
    if (!themed) {
      canvas.drawRRect(
          board,
          Paint()
            ..shader = const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFBFEAA8), Color(0xFF8ED48A)])
                .createShader(r));
    }
    canvas.save();
    canvas.clipRRect(board);
    // Meadow dots + little trees for a map feel.
    final rnd = math.Random(3);
    for (var i = 0; i < (size.height / 12).round(); i++) {
      final p =
          Offset(rnd.nextDouble() * size.width, rnd.nextDouble() * size.height);
      canvas.drawCircle(
          p, cell * 0.03, Paint()..color = const Color(0x22000000));
    }
    canvas.restore();
    canvas.drawRRect(
        board,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = cell * 0.06
          ..color = const Color(0xFFF2B53A));

    // Road: travelled part in gold, the rest in stone.
    final road = Path();
    final done = Path();
    for (var i = 0; i <= n; i++) {
      final c = center(i);
      if (i == 0) {
        road.moveTo(c.dx, c.dy);
        done.moveTo(c.dx, c.dy);
      } else {
        road.lineTo(c.dx, c.dy);
        if (i <= pos) done.lineTo(c.dx, c.dy);
      }
    }
    final roadPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = cell * 0.34
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(road, roadPaint..color = const Color(0xFFE9DCC0));
    canvas.drawPath(
        road,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = cell * 0.04
          ..color = const Color(0x33A0782D));
    if (pos > 0)
      canvas.drawPath(done, roadPaint..color = const Color(0xFFFFD86B));

    // Tiles.
    for (var i = 0; i <= n; i++) {
      final c = center(i);
      final isGoal = i == n;
      final isStart = i == 0;
      final t = isGoal ? cell * 0.92 : tile;
      final rect = RRect.fromRectAndRadius(
          Rect.fromCenter(center: c, width: t, height: t),
          Radius.circular(t * 0.28));
      final prize = prizes[i];
      List<Color> colors;
      if (isStart) {
        colors = const [Color(0xFF7B5CE0), Color(0xFF4B2FA6)];
      } else if (isGoal) {
        colors = const [
          Color(0xFFFFF3B0),
          Color(0xFFF2B53A),
          Color(0xFFD79A1E)
        ];
      } else if (prize != null && !prize.revealed) {
        colors = const [Color(0xFF8A6CFF), Color(0xFF4B2FA6)];
      } else if (prize != null) {
        colors = const [Color(0xFFFFF7CF), Color(0xFFFFD84D)];
      } else if (i <= pos) {
        colors = const [Color(0xFFFFF0B3), Color(0xFFFFCF4D)];
      } else {
        colors = const [Color(0xFFFFFCF5), Color(0xFFEDE2C8)];
      }
      // Drop shadow.
      canvas.drawRRect(rect.shift(Offset(0, t * 0.06)),
          Paint()..color = const Color(0x33000000));
      canvas.drawRRect(
          rect,
          Paint()
            ..shader = LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors)
                .createShader(rect.outerRect));
      canvas.drawRRect(
          rect,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = t * 0.05
            ..color = isGoal || (prize != null && prize.revealed)
                ? const Color(0xFFB07A12)
                : const Color(0x55A0782D));
      if (prize != null && prize.revealed && !prize.claimed) {
        canvas.drawRRect(
            rect.inflate(t * 0.08),
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = t * 0.06
              ..color = const Color(0x99FFE27A)
              ..maskFilter = MaskFilter.blur(BlurStyle.normal, t * 0.06));
      }
      if (prize != null && !prize.revealed) {
        // Chest lid line + lock.
        canvas.drawLine(
            Offset(rect.left + t * 0.1, c.dy - t * 0.12),
            Offset(rect.right - t * 0.1, c.dy - t * 0.12),
            Paint()
              ..color = const Color(0x55FFFFFF)
              ..strokeWidth = t * 0.04);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _RoadPainter old) =>
      old.n != n ||
      old.pos != pos ||
      old.cell != cell ||
      old.prizes.length != prizes.length ||
      true;
}
