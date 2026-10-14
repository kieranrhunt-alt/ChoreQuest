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

/// Base look for a new hero: species + color + the signature gear of their
/// role.
String? classLook(
  String? species,
  String? color,
  String? cls,
) {
  final sp = (species ?? '').isEmpty ? 'bunny' : species!;
  final parts = <String>['species:$sp'];
  if ((color ?? '').isNotEmpty) parts.add('color:$color');
  final c = cls ?? '';
  if (c.isNotEmpty) parts.add('class:$c');
  switch (c) {
    case 'knight':
      parts.addAll(['hat:helm', 'gear:sword']);
      break;
    case 'princess':
      parts.addAll(['hat:tiara', 'gear:cape']);
      break;
    case 'prince':
      parts.addAll(['hat:circlet', 'gear:cape']);
      break;
    case 'jester':
      parts.add('hat:jester');
      break;
    case 'wizard':
      parts.addAll(['hat:wizard', 'gear:wand']);
      break;
  }
  return parts.join('|');
}
