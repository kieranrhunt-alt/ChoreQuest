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

/// Kid requests a reward or avatar item (needs parent approval).
List<RedemptionStruct>? requestRedemption(
  List<RedemptionStruct>? redemptions,
  String? targetType,
  String? targetId,
  String? kidId,
  String? title,
  int? cost,
) {
  final list = List<RedemptionStruct>.from(redemptions ?? <RedemptionStruct>[]);
  final isItem = targetType == 'avatar_item';
  list.add(RedemptionStruct(
    id: 'd_${DateTime.now().microsecondsSinceEpoch}',
    targetType: isItem ? 'avatar_item' : 'reward',
    rewardId: isItem ? '' : (targetId ?? ''),
    avatarItemId: isItem ? (targetId ?? '') : '',
    kidId: kidId ?? '',
    status: 'pending',
    timestamp: DateTime.now(),
    title: title ?? '',
    cost: cost ?? 0,
  ));
  return list;
}
