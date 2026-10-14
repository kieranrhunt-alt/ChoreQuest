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

/// Hex color for a hue (0-359) on the dye spectrum.
String? spectrumHex(double? hue) {
  String hsl(double h, double s, double l) {
    final c = (1 - (2 * l - 1).abs()) * s;
    final hp = (h % 360) / 60;
    final x = c * (1 - ((hp % 2) - 1).abs());
    var r = 0.0, g = 0.0, b = 0.0;
    if (hp < 1) {
      r = c;
      g = x;
    } else if (hp < 2) {
      r = x;
      g = c;
    } else if (hp < 3) {
      g = c;
      b = x;
    } else if (hp < 4) {
      g = x;
      b = c;
    } else if (hp < 5) {
      r = x;
      b = c;
    } else {
      r = c;
      b = x;
    }
    final m = l - c / 2;
    String h2(double v) =>
        ((v + m) * 255).round().clamp(0, 255).toRadixString(16).padLeft(2, '0');
    return '#${h2(r)}${h2(g)}${h2(b)}'.toUpperCase();
  }

  return hsl(hue ?? 0, 0.62, 0.66);
}
