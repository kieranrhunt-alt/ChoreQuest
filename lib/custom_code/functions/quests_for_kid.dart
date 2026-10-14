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

/// Quests a kid can see: assigned to them, claimed by them, or open to claim.
List<QuestStruct>? questsForKid(
  List<QuestStruct>? quests,
  String? kidId,
) {
  final kid = kidId ?? '';
  final out = <QuestStruct>[];
  for (final q in quests ?? <QuestStruct>[]) {
    if (q.isTemplate || q.status == 'approved') continue;
    final mine = q.assigneeId == kid ||
        (q.assigneeId.isEmpty &&
            (q.claimedById.isEmpty || q.claimedById == kid));
    if (mine) out.add(q);
  }
  int rank(String s) => s == 'submitted' ? 1 : 0;
  out.sort((a, b) {
    final r = rank(a.status).compareTo(rank(b.status));
    if (r != 0) return r;
    return (a.dueDate ?? DateTime(2100)).compareTo(b.dueDate ?? DateTime(2100));
  });
  return out;
}
