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

/// Parent quest board filter: active | recurring | done | review.
List<QuestStruct>? parentQuests(
  List<QuestStruct>? quests,
  String? filter,
) {
  final all = quests ?? <QuestStruct>[];
  List<QuestStruct> out;
  switch (filter) {
    case 'recurring':
      out = all.where((q) => q.isTemplate).toList();
      break;
    case 'done':
      out = all.where((q) => !q.isTemplate && q.status == 'approved').toList();
      out.sort((a, b) => (b.approvedAt ?? DateTime(2000))
          .compareTo(a.approvedAt ?? DateTime(2000)));
      return out;
    case 'review':
      out = all.where((q) => !q.isTemplate && q.status == 'submitted').toList();
      break;
    default:
      out = all.where((q) => !q.isTemplate && q.status != 'approved').toList();
  }
  out.sort((a, b) =>
      (a.dueDate ?? DateTime(2100)).compareTo(b.dueDate ?? DateTime(2100)));
  return out;
}
