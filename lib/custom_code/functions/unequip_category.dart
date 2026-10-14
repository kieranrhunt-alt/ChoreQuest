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

/// Takes off every equipped item of one category.
List<WardrobeEntryStruct>? unequipCategory(
  List<WardrobeEntryStruct>? wardrobe,
  List<AvatarItemStruct>? items,
  String? kidId,
  String? category,
) {
  final cats = <String, String>{};
  for (final i in items ?? <AvatarItemStruct>[]) {
    cats[i.id] = i.category;
  }
  final list =
      List<WardrobeEntryStruct>.from(wardrobe ?? <WardrobeEntryStruct>[]);
  for (final w in list) {
    if (w.kidId == kidId && cats[w.avatarItemId] == category)
      w.equipped = false;
  }
  return list;
}
