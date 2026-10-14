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

/// Gold cost of a reward by id.
int? rewardCost(
  List<RewardStruct>? rewards,
  String? rewardId,
) {
  for (final r in rewards ?? <RewardStruct>[]) {
    if (r.id == rewardId) return r.buckCost;
  }
  return 0;
}
