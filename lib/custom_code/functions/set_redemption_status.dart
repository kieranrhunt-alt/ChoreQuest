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

/// Approves or declines a redemption.
List<RedemptionStruct>? setRedemptionStatus(
  List<RedemptionStruct>? redemptions,
  String? redemptionId,
  String? status,
) {
  final list = List<RedemptionStruct>.from(redemptions ?? <RedemptionStruct>[]);
  for (final r in list) {
    if (r.id == redemptionId) r.status = status ?? r.status;
  }
  return list;
}
