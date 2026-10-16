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

/// Adds a Treasure Quest reward that unlocks a Squishie item (one per item).
List<RewardStruct>? addItemReward(
  List<RewardStruct>? rewards,
  AvatarItemStruct? item,
) {
  final list = List<RewardStruct>.from(rewards ?? <RewardStruct>[]);
  if (item == null) return list;
  if (list.any((r) => r.id.startsWith('ri_${item.id}_'))) return list;
  list.add(RewardStruct(
    id: 'ri_${item.id}_${DateTime.now().microsecondsSinceEpoch}',
    title: '🧸 ${item.name}',
    buckCost: item.buckCost > 0 ? item.buckCost : 10,
    description:
        'Unlocks this Squishie item for your avatar in the Squishie Studio!',
    icon: '🧸',
  ));
  return list;
}
