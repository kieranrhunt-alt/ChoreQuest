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

/// Surprises the hero has reached (unclaimed first).
List<BoardPrizeStruct>? revealedPrizes(List<BoardPrizeStruct>? prizes) {
  final out =
      (prizes ?? <BoardPrizeStruct>[]).where((p) => p.revealed).toList();
  out.sort((a, b) => a.claimed == b.claimed
      ? a.space.compareTo(b.space)
      : (a.claimed ? 1 : -1));
  return out;
}
