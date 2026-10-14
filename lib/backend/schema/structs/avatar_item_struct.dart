// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Avatar catalog item.
///
/// category: hair | outfit | hat | accessory | background | effect. buckCost
/// 0 = not for sale. milestoneType: empty | quest_count | streak_days |
/// perfect_week.
class AvatarItemStruct extends BaseStruct {
  AvatarItemStruct({
    /// AvatarItem.id
    String? id,

    /// AvatarItem.name
    String? name,

    /// AvatarItem.category
    String? category,

    /// AvatarItem.buckCost
    int? buckCost,

    /// AvatarItem.milestoneType
    String? milestoneType,

    /// AvatarItem.milestoneValue
    int? milestoneValue,

    /// AvatarItem.art
    String? art,
  })  : _id = id,
        _name = name,
        _category = category,
        _buckCost = buckCost,
        _milestoneType = milestoneType,
        _milestoneValue = milestoneValue,
        _art = art;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "buckCost" field.
  int? _buckCost;
  int get buckCost => _buckCost ?? 0;
  set buckCost(int? val) => _buckCost = val;

  void incrementBuckCost(int amount) => buckCost = buckCost + amount;

  bool hasBuckCost() => _buckCost != null;

  // "milestoneType" field.
  String? _milestoneType;
  String get milestoneType => _milestoneType ?? '';
  set milestoneType(String? val) => _milestoneType = val;

  bool hasMilestoneType() => _milestoneType != null;

  // "milestoneValue" field.
  int? _milestoneValue;
  int get milestoneValue => _milestoneValue ?? 0;
  set milestoneValue(int? val) => _milestoneValue = val;

  void incrementMilestoneValue(int amount) =>
      milestoneValue = milestoneValue + amount;

  bool hasMilestoneValue() => _milestoneValue != null;

  // "art" field.
  String? _art;
  String get art => _art ?? '';
  set art(String? val) => _art = val;

  bool hasArt() => _art != null;

  static AvatarItemStruct fromMap(Map<String, dynamic> data) =>
      AvatarItemStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        category: data['category'] as String?,
        buckCost: castToType<int>(data['buckCost']),
        milestoneType: data['milestoneType'] as String?,
        milestoneValue: castToType<int>(data['milestoneValue']),
        art: data['art'] as String?,
      );

  static AvatarItemStruct? maybeFromMap(dynamic data) => data is Map
      ? AvatarItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'category': _category,
        'buckCost': _buckCost,
        'milestoneType': _milestoneType,
        'milestoneValue': _milestoneValue,
        'art': _art,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'buckCost': serializeParam(
          _buckCost,
          ParamType.int,
        ),
        'milestoneType': serializeParam(
          _milestoneType,
          ParamType.String,
        ),
        'milestoneValue': serializeParam(
          _milestoneValue,
          ParamType.int,
        ),
        'art': serializeParam(
          _art,
          ParamType.String,
        ),
      }.withoutNulls;

  static AvatarItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvatarItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        buckCost: deserializeParam(
          data['buckCost'],
          ParamType.int,
          false,
        ),
        milestoneType: deserializeParam(
          data['milestoneType'],
          ParamType.String,
          false,
        ),
        milestoneValue: deserializeParam(
          data['milestoneValue'],
          ParamType.int,
          false,
        ),
        art: deserializeParam(
          data['art'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AvatarItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvatarItemStruct &&
        id == other.id &&
        name == other.name &&
        category == other.category &&
        buckCost == other.buckCost &&
        milestoneType == other.milestoneType &&
        milestoneValue == other.milestoneValue &&
        art == other.art;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, category, buckCost, milestoneType, milestoneValue, art]);
}

AvatarItemStruct createAvatarItemStruct({
  String? id,
  String? name,
  String? category,
  int? buckCost,
  String? milestoneType,
  int? milestoneValue,
  String? art,
}) =>
    AvatarItemStruct(
      id: id,
      name: name,
      category: category,
      buckCost: buckCost,
      milestoneType: milestoneType,
      milestoneValue: milestoneValue,
      art: art,
    );
