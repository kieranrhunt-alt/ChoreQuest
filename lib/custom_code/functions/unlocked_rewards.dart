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

/// Rewards a hero has unlocked (approved reward redemptions), newest first.
List<RedemptionStruct>? unlockedRewards(
  List<RedemptionStruct>? redemptions,
  String? kidId,
) {
  final list = (redemptions ?? <RedemptionStruct>[])
      .where((r) =>
          r.kidId == kidId &&
          r.targetType == 'reward' &&
          r.status == 'approved')
      .toList();
  list.sort((a, b) =>
      (b.timestamp ?? DateTime(2000)).compareTo(a.timestamp ?? DateTime(2000)));
  return list;
}
