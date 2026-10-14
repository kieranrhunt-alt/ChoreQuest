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

/// Whether a kid already has a pending request for a target.
bool? hasPending(
  List<RedemptionStruct>? redemptions,
  String? kidId,
  String? targetId,
) {
  for (final r in redemptions ?? <RedemptionStruct>[]) {
    if (r.kidId == kidId &&
        r.status == 'pending' &&
        (r.rewardId == targetId || r.avatarItemId == targetId)) {
      return true;
    }
  }
  return false;
}
