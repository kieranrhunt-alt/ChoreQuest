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

/// Name of the item equipped in an equipment slot (category), or empty.
String? slotItemName(
  List<WardrobeEntryStruct>? wardrobe,
  List<AvatarItemStruct>? items,
  String? kidId,
  String? category,
) {
  final byId = <String, AvatarItemStruct>{};
  for (final i in items ?? <AvatarItemStruct>[]) {
    byId[i.id] = i;
  }
  for (final w in wardrobe ?? <WardrobeEntryStruct>[]) {
    if (w.kidId != kidId || !w.equipped) continue;
    final it = byId[w.avatarItemId];
    if (it != null && it.category == category) return it.name;
  }
  return '';
}
