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

/// Current member id when it is a kid; empty for parents (family view).
String? viewerKidId(
  List<MemberStruct>? members,
  String? currentId,
) {
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id == currentId && m.role == 'kid') return m.id;
  }
  return '';
}
