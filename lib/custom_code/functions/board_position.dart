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

/// Token space on the Reward Road, proportional to the hero's gold vs the
/// reward cost.
int? boardPosition(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
  int? cost,
) {
  final c = cost ?? 0;
  if (c <= 0) return 0;
  final spaces = c <= 1 ? 1 : (c > 150 ? 150 : c);
  var bal = 0;
  for (final t in transactions ?? <BuckTransactionStruct>[]) {
    if (t.kidId == kidId) bal += t.amount;
  }
  final clamped = bal < 0 ? 0 : (bal > c ? c : bal);
  return (clamped / c * spaces).floor();
}
