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

/// Randomly equips one owned item per equipment slot (head, arm, filler,
/// aura, color, texture).
List<WardrobeEntryStruct>? surpriseOutfit(
  List<WardrobeEntryStruct>? wardrobe,
  List<AvatarItemStruct>? items,
  String? kidId,
) {
  final rnd = math.Random();
  final cats = <String, String>{};
  for (final i in items ?? <AvatarItemStruct>[]) {
    cats[i.id] = i.category;
  }
  const slots = ['hat', 'gear', 'fill', 'effect', 'color', 'texture'];
  final list =
      List<WardrobeEntryStruct>.from(wardrobe ?? <WardrobeEntryStruct>[]);
  for (final slot in slots) {
    final mine = list
        .where((w) => w.kidId == kidId && cats[w.avatarItemId] == slot)
        .toList();
    if (mine.isEmpty) continue;
    for (final w in mine) {
      w.equipped = false;
    }
    if (rnd.nextInt(5) == 0)
      continue; // sometimes leave a slot empty for variety
    mine[rnd.nextInt(mine.length)].equipped = true;
  }
  return list;
}
