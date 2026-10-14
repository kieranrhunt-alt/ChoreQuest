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

/// Starter rewards catalog.
List<RewardStruct>? defaultRewards() {
  return [
    RewardStruct(
        id: 'r_cash5',
        title: '\$5',
        buckCost: 50,
        description: 'A parent-defined reward with a buck cost.',
        icon: '💵'),
    RewardStruct(
        id: 'r_screen30',
        title: '30 min extra screen time',
        buckCost: 20,
        description: 'A time-based privilege.',
        icon: '📱'),
    RewardStruct(
        id: 'r_dinner',
        title: 'Choose Friday dinner',
        buckCost: 30,
        description: 'You pick what the family eats!',
        icon: '🍕'),
  ];
}
