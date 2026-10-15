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

/// Changes a hero's Squishie character (species) and keeps their color and
/// role.
List<MemberStruct>? setMemberSpecies(
  List<MemberStruct>? members,
  String? memberId,
  String? species,
) {
  final list = List<MemberStruct>.from(members ?? <MemberStruct>[]);
  for (final m in list) {
    if (m.id != memberId) continue;
    final parts = m.baseAvatar
        .split('|')
        .where((p) => p.isNotEmpty && !p.startsWith('species:'))
        .toList();
    m.baseAvatar = ['species:${species ?? 'bunny'}', ...parts].join('|');
  }
  return list;
}
