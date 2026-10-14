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

/// Ledger entry for an approved quest.
List<BuckTransactionStruct>? questEarnTx(
  List<BuckTransactionStruct>? transactions,
  QuestStruct? quest,
) {
  final list = List<BuckTransactionStruct>.from(
      transactions ?? <BuckTransactionStruct>[]);
  if (quest == null) return list;
  final owner =
      quest.assigneeId.isNotEmpty ? quest.assigneeId : quest.claimedById;
  list.add(BuckTransactionStruct(
    id: 't_${DateTime.now().microsecondsSinceEpoch}',
    kidId: owner,
    amount: quest.buckValue,
    reason: 'Quest complete: ${quest.title}',
    timestamp: DateTime.now(),
  ));
  return list;
}
