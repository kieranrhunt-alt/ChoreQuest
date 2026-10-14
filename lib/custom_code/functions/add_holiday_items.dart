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

/// Adds the holiday squishie collection (ids hol_*) to a catalog that does
/// not have it yet.
List<AvatarItemStruct>? addHolidayItems(List<AvatarItemStruct>? items) {
  final list = List<AvatarItemStruct>.from(items ?? <AvatarItemStruct>[]);
  if (list.isEmpty || list.any((i) => i.id.startsWith('hol_'))) return list;
  AvatarItemStruct it(
          String id, String name, String cat, int cost, String art) =>
      AvatarItemStruct(
          id: id,
          name: name,
          category: cat,
          buckCost: cost,
          milestoneType: '',
          milestoneValue: 0,
          art: art);
  list.addAll([
    // Head
    it('hol_santa', '🎄 Santa Hat', 'hat', 12, 'santa'),
    it('hol_antlers', '🦌 Reindeer Antlers', 'hat', 10, 'antlers'),
    it('hol_witch', '🎃 Witch Hat', 'hat', 10, 'witch'),
    it('hol_bunnyears', '🐣 Easter Bunny Ears', 'hat', 8, 'bunnyears'),
    it('hol_leprechaun', '☘️ Leprechaun Hat', 'hat', 8, 'leprechaun'),
    it('hol_partyhat', '🎆 New Year Party Hat', 'hat', 8, 'partyhat'),
    it('hol_hearthb', '💘 Valentine Heart Band', 'hat', 8, 'hearthb'),
    it('hol_pilgrim', '🦃 Thanksgiving Hat', 'hat', 8, 'pilgrim'),
    it('hol_starhat', '🎇 Fourth of July Hat', 'hat', 8, 'starhat'),
    // Arm
    it('hol_candycane', '🍬 Candy Cane', 'gear', 6, 'candycane'),
    it('hol_present', '🎁 Gift Box', 'gear', 8, 'present'),
    it('hol_pumpkin', "🎃 Jack-o'-Lantern", 'gear', 8, 'pumpkin'),
    it('hol_heartballoon', '💘 Heart Balloon', 'gear', 6, 'heartballoon'),
    it('hol_eggbasket', '🐣 Egg Basket', 'gear', 6, 'eggbasket'),
    it('hol_sparkler', '🎆 Sparkler', 'gear', 6, 'sparkler'),
    // Aura
    it('hol_snow', '❄️ Snowfall Aura', 'effect', 10, 'snow'),
    it('hol_bats', '🦇 Spooky Bats Aura', 'effect', 10, 'bats'),
    it('hol_leaves', '🍂 Autumn Leaves Aura', 'effect', 8, 'leaves'),
    it('hol_confetti', '🎉 Confetti Aura', 'effect', 8, 'confetti'),
    it('hol_fireworks', '🎆 Fireworks Aura', 'effect', 12, 'fireworks'),
    it('hol_clovers', '🍀 Lucky Clover Aura', 'effect', 8, 'clovers'),
    // Texture
    it('hol_candystripe', '🍬 Candy Cane Stripes', 'texture', 8, 'candystripe'),
    it('hol_snowflakes', '❄️ Snowflake Print', 'texture', 8, 'snowflakes'),
    it('hol_pumpkinribs', '🎃 Pumpkin Patch', 'texture', 8, 'pumpkinribs'),
    it('hol_eastereggs', '🥚 Easter Egg Zigzag', 'texture', 8, 'eastereggs'),
    it('hol_shamrocks', '☘️ Shamrock Print', 'texture', 8, 'shamrocks'),
    it('hol_starsstripes', '🎇 Stars & Stripes', 'texture', 8, 'starsstripes'),
    // Color
    it('hol_c_holly', '🎄 Holly Green', 'color', 6, '#2FA05A'),
    it('hol_c_santa', '🎅 Santa Red', 'color', 6, '#E23D4B'),
    it('hol_c_frost', '❄️ Frosty Blue', 'color', 6, '#BFE6FF'),
    it('hol_c_pumpkin', '🎃 Pumpkin Orange', 'color', 6, '#FF8C2E'),
    it('hol_c_spooky', '👻 Spooky Purple', 'color', 6, '#6B3FA0'),
    it('hol_c_lilac', '🐣 Easter Lilac', 'color', 6, '#CDB4FF'),
    it('hol_c_valentine', '💘 Valentine Pink', 'color', 6, '#FF7FAE'),
    // Filler
    it('hol_f_eggnog', '🥛 Eggnog Filler', 'fill', 4, '#FFF3D6'),
    it('hol_f_cocoa', '☕ Hot Cocoa Filler', 'fill', 4, '#C98B5E'),
    it('hol_f_candyheart', '💗 Candy Heart Filler', 'fill', 4, '#FFD1E0'),
    it('hol_f_pumpkinspice', '🥧 Pumpkin Spice Filler', 'fill', 4, '#F5B26B'),
  ]);
  return list;
}
