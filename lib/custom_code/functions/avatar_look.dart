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

/// Full squishy look for a member: base species/color + equipped items + live
/// preview item.
String? avatarLook(
  List<MemberStruct>? members,
  List<WardrobeEntryStruct>? wardrobe,
  List<AvatarItemStruct>? items,
  String? memberId,
  String? previewItemId,
) {
  final defaultParent = 'species:bear|color:#8E6CEF|hat:crown';
  Map<String, String> parse(String raw) {
    final m = <String, String>{};
    for (final part in raw.split('|')) {
      final i = part.indexOf(':');
      if (i > 0) m[part.substring(0, i)] = part.substring(i + 1);
    }
    return m;
  }

  const keys = {
    'species': 'species',
    'color': 'color',
    'texture': 'texture',
    'fill': 'fill',
    'hat': 'hat',
    'gear': 'gear',
    'background': 'bg',
    'effect': 'fx'
  };

  var base = 'species:bunny';
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id == memberId) {
      base = m.baseAvatar.contains('species:')
          ? m.baseAvatar
          : (m.role == 'parent' ? defaultParent : 'species:bunny');
    }
  }
  final look = parse(base);
  final byId = <String, AvatarItemStruct>{};
  for (final i in items ?? <AvatarItemStruct>[]) {
    byId[i.id] = i;
  }
  for (final w in wardrobe ?? <WardrobeEntryStruct>[]) {
    if (w.kidId != memberId || !w.equipped) continue;
    final it = byId[w.avatarItemId];
    if (it == null) continue;
    final k = keys[it.category];
    if (k != null) look[k] = it.art;
  }
  final p = byId[previewItemId ?? ''];
  if (p != null) {
    final k = keys[p.category];
    if (k != null) look[k] = p.art;
  }
  return look.entries.map((e) => '${e.key}:${e.value}').join('|');
}
