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

/// Edits a quest; blank title/description keep the current text.
List<QuestStruct>? updateQuest(
  List<QuestStruct>? quests,
  String? questId,
  String? title,
  String? description,
  int? buckValue,
  String? assigneeId,
  DateTime? dueDate,
  String? recurrence,
  bool? requiresPhoto,
) {
  final list = List<QuestStruct>.from(quests ?? <QuestStruct>[]);
  for (final q in list) {
    if (q.id != questId) continue;
    final t = (title ?? '').trim();
    final d = (description ?? '').trim();
    if (t.isNotEmpty) q.title = t;
    if (d.isNotEmpty) q.description = d;
    q.buckValue = buckValue ?? q.buckValue;
    q.assigneeId = assigneeId ?? '';
    q.requiresPhoto = requiresPhoto ?? false;
    if (q.isTemplate) {
      final rec = recurrence ?? q.recurrence;
      if (rec == 'daily' || rec == 'weekly') q.recurrence = rec;
    } else {
      q.dueDate = dueDate;
    }
  }
  return list;
}
