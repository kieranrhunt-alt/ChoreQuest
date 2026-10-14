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

/// Adds a new quest (or a recurring template).
List<QuestStruct>? createQuest(
  List<QuestStruct>? quests,
  String? title,
  String? description,
  int? buckValue,
  String? assigneeId,
  DateTime? dueDate,
  String? recurrence,
  bool? requiresPhoto,
) {
  final list = List<QuestStruct>.from(quests ?? <QuestStruct>[]);
  final rec = (recurrence ?? '').isEmpty ? 'none' : recurrence!;
  final isTemplate = rec != 'none';
  list.add(QuestStruct(
    id: 'q_${DateTime.now().microsecondsSinceEpoch}',
    title: (title ?? '').trim(),
    description: (description ?? '').trim(),
    buckValue: buckValue ?? 1,
    assigneeId: assigneeId ?? '',
    claimedById: '',
    dueDate: isTemplate ? null : dueDate,
    recurrence: rec,
    requiresPhoto: requiresPhoto ?? false,
    status: isTemplate ? 'template' : 'open',
    parentNote: '',
    isTemplate: isTemplate,
    templateId: '',
    instanceKey: '',
    photoUrl: '',
    createdAt: DateTime.now(),
  ));
  return list;
}
