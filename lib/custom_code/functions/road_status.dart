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

/// Friendly progress line for the Reward Road.
String? roadStatus(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
  int? cost,
) {
  var bal = 0;
  for (final t in transactions ?? <BuckTransactionStruct>[]) {
    if (t.kidId == kidId) bal += t.amount;
  }
  final c = cost ?? 0;
  if (bal >= c) return 'You reached the treasure! 🎉';
  final left = c - (bal < 0 ? 0 : bal);
  return '$left more gold to reach the treasure';
}
