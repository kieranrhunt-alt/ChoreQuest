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

/// Catalog items a kid has not unlocked yet.
List<AvatarItemStruct>? lockedItems(
  List<AvatarItemStruct>? items,
  List<WardrobeEntryStruct>? wardrobe,
  String? kidId,
  String? category,
) {
  final owned = (wardrobe ?? <WardrobeEntryStruct>[])
      .where((w) => w.kidId == kidId)
      .map((w) => w.avatarItemId)
      .toSet();
  final c = category ?? 'all';
  return (items ?? <AvatarItemStruct>[])
      .where((i) => !owned.contains(i.id) && (c == 'all' || i.category == c))
      .toList();
}
