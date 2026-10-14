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

/// Instant reward purchase: records an already-approved redemption.
List<RedemptionStruct>? buyRewardRedemption(
  List<RedemptionStruct>? redemptions,
  String? rewardId,
  String? kidId,
  String? title,
  int? cost,
) {
  final list = List<RedemptionStruct>.from(redemptions ?? <RedemptionStruct>[]);
  list.add(RedemptionStruct(
    id: 'd_${DateTime.now().microsecondsSinceEpoch}',
    targetType: 'reward',
    rewardId: rewardId ?? '',
    avatarItemId: '',
    kidId: kidId ?? '',
    status: 'approved',
    timestamp: DateTime.now(),
    title: title ?? '',
    cost: cost ?? 0,
  ));
  return list;
}
