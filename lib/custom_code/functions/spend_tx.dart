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

/// Negative ledger entry for an approved redemption.
List<BuckTransactionStruct>? spendTx(
  List<BuckTransactionStruct>? transactions,
  RedemptionStruct? redemption,
) {
  final list = List<BuckTransactionStruct>.from(
      transactions ?? <BuckTransactionStruct>[]);
  if (redemption == null) return list;
  final label =
      redemption.targetType == 'avatar_item' ? 'Avatar item' : 'Reward';
  list.add(BuckTransactionStruct(
    id: 't_${DateTime.now().microsecondsSinceEpoch}',
    kidId: redemption.kidId,
    amount: -redemption.cost,
    reason: '$label: ${redemption.title}',
    timestamp: DateTime.now(),
  ));
  return list;
}
