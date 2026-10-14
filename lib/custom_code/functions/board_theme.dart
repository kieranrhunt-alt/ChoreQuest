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

/// Chosen Reward Road board theme for a reward (default: road).
String? boardTheme(
  String? themes,
  String? rewardId,
) {
  for (final e in (themes ?? '').split(';')) {
    final p = e.split('=');
    if (p.length == 2 && p[0] == rewardId && p[1].isNotEmpty) return p[1];
  }
  return 'road';
}
