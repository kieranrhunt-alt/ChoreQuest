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

/// Replaces an empty or pre-squishy catalog with the starter squishy catalog.
List<AvatarItemStruct>? upgradeCatalog(List<AvatarItemStruct>? items) {
  AvatarItemStruct it(String id, String name, String cat, int cost, String mt,
          int mv, String art) =>
      AvatarItemStruct(
          id: id,
          name: name,
          category: cat,
          buckCost: cost,
          milestoneType: mt,
          milestoneValue: mv,
          art: art);
  final starter = <AvatarItemStruct>[
    // Squishy species (rare friends to unlock)
    it('sq_dragon', 'Baby Dragon', 'species', 0, 'quest_count', 10, 'dragon'),
    it('sq_unicorn', 'Moonlight Unicorn', 'species', 40, '', 0, 'unicorn'),
    it('sq_axolotl', 'Royal Axolotl', 'species', 25, '', 0, 'axolotl'),
    // Body colors
    it('c_purple', 'Royal Purple', 'color', 6, '', 0, '#8E6CEF'),
    it('c_green', 'Dragon Green', 'color', 6, '', 0, '#5CC98A'),
    it('c_ruby', 'Ruby Red', 'color', 6, '', 0, '#F2677B'),
    it('c_ocean', 'Ocean Blue', 'color', 6, '', 0, '#6FB7F2'),
    it('c_sun', 'Sunshine', 'color', 6, '', 0, '#FFD45C'),
    it('c_midnight', 'Midnight', 'color', 10, '', 0, '#4B4E8C'),
    it('c_crystal', 'Crystal', 'color', 35, '', 0, 'crystal'),
    it('c_rainbow', 'Rainbow', 'color', 50, '', 0, 'rainbow'),
    it('c_galaxy', 'Galaxy', 'color', 0, 'perfect_week', 1, 'galaxy'),
    it('c_gold', 'Solid Gold', 'color', 60, 'streak_days', 7, 'gold'),
    // Textures
    it('t_dots', 'Polka Dots', 'texture', 4, '', 0, 'dots'),
    it('t_stripes', 'Candy Stripes', 'texture', 4, '', 0, 'stripes'),
    it('t_hearts', 'Sweethearts', 'texture', 5, '', 0, 'hearts'),
    it('t_stars', 'Starlight', 'texture', 5, '', 0, 'stars'),
    it('t_checker', 'Royal Checkers', 'texture', 6, '', 0, 'checker'),
    it('t_fuzzy', 'Extra Fuzzy', 'texture', 8, '', 0, 'fuzzy'),
    it('t_glitter', 'Glitter', 'texture', 12, '', 0, 'sparkle'),
    it('t_scales', 'Dragon Scales', 'texture', 0, 'quest_count', 5, 'scales'),
    // Fill-ins (belly + inner ears)
    it('f_mint', 'Mint Fill', 'fill', 3, '', 0, '#CFF5E1'),
    it('f_pink', 'Bubblegum Fill', 'fill', 3, '', 0, '#FFC7DD'),
    it('f_sky', 'Sky Fill', 'fill', 3, '', 0, '#CDE8FF'),
    it('f_starry', 'Starry Night Fill', 'fill', 12, '', 0, 'starry'),
    it('f_gold', 'Golden Fill', 'fill', 15, '', 0, 'gold'),
    it('f_rainbow', 'Rainbow Fill', 'fill', 0, 'streak_days', 3, 'rainbow'),
    // Headgear
    it('h_flowers', 'Flower Crown', 'hat', 5, '', 0, 'flowers'),
    it('h_tiara', 'Princess Tiara', 'hat', 8, '', 0, 'tiara'),
    it('h_wizard', 'Wizard Hat', 'hat', 8, '', 0, 'wizard'),
    it('h_helm', 'Knight Helm', 'hat', 10, '', 0, 'helm'),
    it('h_horns', 'Dragon Horns', 'hat', 0, 'quest_count', 3, 'horns'),
    it('h_dragonhelm', 'Dragon Helm', 'hat', 0, 'quest_count', 10,
        'dragonhelm'),
    it('h_crown', 'Royal Crown', 'hat', 25, 'streak_days', 7, 'crown'),
    // Gear
    it('g_wand', 'Magic Wand', 'gear', 6, '', 0, 'wand'),
    it('g_sword', 'Knight Sword', 'gear', 8, '', 0, 'sword'),
    it('g_shield', 'Castle Shield', 'gear', 8, '', 0, 'shield'),
    it('g_cape', 'Royal Cape', 'gear', 12, '', 0, 'cape'),
    // Realms (backgrounds)
    it('b_meadow', 'Sunny Meadow', 'background', 4, '', 0, 'meadow'),
    it('b_castle', 'Castle Gates', 'background', 5, '', 0, 'castle'),
    it('b_rainbow', 'Rainbow Sky', 'background', 6, '', 0, 'rainbow'),
    it('b_starry', 'Starry Night', 'background', 8, '', 0, 'starry'),
    it('b_throne', 'Throne Room', 'background', 10, '', 0, 'throne'),
    it('b_lair', "Dragon's Lair", 'background', 15, '', 0, 'dragonlair'),
    // Magic effects
    it('e_bubbles', 'Bubbles', 'effect', 4, '', 0, 'bubbles'),
    it('e_sparkles', 'Sparkles', 'effect', 4, '', 0, 'sparkles'),
    it('e_hearts', 'Floating Hearts', 'effect', 5, '', 0, 'hearts'),
    it('e_orbit', 'Orbiting Stars', 'effect', 10, '', 0, 'orbit'),
    it('e_glow', 'Golden Glow', 'effect', 20, '', 0, 'glow'),
    it('e_flames', 'Flame Aura', 'effect', 0, 'streak_days', 3, 'flames'),
  ];
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

  starter.addAll([
    it('h_jester', 'Jester Hat', 'hat', 8, '', 0, 'jester'),
    it('h_circlet', "Prince's Circlet", 'hat', 8, '', 0, 'circlet'),
    it('k_dye', 'Rainbow Dye Kit', 'kit', 30, '', 0, 'dye'),
  ]);
  const spectrumNames = [
    'Cherry',
    'Scarlet',
    'Coral',
    'Tangerine',
    'Apricot',
    'Marigold',
    'Lemon',
    'Chartreuse',
    'Lime',
    'Clover',
    'Emerald',
    'Jade',
    'Mint',
    'Teal',
    'Aqua',
    'Sky',
    'Cornflower',
    'Sapphire',
    'Indigo',
    'Violet',
    'Grape',
    'Orchid',
    'Magenta',
    'Rose'
  ];
  for (var i = 0; i < 24; i++) {
    starter.add(it('sp_$i', '${spectrumNames[i]} Dye', 'color', 5, '', 0,
        hsl(i * 15.0, 0.62, 0.66)));
  }

  const cats = {
    'species',
    'color',
    'texture',
    'fill',
    'hat',
    'gear',
    'background',
    'effect',
    'kit'
  };
  final list = List<AvatarItemStruct>.from(items ?? <AvatarItemStruct>[]);
  if (list.isEmpty || list.any((i) => !cats.contains(i.category)))
    return addHolidayItems(starter);
  final have = list.map((i) => i.id).toSet();
  if (!have.contains('k_dye') && !have.contains('sp_0')) {
    for (final s in starter) {
      if (!have.contains(s.id) &&
          (s.id.startsWith('sp_') ||
              s.id == 'h_jester' ||
              s.id == 'h_circlet' ||
              s.id == 'k_dye')) list.add(s);
    }
  }
  return addHolidayItems(list);
}
