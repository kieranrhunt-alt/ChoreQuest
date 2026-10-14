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

/// A member's royal role title (Ruler, Knight, Princess, Prince, Jester,
/// Wizard).
String? memberTitle(
  List<MemberStruct>? members,
  String? memberId,
) {
  for (final m in members ?? <MemberStruct>[]) {
    if (m.id != memberId) continue;
    if (m.role == 'parent') return '👑 Ruler';
    final i = m.baseAvatar.indexOf('class:');
    final cls = i < 0 ? '' : m.baseAvatar.substring(i + 6).split('|').first;
    switch (cls) {
      case 'knight':
        return '⚔️ Knight';
      case 'princess':
        return '👸 Princess';
      case 'prince':
        return '🤴 Prince';
      case 'jester':
        return '🃏 Jester';
      case 'wizard':
        return '🧙 Wizard';
    }
    return '⚔️ Hero';
  }
  return '';
}
