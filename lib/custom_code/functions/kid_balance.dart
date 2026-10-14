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

/// Current Parent Bucks balance for a kid.
int? kidBalance(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
) {
  var total = 0;
  for (final t in transactions ?? <BuckTransactionStruct>[]) {
    if (t.kidId == kidId) total += t.amount;
  }
  return total;
}
