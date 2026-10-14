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

/// Appends a signed ledger entry.
List<BuckTransactionStruct>? addTx(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
  int? amount,
  String? reason,
) {
  final list = List<BuckTransactionStruct>.from(
      transactions ?? <BuckTransactionStruct>[]);
  list.add(BuckTransactionStruct(
    id: 't_${DateTime.now().microsecondsSinceEpoch}',
    kidId: kidId ?? '',
    amount: amount ?? 0,
    reason: (reason ?? '').trim(),
    timestamp: DateTime.now(),
  ));
  return list;
}
