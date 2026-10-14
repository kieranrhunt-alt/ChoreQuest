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

/// Friendly status label.
String? statusLabel(String? status) {
  switch (status) {
    case 'open':
      return '🟦 Open';
    case 'claimed':
      return '✋ Claimed';
    case 'submitted':
      return '⏳ Needs review';
    case 'approved':
      return '✅ Approved';
    case 'template':
      return '🔁 Recurring';
    case 'pending':
      return '⏳ Pending';
    case 'declined':
      return '✖ Declined';
  }
  return status ?? '';
}
