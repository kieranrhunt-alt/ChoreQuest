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

/// Reads one quest field as text.
String? questStr(
  List<QuestStruct>? quests,
  String? questId,
  String? field,
) {
  for (final q in quests ?? <QuestStruct>[]) {
    if (q.id != questId) continue;
    switch (field) {
      case 'title':
        return q.title;
      case 'description':
        return q.description;
      case 'assigneeId':
        return q.assigneeId;
      case 'recurrence':
        return q.recurrence;
      case 'requiresPhoto':
        return q.requiresPhoto ? 'true' : 'false';
      case 'buckValue':
        return q.buckValue.toString();
    }
  }
  return '';
}
