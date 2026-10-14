import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';

/// Mystery-chest surprises for a hero on a reward board: stable random
/// spaces, revealed as the token passes them.
List<BoardPrizeStruct>? boardPrizes(
  String? rewardId,
  String? kidId,
  int? cost,
  int? round,
  List<AvatarItemStruct>? items,
  List<MemberStruct>? members,
  List<WardrobeEntryStruct>? wardrobe,
  List<BoardClaimStruct>? claims,
  List<BuckTransactionStruct>? transactions,
  bool? surprisesOn,
) {
  final kid = kidId ?? '';
  final rid = rewardId ?? '';
  final c = cost ?? 0;
  if (c < 4 || !(surprisesOn ?? true)) return <BoardPrizeStruct>[];
  final spaces = c > 150 ? 150 : c;
  var seed = 7;
  for (final u in '$rid|$kid|${round ?? 0}'.codeUnits) {
    seed = (seed * 31 + u) & 0x7fffffff;
  }
  final rnd = math.Random(seed);
  final count = math.min(8, math.max(1, spaces ~/ 6));
  final picks = <int>{};
  var guard = 0;
  while (picks.length < count && guard < 500) {
    guard++;
    final s = 2 + rnd.nextInt(math.max(1, spaces - 3));
    if (s < spaces) picks.add(s);
  }
  final sorted = picks.toList()..sort();
  final pool = (items ?? <AvatarItemStruct>[])
      .where((i) =>
          i.buckCost > 0 &&
          i.buckCost <= 12 &&
          i.category != 'kit' &&
          i.category != 'species')
      .toList()
    ..sort((a, b) => a.id.compareTo(b.id));
  var bal = 0;
  for (final t in transactions ?? <BuckTransactionStruct>[]) {
    if (t.kidId == kid) bal += t.amount;
  }
  final pos = ((bal < 0 ? 0 : (bal > c ? c : bal)) / c * spaces).floor();
  var species = 'bunny';
  var color = '';
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id != kid) continue;
    for (final p in m.baseAvatar.split('|')) {
      if (p.startsWith('species:')) species = p.substring(8);
      if (p.startsWith('color:')) color = p.substring(6);
    }
  }
  const keys = {
    'color': 'color',
    'texture': 'texture',
    'fill': 'fill',
    'hat': 'hat',
    'gear': 'gear',
    'background': 'bg',
    'effect': 'fx'
  };
  final claimed = <int>{};
  for (final cl in claims ?? <BoardClaimStruct>[]) {
    if (cl.kidId == kid && cl.rewardId == rid && cl.round == (round ?? 0))
      claimed.add(cl.space);
  }
  final owned = (wardrobe ?? <WardrobeEntryStruct>[])
      .where((w) => w.kidId == kid)
      .map((w) => w.avatarItemId)
      .toSet();
  final used = <String>{};
  final out = <BoardPrizeStruct>[];
  for (final sp in sorted) {
    final roll = rnd.nextDouble();
    AvatarItemStruct? item;
    if (roll < 0.45 && pool.isNotEmpty) {
      final cand = pool[rnd.nextInt(pool.length)];
      if (!used.contains(cand.id)) {
        item = cand;
        used.add(cand.id);
      }
    }
    final gold = 1 + rnd.nextInt(2);
    final isClaimed = claimed.contains(sp);
    if (item != null && owned.contains(item.id) && !isClaimed) item = null;
    String look = '';
    if (item != null) {
      final k = keys[item.category] ?? 'hat';
      look = item.category == 'color'
          ? 'species:$species|color:${item.art}'
          : 'species:$species${color.isEmpty ? '' : '|color:$color'}|$k:${item.art}';
    }
    out.add(BoardPrizeStruct(
      space: sp,
      kind: item == null ? 'gold' : 'item',
      gold: item == null ? gold : 0,
      itemId: item?.id ?? '',
      label: item == null ? '+$gold bonus gold' : item.name,
      look: look,
      revealed: sp <= pos,
      claimed: isClaimed,
    ));
  }
  return out;
}
