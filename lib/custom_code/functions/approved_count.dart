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

/// Approved quest count for a kid.
int? approvedCount(
  List<QuestStruct>? quests,
  String? kidId,
) {
  return (quests ?? <QuestStruct>[])
      .where((q) =>
          !q.isTemplate &&
          q.status == 'approved' &&
          (q.assigneeId == kidId || q.claimedById == kidId))
      .length;
}
