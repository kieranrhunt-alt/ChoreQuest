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

/// Redemptions filtered by status and kid (empty = any).
List<RedemptionStruct>? redemptionsBy(
  List<RedemptionStruct>? redemptions,
  String? status,
  String? kidId,
) {
  final kid = kidId ?? '';
  final st = status ?? '';
  final out = (redemptions ?? <RedemptionStruct>[])
      .where((r) =>
          (st.isEmpty || r.status == st) && (kid.isEmpty || r.kidId == kid))
      .toList();
  out.sort((a, b) =>
      (b.timestamp ?? DateTime(2000)).compareTo(a.timestamp ?? DateTime(2000)));
  return out;
}
