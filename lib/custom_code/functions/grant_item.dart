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

/// Adds an item to a kid wardrobe.
List<WardrobeEntryStruct>? grantItem(
  List<WardrobeEntryStruct>? wardrobe,
  String? kidId,
  String? itemId,
  String? source,
) {
  final list =
      List<WardrobeEntryStruct>.from(wardrobe ?? <WardrobeEntryStruct>[]);
  if (list.any((w) => w.kidId == kidId && w.avatarItemId == itemId))
    return list;
  list.add(WardrobeEntryStruct(
    id: 'w_${DateTime.now().microsecondsSinceEpoch}',
    kidId: kidId ?? '',
    avatarItemId: itemId ?? '',
    equipped: false,
    unlockedAt: DateTime.now(),
    unlockSource: source ?? 'purchased',
  ));
  return list;
}
