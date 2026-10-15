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

/// The reward id of the hero's active Treasure Quest, or empty.
String? tqActiveReward(
  List<BuckTransactionStruct>? transactions,
  String? kidId,
) {
  String tqRid(String id) {
    final body = id.substring(4);
    final cut = body.lastIndexOf('_');
    return cut <= 0 ? body : body.substring(0, cut);
  }

  final _txs = transactions ?? <BuckTransactionStruct>[];
  final _kid = kidId ?? '';
  var active = '';
  var start = -1;
  for (var i = 0; i < _txs.length; i++) {
    final t = _txs[i];
    if (t.kidId != _kid) continue;
    if (t.id.startsWith('tqs_')) {
      active = tqRid(t.id);
      start = i;
    } else if ((t.id.startsWith('tqq_') || t.id.startsWith('tqd_')) &&
        tqRid(t.id) == active) {
      active = '';
      start = -1;
    }
  }
  int earnedSince() {
    if (start < 0) return 0;
    var e = 0;
    for (var i = start + 1; i < _txs.length; i++) {
      final t = _txs[i];
      if (t.kidId == _kid && t.amount > 0) e += t.amount;
    }
    return e;
  }

  int balance() {
    var b = 0;
    for (final t in _txs) {
      if (t.kidId == _kid) b += t.amount;
    }
    return b;
  }

  return active;
}
