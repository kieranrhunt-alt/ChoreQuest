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

/// Preview look: the hero's color on another Squishie character.
String? speciesLook(
  List<MemberStruct>? members,
  String? memberId,
  String? species,
) {
  var color = '';
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id != memberId) continue;
    for (final p in m.baseAvatar.split('|')) {
      if (p.startsWith('color:')) color = p.substring(6);
    }
  }
  return 'species:${species ?? 'bunny'}${color.isEmpty ? '' : '|color:$color'}';
}
