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

/// True when a hero owns more treasures than we have celebrated.
bool? hasNewTreasure(
  List<WardrobeEntryStruct>? wardrobe,
  String? kidId,
  String? celebrations,
) {
  final owned = (wardrobe ?? <WardrobeEntryStruct>[])
      .where((w) => w.kidId == kidId)
      .length;
  var seen = 0;
  for (final e in (celebrations ?? '').split(';')) {
    final p = e.split('=');
    if (p.length == 2 && p[0] == kidId) seen = int.tryParse(p[1]) ?? 0;
  }
  return owned > seen;
}
