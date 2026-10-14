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

/// Auto-generates today/this-week instances for recurring quest templates.
List<QuestStruct>? generateRecurring(List<QuestStruct>? quests) {
  final list = List<QuestStruct>.from(quests ?? <QuestStruct>[]);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final weekStart = today.subtract(Duration(days: today.weekday - 1));
  final weekEnd = weekStart.add(const Duration(days: 6));
  String key(DateTime d) => '${d.year}-${d.month}-${d.day}';
  final existing = <String>{};
  for (final q in list) {
    if (!q.isTemplate && q.templateId.isNotEmpty)
      existing.add('${q.templateId}|${q.instanceKey}');
  }
  final additions = <QuestStruct>[];
  for (final t in list) {
    if (!t.isTemplate) continue;
    DateTime due;
    String k;
    if (t.recurrence == 'daily') {
      due = today;
      k = 'd${key(today)}';
    } else if (t.recurrence == 'weekly') {
      due = weekEnd;
      k = 'w${key(weekStart)}';
    } else {
      continue;
    }
    if (existing.contains('${t.id}|$k')) continue;
    additions.add(QuestStruct(
      id: '${t.id}_$k',
      title: t.title,
      description: t.description,
      buckValue: t.buckValue,
      assigneeId: t.assigneeId,
      claimedById: '',
      dueDate: due,
      recurrence: t.recurrence,
      requiresPhoto: t.requiresPhoto,
      status: 'open',
      parentNote: '',
      isTemplate: false,
      templateId: t.id,
      instanceKey: k,
      photoUrl: '',
      createdAt: now,
    ));
  }
  if (additions.isEmpty) return list;
  return [...list, ...additions];
}
