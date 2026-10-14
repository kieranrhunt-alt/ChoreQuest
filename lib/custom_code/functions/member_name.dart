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

/// Display name for a member id; empty id = Any kid.
String? memberName(
  List<MemberStruct>? members,
  String? memberId,
) {
  final id = memberId ?? '';
  if (id.isEmpty) return 'Any kid';
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id == id) return m.name;
  }
  return 'Unknown';
}
