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

/// Friendly name for an avatar category.
String? categoryLabel(String? category) {
  switch (category) {
    case 'species':
      return 'Squishy';
    case 'color':
      return 'Color';
    case 'texture':
      return 'Texture';
    case 'fill':
      return 'Fill-in';
    case 'hat':
      return 'Headgear';
    case 'gear':
      return 'Gear';
    case 'background':
      return 'Realm';
    case 'effect':
      return 'Magic';
    case 'kit':
      return 'Magic Kit';
  }
  return 'All';
}
