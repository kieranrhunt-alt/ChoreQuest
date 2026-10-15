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

/// Squishie Kingdom navigation.
///
/// * [mode] 'carousel': a swipeable 3D carousel of big jelly cards — one per
///   screen the hero (or ruler) can visit. The centre card is big and bouncy;
///   tapping a card squishes it and opens that screen.
/// * [mode] 'dock': the same carousel in a compact strip under big
///   "Back" and "Home" jelly buttons — placed at the bottom of every screen.
///
/// [role] is 'parent' or 'kid'; [current] is the route name of the screen the
/// widget sits on (that card is marked "You are here").
class SquishieNav extends StatefulWidget {
  const SquishieNav({
    super.key,
    this.width,
    this.height,
    this.role,
    this.mode,
    this.current,
  });

  final double? width;
  final double? height;
  final String? role;
  final String? mode;
  final String? current;

  @override
  State<SquishieNav> createState() => _SquishieNavState();
}

class _Dest {
  const _Dest(this.route, this.emoji, this.label, this.color);
  final String route;
  final String emoji;
  final String label;
  final Color color;
}

const _kidDests = [
  _Dest('HeroHomePage', '🏠', 'My Castle', Color(0xFFFFC2DA)),
  _Dest('RewardMarketPage', '🗺️', 'Treasure Quest', Color(0xFFFFD86B)),
  _Dest('SquishyStudioPage', '🧸', 'Squishie Studio', Color(0xFFC9B6FF)),
  _Dest('SquishyShopPage', '🛍️', 'Squishie Shop', Color(0xFF9EE6C4)),
  _Dest('MyTreasurePage', '💰', 'My Gold', Color(0xFFFFC98B)),
  _Dest('QuestCalendarPage', '📅', 'Calendar', Color(0xFF9ED8F0)),
];

const _parentDests = [
  _Dest('ThroneRoomPage', '🏰', 'Throne Room', Color(0xFFFFD86B)),
  _Dest('RoyalQuestBoardPage', '📜', 'Quest Board', Color(0xFFC9B6FF)),
  _Dest('KnightsPage', '🛡️', 'Knights & Royals', Color(0xFF9EE6C4)),
  _Dest('TreasuryLedgerPage', '📒', 'Treasury', Color(0xFFFFC98B)),
  _Dest('RoyalRewardsPage', '🎁', 'Treasure Quests', Color(0xFFFFC2DA)),
  _Dest('QuestCalendarPage', '📅', 'Calendar', Color(0xFF9ED8F0)),
  _Dest('RoyalMintPage', '🖨️', 'Royal Mint', Color(0xFFFFE3A6)),
  _Dest('SquishyCatalogPage', '🧸', 'Squishie Catalog', Color(0xFFD9C8FF)),
  _Dest('CastleSettingsPage', '⚙️', 'Settings', Color(0xFFCDEEE0)),
];

const _ink = Color(0xFF2A1B4D);

TextStyle _font(double size, {Color color = _ink}) => GoogleFonts.sniglet(
    fontSize: size, fontWeight: FontWeight.w700, color: color, height: 1.05);

class _SquishieNavState extends State<SquishieNav> {
  static const _loops = 1000;
  PageController? _ctrl;
  double _viewport = 0;

  bool get _parent => (widget.role ?? '') == 'parent';
  bool get _dock => (widget.mode ?? 'carousel') == 'dock';
  List<_Dest> get _dests => _parent ? _parentDests : _kidDests;

  PageController _controllerFor(double fraction) {
    if (_ctrl == null || _viewport != fraction) {
      _ctrl?.dispose();
      final n = _dests.length;
      final here = _dests.indexWhere((d) => d.route == widget.current);
      final start = n * (_loops ~/ 2) + (here < 0 ? 0 : (here + 1) % n);
      _ctrl = PageController(viewportFraction: fraction, initialPage: start);
      _viewport = fraction;
    }
    return _ctrl!;
  }

  @override
  void dispose() {
    _ctrl?.dispose();
    super.dispose();
  }

  void _go(_Dest d) {
    if (d.route == widget.current) return;
    if (d.route == 'HeroHomePage' || d.route == 'ThroneRoomPage') {
      context.goNamed(d.route);
    } else {
      context.pushNamed(d.route);
    }
  }

  void _back() => context.safePop();

  void _home() {
    final home = _parent ? 'ThroneRoomPage' : 'HeroHomePage';
    if (home == widget.current) return;
    context.goNamed(home);
  }

