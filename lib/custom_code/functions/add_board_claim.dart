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

/// Records a claimed Reward Road surprise.
List<BoardClaimStruct>? addBoardClaim(
  List<BoardClaimStruct>? claims,
  String? kidId,
  String? rewardId,
  int? round,
  int? space,
) {
  final list = List<BoardClaimStruct>.from(claims ?? <BoardClaimStruct>[]);
  if (list.any((c) =>
      c.kidId == kidId &&
      c.rewardId == rewardId &&
      c.round == (round ?? 0) &&
      c.space == (space ?? 0))) return list;
  list.add(BoardClaimStruct(
    id: 'bc_${DateTime.now().microsecondsSinceEpoch}',
    kidId: kidId ?? '',
    rewardId: rewardId ?? '',
    round: round ?? 0,
    space: space ?? 0,
    claimedAt: DateTime.now(),
  ));
  return list;
}
