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

/// Thumbnail look: the member's own squishy wearing just this item
/// (try-before-you-buy).
String? itemLook(
  AvatarItemStruct? item,
  List<MemberStruct>? members,
  String? memberId,
) {
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

  if (item == null) return 'species:bunny';
  var base = parse('species:bunny');
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id == memberId && m.baseAvatar.contains('species:'))
      base = parse(m.baseAvatar);
  }
  final species = base['species'] ?? 'bunny';
  final color = base['color'] ?? '';
  if (item.category == 'species') return 'species:${item.art}';
  if (item.category == 'kit')
    return 'species:$species|color:rainbow|fx:sparkles';
  final parts = <String>['species:$species'];
  if (color.isNotEmpty && item.category != 'color') parts.add('color:$color');
  final k = keys[item.category];
  if (k != null) parts.add('$k:${item.art}');
  return parts.join('|');
}
