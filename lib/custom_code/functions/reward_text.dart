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

/// Title / icon / description of a reward by id.
String? rewardText(
  List<RewardStruct>? rewards,
  String? rewardId,
  String? field,
) {
  for (final r in rewards ?? <RewardStruct>[]) {
    if (r.id != rewardId) continue;
    if (field == 'icon') return r.icon.isEmpty ? '🎁' : r.icon;
    if (field == 'description') return r.description;
    return r.title;
  }
  return '';
}