  Widget _carousel(double w, double h, double fraction) {
    final ctrl = _controllerFor(fraction);
    final n = _dests.length;
    return SizedBox(
      width: w,
      height: h,
      child: PageView.builder(
        controller: ctrl,
        clipBehavior: Clip.none,
        itemBuilder: (context, i) {
          final d = _dests[i % n];
          return AnimatedBuilder(
            animation: ctrl,
            builder: (context, child) {
              var page = i.toDouble();
              if (ctrl.hasClients && ctrl.position.haveDimensions) {
                page = ctrl.page ?? page;
              } else {
                page = ctrl.initialPage.toDouble();
              }
              final delta = (i - page).clamp(-2.0, 2.0);
              final scale = 1 - 0.2 * delta.abs().clamp(0.0, 1.0);
              final m = Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(-delta * 0.45)
                ..scale(scale, scale);
              return Opacity(
                opacity: (1 - 0.35 * delta.abs()).clamp(0.3, 1.0),
                child: Transform(
                    alignment: Alignment.center, transform: m, child: child),
              );
            },
            child: _NavCard(
                dest: d,
                here: d.route == widget.current,
                compact: _dock,
                onTap: () => _go(d)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      final w =
          widget.width ?? (cons.maxWidth.isFinite ? cons.maxWidth : 360.0);
      final h = widget.height ??
          (cons.maxHeight.isFinite ? cons.maxHeight : (_dock ? 230.0 : 210.0));
      if (!_dock) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          _carousel(w, h - 22, w < 420 ? 0.5 : 0.36),
          const SizedBox(height: 6),
          Text('👈 Swipe to explore 👉',
              style: _font(14, color: const Color(0xFF5E4B7A))),
        ]);
      }
      return SizedBox(
        width: w,
        height: h,
        child: Column(children: [
          Row(children: [
            Expanded(
                child: _JellyButton(
                    emoji: '⬅️',
                    label: 'Back',
                    color: const Color(0xFF9ED8F0),
                    onTap: _back)),
            const SizedBox(width: 12),
            Expanded(
                child: _JellyButton(
                    emoji: _parent ? '🏰' : '🏠',
                    label: _parent ? 'Throne Room' : 'My Castle',
                    color: const Color(0xFFFFD86B),
                    onTap: _home)),
          ]),
          const SizedBox(height: 10),
          Expanded(child: _carousel(w, h - 76, w < 420 ? 0.36 : 0.26)),
        ]),
      );
    });
  }
}

/// Squash-and-stretch tap feedback shared by cards and dock buttons.
mixin _Squish<T extends StatefulWidget>
    on State<T>, SingleTickerProviderStateMixin<T> {
  late final AnimationController squish = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 360));

  Offset squishScale() {
    final t = squish.value;
    if (t <= 0 || t >= 1) return const Offset(1, 1);
    if (t < 0.25) {
      final k = t / 0.25;
      return Offset(1 + 0.1 * k, 1 - 0.16 * k);
    }
    if (t < 0.55) {
      final k = (t - 0.25) / 0.3;
      return Offset(1.1 - 0.16 * k, 0.84 + 0.26 * k);
    }
    final k = (t - 0.55) / 0.45;
    final wob = math.sin(k * math.pi * 2) * (1 - k);
    return Offset(0.94 + 0.06 * k + 0.03 * wob, 1.1 - 0.1 * k - 0.04 * wob);
  }

  Future<void> squishThen(VoidCallback action) async {
    await squish.forward(from: 0);
    if (mounted) action();
  }

  @override
  void dispose() {
    squish.dispose();
    super.dispose();
  }
}

class _NavCard extends StatefulWidget {
  const _NavCard(
      {required this.dest,
      required this.here,
      required this.compact,
      required this.onTap});
  final _Dest dest;
  final bool here;
  final bool compact;
  final VoidCallback onTap;

  @override
  State<_NavCard> createState() => _NavCardState();
}

class _NavCardState extends State<_NavCard>
    with SingleTickerProviderStateMixin, _Squish {
  @override
  Widget build(BuildContext context) {
    final d = widget.dest;
    final c = d.color;
    return GestureDetector(
      onTap: () => squishThen(widget.onTap),
      child: AnimatedBuilder(
        animation: squish,
        builder: (context, child) {
          final s = squishScale();
          return Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.diagonal3Values(s.dx, s.dy, 1),
              child: child);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 6, vertical: widget.compact ? 4 : 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.compact ? 22 : 28),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.lerp(c, Colors.white, 0.65)!,
                  c,
                  Color.lerp(c, Colors.black, 0.08)!
                ],
                stops: const [0, 0.5, 1],
              ),
              border: Border.all(
                  color: widget.here ? const Color(0xFF7B3FE4) : Colors.white,
                  width: widget.here ? 4 : 3),
              boxShadow: [
                BoxShadow(
                    color: Color.lerp(c, Colors.black, 0.35)!,
                    offset: const Offset(0, 6)),
                const BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 14,
                    offset: Offset(0, 10)),
              ],
            ),
            child: Stack(children: [
              Positioned(
                left: 14,
                top: 8,
                right: 30,
                height: 18,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(12))),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(d.emoji,
                        style: TextStyle(fontSize: widget.compact ? 34 : 54)),
                    SizedBox(height: widget.compact ? 2 : 6),
                    Text(d.label,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: _font(widget.compact ? 15 : 20)),
                    if (widget.here)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                              color: const Color(0xFF7B3FE4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('You are here',
                              style: _font(11, color: Colors.white)),
                        ),
                      ),
                  ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _JellyButton extends StatefulWidget {
  const _JellyButton(
      {required this.emoji,
      required this.label,
      required this.color,
      required this.onTap});
  final String emoji;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_JellyButton> createState() => _JellyButtonState();
}

class _JellyButtonState extends State<_JellyButton>
    with SingleTickerProviderStateMixin, _Squish {
  @override
  Widget build(BuildContext context) {
    final c = widget.color;
    return GestureDetector(
      onTap: () => squishThen(widget.onTap),
      child: AnimatedBuilder(
        animation: squish,
        builder: (context, child) {
          final s = squishScale();
          return Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.diagonal3Values(s.dx, s.dy, 1),
              child: child);
        },
        child: Container(
          height: 58,
          margin: const EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.lerp(c, Colors.white, 0.65)!,
                c,
                Color.lerp(c, Colors.black, 0.08)!
              ],
              stops: const [0, 0.5, 1],
            ),
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                  color: Color.lerp(c, Colors.black, 0.35)!,
                  offset: const Offset(0, 5))
            ],
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(widget.emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 8),
                Text(widget.label, style: _font(20)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
