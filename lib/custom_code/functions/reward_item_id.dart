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

/// Squishie item id linked to a Treasure Quest reward (rewards made from
/// catalog items), or empty.
String? rewardItemId(String? rewardId) {
  final id = rewardId ?? '';
  if (!id.startsWith('ri_')) return '';
  final body = id.substring(3);
  final cut = body.lastIndexOf('_');
  return cut <= 0 ? body : body.substring(0, cut);
}
