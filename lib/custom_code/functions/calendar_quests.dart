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

/// Quests due (mode=due) or completed (mode=done) on a day.
List<QuestStruct>? calendarQuests(
  List<QuestStruct>? quests,
  DateTime? day,
  String? kidId,
  String? mode,
) {
  final d = day ?? DateTime.now();
  bool same(DateTime? x) =>
      x != null && x.year == d.year && x.month == d.month && x.day == d.day;
  final kid = kidId ?? '';
  return (quests ?? <QuestStruct>[]).where((q) {
    if (q.isTemplate) return false;
    if (kid.isNotEmpty &&
        !(q.assigneeId == kid ||
            q.claimedById == kid ||
            (q.assigneeId.isEmpty && q.claimedById.isEmpty))) {
      return false;
    }
    if (mode == 'done') return q.status == 'approved' && same(q.approvedAt);
    return same(q.dueDate) && q.status != 'approved';
  }).toList();
}
