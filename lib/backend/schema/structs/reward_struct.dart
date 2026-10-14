// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A parent-created reward in the shop.
class RewardStruct extends BaseStruct {
  RewardStruct({
    /// Reward.id
    String? id,

    /// Reward.title
    String? title,

    /// Reward.buckCost
    int? buckCost,

    /// Reward.description
    String? description,

    /// Reward.icon
    String? icon,
  })  : _id = id,
        _title = title,
        _buckCost = buckCost,
        _description = description,
        _icon = icon;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "buckCost" field.
  int? _buckCost;
  int get buckCost => _buckCost ?? 0;
  set buckCost(int? val) => _buckCost = val;

  void incrementBuckCost(int amount) => buckCost = buckCost + amount;

  bool hasBuckCost() => _buckCost != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static RewardStruct fromMap(Map<String, dynamic> data) => RewardStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        buckCost: castToType<int>(data['buckCost']),
        description: data['description'] as String?,
        icon: data['icon'] as String?,
      );

  static RewardStruct? maybeFromMap(dynamic data) =>
      data is Map ? RewardStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'buckCost': _buckCost,
        'description': _description,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'buckCost': serializeParam(
          _buckCost,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static RewardStruct fromSerializableMap(Map<String, dynamic> data) =>
      RewardStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        buckCost: deserializeParam(
          data['buckCost'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RewardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RewardStruct &&
        id == other.id &&
        title == other.title &&
        buckCost == other.buckCost &&
        description == other.description &&
        icon == other.icon;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, title, buckCost, description, icon]);
}

RewardStruct createRewardStruct({
  String? id,
  String? title,
  int? buckCost,
  String? description,
  String? icon,
}) =>
    RewardStruct(
      id: id,
      title: title,
      buckCost: buckCost,
      description: description,
      icon: icon,
    );
