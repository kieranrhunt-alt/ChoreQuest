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

/// Ledger entries for one kid, or the whole family when kidId is empty.
List<BuckTransactionStruct>? txFor(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
) {
  final kid = kidId ?? '';
  final out = (transactions ?? <BuckTransactionStruct>[])
      .where((t) => kid.isEmpty || t.kidId == kid)
      .toList();
  out.sort((a, b) =>
      (b.timestamp ?? DateTime(2000)).compareTo(a.timestamp ?? DateTime(2000)));
  return out;
}
