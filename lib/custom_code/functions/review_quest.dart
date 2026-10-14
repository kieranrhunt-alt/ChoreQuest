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

/// Parent approves (awards) or denies (back to Open with note).
List<QuestStruct>? reviewQuest(
  List<QuestStruct>? quests,
  String? questId,
  bool? approve,
  String? note,
) {
  final list = List<QuestStruct>.from(quests ?? <QuestStruct>[]);
  for (final q in list) {
    if (q.id != questId) continue;
    q.parentNote = (note ?? '').trim();
    if (approve ?? false) {
      q.status = 'approved';
      q.approvedAt = DateTime.now();
    } else {
      q.status = 'open';
      q.claimedById = '';
      q.photoUrl = '';
    }
  }
  return list;
}
