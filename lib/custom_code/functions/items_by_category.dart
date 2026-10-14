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

/// Catalog items in a category (or all).
List<AvatarItemStruct>? itemsByCategory(
  List<AvatarItemStruct>? items,
  String? category,
) {
  final c = category ?? 'all';
  return (items ?? <AvatarItemStruct>[])
      .where((i) =>
          c == 'all' ||
          (c == 'holiday' ? i.id.startsWith('hol_') : i.category == c))
      .toList();
}
