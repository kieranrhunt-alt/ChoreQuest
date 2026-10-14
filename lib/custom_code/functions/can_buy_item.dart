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

/// Whether the Buy button should show for an item.
bool? canBuyItem(
  AvatarItemStruct? item,
  List<WardrobeEntryStruct>? wardrobe,
  List<RedemptionStruct>? redemptions,
  String? kidId,
) {
  if (item == null || item.buckCost <= 0) return false;
  if ((wardrobe ?? <WardrobeEntryStruct>[])
      .any((w) => w.kidId == kidId && w.avatarItemId == item.id)) return false;
  if ((redemptions ?? <RedemptionStruct>[]).any((r) =>
      r.kidId == kidId && r.status == 'pending' && r.avatarItemId == item.id))
    return false;
  return true;
}
