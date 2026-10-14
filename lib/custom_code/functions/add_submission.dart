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

/// Records a submission (audit trail).
List<SubmissionStruct>? addSubmission(
  List<SubmissionStruct>? submissions,
  String? questId,
  String? kidId,
  String? photoUrl,
) {
  final list = List<SubmissionStruct>.from(submissions ?? <SubmissionStruct>[]);
  list.add(SubmissionStruct(
    id: 's_${DateTime.now().microsecondsSinceEpoch}',
    questId: questId ?? '',
    kidId: kidId ?? '',
    photoUrl: photoUrl ?? '',
    submittedAt: DateTime.now(),
    status: 'pending',
    parentNote: '',
  ));
  return list;
}
