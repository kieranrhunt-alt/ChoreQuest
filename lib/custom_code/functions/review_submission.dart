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

/// Closes the latest pending submission for a quest.
List<SubmissionStruct>? reviewSubmission(
  List<SubmissionStruct>? submissions,
  String? questId,
  bool? approve,
  String? note,
) {
  final list = List<SubmissionStruct>.from(submissions ?? <SubmissionStruct>[]);
  for (final s in list.reversed) {
    if (s.questId == questId && s.status == 'pending') {
      s.status = (approve ?? false) ? 'approved' : 'denied';
      s.parentNote = (note ?? '').trim();
      break;
    }
  }
  return list;
}
