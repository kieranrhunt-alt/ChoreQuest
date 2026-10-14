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

/// Ledger entry for an instant reward purchase (negative gold).
List<BuckTransactionStruct>? buyRewardTx(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
  String? title,
  int? cost,
) {
  final list = List<BuckTransactionStruct>.from(
      transactions ?? <BuckTransactionStruct>[]);
  list.add(BuckTransactionStruct(
    id: 't_${DateTime.now().microsecondsSinceEpoch}',
    kidId: kidId ?? '',
    amount: -(cost ?? 0),
    reason: 'Reward: ${title ?? ''}',
    timestamp: DateTime.now(),
  ));
  return list;
}
