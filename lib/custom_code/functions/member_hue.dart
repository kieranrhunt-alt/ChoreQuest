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

/// Hue (0-359) of a member's base color, for the dye slider.
double? memberHue(
  List<MemberStruct>? members,
  String? memberId,
) {
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id != memberId) continue;
    final i = m.baseAvatar.indexOf('color:#');
    if (i < 0) return 0.0;
    final hex = m.baseAvatar.substring(i + 7).split('|').first;
    final v = int.tryParse(hex, radix: 16);
    if (v == null) return 0.0;
    return HSLColor.fromColor(Color(0xFF000000 | v)).hue;
  }
  return 0.0;
}
