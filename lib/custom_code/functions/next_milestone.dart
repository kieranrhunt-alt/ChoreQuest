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

/// Closest milestone unlock for a kid.
String? nextMilestone(
  List<AvatarItemStruct>? items,
  List<WardrobeEntryStruct>? wardrobe,
  List<QuestStruct>? quests,
  String? kidId,
) {
  int progressOf(AvatarItemStruct it, List<QuestStruct> qs, String kid) {
    DateTime d0(DateTime d) => DateTime(d.year, d.month, d.day);
    bool owns(QuestStruct q) => q.assigneeId == kid || q.claimedById == kid;
    final done = qs
        .where((q) => !q.isTemplate && q.status == 'approved' && owns(q))
        .toList();
    if (it.milestoneType == 'quest_count') return done.length;
    if (it.milestoneType == 'streak_days') {
      final days = <DateTime>{};
      for (final q in done) {
        final a = q.approvedAt;
        if (a != null) days.add(d0(a));
      }
      var day = d0(DateTime.now());
      if (!days.contains(day)) day = day.subtract(const Duration(days: 1));
      var streak = 0;
      while (days.contains(day)) {
        streak++;
        day = day.subtract(const Duration(days: 1));
      }
      return streak;
    }
    if (it.milestoneType == 'perfect_week') {
      final weeks = <DateTime, List<QuestStruct>>{};
      for (final q in qs) {
        if (q.isTemplate || !owns(q)) continue;
        final due = q.dueDate;
        if (due == null) continue;
        final dd = d0(due);
        final ws = dd.subtract(Duration(days: dd.weekday - 1));
        weeks.putIfAbsent(ws, () => <QuestStruct>[]).add(q);
      }
      final today = d0(DateTime.now());
      var count = 0;
      weeks.forEach((ws, list) {
        final ended = today.isAfter(ws.add(const Duration(days: 6)));
        if (ended && list.every((q) => q.status == 'approved')) count++;
      });
      return count;
    }
    return 0;
  }

  final kid = kidId ?? '';
  final owned = (wardrobe ?? <WardrobeEntryStruct>[])
      .where((w) => w.kidId == kid)
      .map((w) => w.avatarItemId)
      .toSet();
  String label = '';
  double bestRatio = -1;
  for (final it in items ?? <AvatarItemStruct>[]) {
    if (it.milestoneType.isEmpty ||
        it.milestoneValue <= 0 ||
        owned.contains(it.id)) continue;
    final p = progressOf(it, quests ?? <QuestStruct>[], kid);
    final r = p / it.milestoneValue;
    if (r > bestRatio) {
      bestRatio = r;
      label = 'Next unlock: ${it.art} ${it.name} ($p/${it.milestoneValue})';
    }
  }
  return label.isEmpty ? 'All milestones unlocked 🎉' : label;
}
