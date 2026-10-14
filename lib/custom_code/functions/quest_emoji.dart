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

/// A fun medallion emoji for a quest, picked from its title.
String? questEmoji(String? title) {
  final t = (title ?? '').toLowerCase();
  const map = {
    'bed': '🛏️',
    'dish': '🍽️',
    'plate': '🍽️',
    'dog': '🐶',
    'cat': '🐱',
    'pet': '🐾',
    'feed': '🥣',
    'trash': '🗑️',
    'garbage': '🗑️',
    'recycl': '♻️',
    'homework': '📚',
    'read': '📖',
    'book': '📖',
    'laundry': '🧺',
    'clothes': '👕',
    'fold': '👕',
    'water': '💧',
    'garden': '🌱',
    'plant': '🌱',
    'toy': '🧸',
    'tidy': '🧹',
    'clean': '🧽',
    'sweep': '🧹',
    'vacuum': '🧹',
    'room': '🏰',
    'teeth': '🪥',
    'brush': '🪥',
    'bath': '🛁',
    'shower': '🚿',
    'cook': '🍳',
    'table': '🍴',
    'car': '🚗',
    'piano': '🎹',
    'practice': '🎵',
    'music': '🎵',
    'walk': '🥾',
    'shoe': '👟',
  };
  for (final e in map.entries) {
    if (t.contains(e.key)) return e.value;
  }
  return '🗡️';
}
