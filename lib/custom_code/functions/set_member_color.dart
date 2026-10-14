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

/// Sets a member's base squishy color (Rainbow Dye Kit).
List<MemberStruct>? setMemberColor(
  List<MemberStruct>? members,
  String? memberId,
  String? hex,
) {
  final list = List<MemberStruct>.from(members ?? <MemberStruct>[]);
  for (final m in list) {
    if (m.id != memberId) continue;
    final parts = m.baseAvatar
        .split('|')
        .where((p) => p.isNotEmpty && !p.startsWith('color:'))
        .toList();
    if (!parts.any((p) => p.startsWith('species:')))
      parts.insert(0, 'species:bunny');
    parts.insert(1, 'color:${hex ?? '#F8B6C8'}');
    m.baseAvatar = parts.join('|');
  }
  return list;
}
