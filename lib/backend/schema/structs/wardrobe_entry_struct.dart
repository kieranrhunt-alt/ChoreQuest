// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// An avatar item owned by a kid (unlockSource: purchased | milestone).
class WardrobeEntryStruct extends BaseStruct {
  WardrobeEntryStruct({
    /// WardrobeEntry.id
    String? id,

    /// WardrobeEntry.kidId
    String? kidId,

    /// WardrobeEntry.avatarItemId
    String? avatarItemId,

    /// WardrobeEntry.equipped
    bool? equipped,

    /// WardrobeEntry.unlockedAt
    DateTime? unlockedAt,

    /// WardrobeEntry.unlockSource
    String? unlockSource,
  })  : _id = id,
        _kidId = kidId,
        _avatarItemId = avatarItemId,
        _equipped = equipped,
        _unlockedAt = unlockedAt,
        _unlockSource = unlockSource;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "kidId" field.
  String? _kidId;
  String get kidId => _kidId ?? '';
  set kidId(String? val) => _kidId = val;

  bool hasKidId() => _kidId != null;

  // "avatarItemId" field.
  String? _avatarItemId;
  String get avatarItemId => _avatarItemId ?? '';
  set avatarItemId(String? val) => _avatarItemId = val;

  bool hasAvatarItemId() => _avatarItemId != null;

  // "equipped" field.
  bool? _equipped;
  bool get equipped => _equipped ?? false;
  set equipped(bool? val) => _equipped = val;

  bool hasEquipped() => _equipped != null;

  // "unlockedAt" field.
  DateTime? _unlockedAt;
  DateTime? get unlockedAt => _unlockedAt;
  set unlockedAt(DateTime? val) => _unlockedAt = val;

  bool hasUnlockedAt() => _unlockedAt != null;

  // "unlockSource" field.
  String? _unlockSource;
  String get unlockSource => _unlockSource ?? '';
  set unlockSource(String? val) => _unlockSource = val;

  bool hasUnlockSource() => _unlockSource != null;

  static WardrobeEntryStruct fromMap(Map<String, dynamic> data) =>
      WardrobeEntryStruct(
        id: data['id'] as String?,
        kidId: data['kidId'] as String?,
        avatarItemId: data['avatarItemId'] as String?,
        equipped: data['equipped'] as bool?,
        unlockedAt: data['unlockedAt'] as DateTime?,
        unlockSource: data['unlockSource'] as String?,
      );

  static WardrobeEntryStruct? maybeFromMap(dynamic data) => data is Map
      ? WardrobeEntryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'kidId': _kidId,
        'avatarItemId': _avatarItemId,
        'equipped': _equipped,
        'unlockedAt': _unlockedAt,
        'unlockSource': _unlockSource,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'kidId': serializeParam(
          _kidId,
          ParamType.String,
        ),
        'avatarItemId': serializeParam(
          _avatarItemId,
          ParamType.String,
        ),
        'equipped': serializeParam(
          _equipped,
          ParamType.bool,
        ),
        'unlockedAt': serializeParam(
          _unlockedAt,
          ParamType.DateTime,
        ),
        'unlockSource': serializeParam(
          _unlockSource,
          ParamType.String,
        ),
      }.withoutNulls;

  static WardrobeEntryStruct fromSerializableMap(Map<String, dynamic> data) =>
      WardrobeEntryStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        kidId: deserializeParam(
          data['kidId'],
          ParamType.String,
          false,
        ),
        avatarItemId: deserializeParam(
          data['avatarItemId'],
          ParamType.String,
          false,
        ),
        equipped: deserializeParam(
          data['equipped'],
          ParamType.bool,
          false,
        ),
        unlockedAt: deserializeParam(
          data['unlockedAt'],
          ParamType.DateTime,
          false,
        ),
        unlockSource: deserializeParam(
          data['unlockSource'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WardrobeEntryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WardrobeEntryStruct &&
        id == other.id &&
        kidId == other.kidId &&
        avatarItemId == other.avatarItemId &&
        equipped == other.equipped &&
        unlockedAt == other.unlockedAt &&
        unlockSource == other.unlockSource;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, kidId, avatarItemId, equipped, unlockedAt, unlockSource]);
}

WardrobeEntryStruct createWardrobeEntryStruct({
  String? id,
  String? kidId,
  String? avatarItemId,
  bool? equipped,
  DateTime? unlockedAt,
  String? unlockSource,
}) =>
    WardrobeEntryStruct(
      id: id,
      kidId: kidId,
      avatarItemId: avatarItemId,
      equipped: equipped,
      unlockedAt: unlockedAt,
      unlockSource: unlockSource,
    );
