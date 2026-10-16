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

/// Ledger entry for an instant Squishie Shop purchase (negative gold).
List<BuckTransactionStruct>? shopBuyTx(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
  String? itemName,
  int? cost,
) {
  final list = List<BuckTransactionStruct>.from(
      transactions ?? <BuckTransactionStruct>[]);
  list.add(BuckTransactionStruct(
    id: 't_${DateTime.now().microsecondsSinceEpoch}',
    kidId: kidId ?? '',
    amount: -(cost ?? 0),
    reason: 'Squishie Shop: ${itemName ?? ''}',
    timestamp: DateTime.now(),
  ));
  return list;
}
