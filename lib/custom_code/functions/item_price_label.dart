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

/// Price / milestone label for a catalog item.
String? itemPriceLabel(AvatarItemStruct? item) {
  if (item == null) return '';
  final hasCost = item.buckCost > 0;
  final hasMs = item.milestoneType.isNotEmpty && item.milestoneValue > 0;
  String ms() {
    if (item.milestoneType == 'quest_count')
      return '${item.milestoneValue} quests';
    if (item.milestoneType == 'streak_days')
      return '${item.milestoneValue}-day streak';
    return '${item.milestoneValue} perfect week${item.milestoneValue == 1 ? '' : 's'}';
  }

  if (hasCost && hasMs) return '🪙 ${item.buckCost} or 🏆 ${ms()}';
  if (hasCost) return '🪙 ${item.buckCost}';
  if (hasMs) return '🏆 ${ms()}';
  return 'Free';
}
