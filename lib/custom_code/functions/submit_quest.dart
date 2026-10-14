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

/// Kid marks a quest complete for parent review.
List<QuestStruct>? submitQuest(
  List<QuestStruct>? quests,
  String? questId,
  String? kidId,
  String? photoUrl,
) {
  final list = List<QuestStruct>.from(quests ?? <QuestStruct>[]);
  for (final q in list) {
    if (q.id != questId) continue;
    if (q.assigneeId.isEmpty) q.claimedById = kidId ?? '';
    q.status = 'submitted';
    q.photoUrl = photoUrl ?? '';
    q.submittedAt = DateTime.now();
  }
  return list;
}
