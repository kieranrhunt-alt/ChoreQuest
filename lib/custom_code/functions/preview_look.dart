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

/// Preview look for a catalog style being created.
String? previewLook(
  String? category,
  String? art,
) {
  const keys = {
    'species': 'species',
    'color': 'color',
    'texture': 'texture',
    'fill': 'fill',
    'hat': 'hat',
    'gear': 'gear',
    'background': 'bg',
    'effect': 'fx'
  };
  final a = art ?? '';
  if (category == 'species') return 'species:$a';
  return 'species:bunny|${keys[category] ?? 'hat'}:$a';
}
