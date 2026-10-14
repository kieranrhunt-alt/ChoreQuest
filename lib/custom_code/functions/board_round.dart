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

/// Which board round a hero is on for a reward (a fresh board after each
/// redemption).
int? boardRound(
  List<RedemptionStruct>? redemptions,
  String? kidId,
  String? rewardId,
) {
  return (redemptions ?? <RedemptionStruct>[])
      .where((r) =>
          r.kidId == kidId && r.rewardId == rewardId && r.status == 'approved')
      .length;
}
