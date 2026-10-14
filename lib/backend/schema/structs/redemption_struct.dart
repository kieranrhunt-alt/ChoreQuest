// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A kid request to redeem a reward or buy an avatar item (targetType: reward
/// | avatar_item; status: pending | approved | declined).
class RedemptionStruct extends BaseStruct {
  RedemptionStruct({
    /// Redemption.id
    String? id,

    /// Redemption.targetType
    String? targetType,

    /// Redemption.rewardId
    String? rewardId,

    /// Redemption.avatarItemId
    String? avatarItemId,

    /// Redemption.kidId
    String? kidId,

    /// Redemption.status
    String? status,

    /// Redemption.timestamp
    DateTime? timestamp,

    /// Redemption.title
    String? title,

    /// Redemption.cost
    int? cost,
  })  : _id = id,
        _targetType = targetType,
        _rewardId = rewardId,
        _avatarItemId = avatarItemId,
        _kidId = kidId,
        _status = status,
        _timestamp = timestamp,
        _title = title,
        _cost = cost;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "targetType" field.
  String? _targetType;
  String get targetType => _targetType ?? '';
  set targetType(String? val) => _targetType = val;

  bool hasTargetType() => _targetType != null;

  // "rewardId" field.
  String? _rewardId;
  String get rewardId => _rewardId ?? '';
  set rewardId(String? val) => _rewardId = val;

  bool hasRewardId() => _rewardId != null;

  // "avatarItemId" field.
  String? _avatarItemId;
  String get avatarItemId => _avatarItemId ?? '';
  set avatarItemId(String? val) => _avatarItemId = val;

  bool hasAvatarItemId() => _avatarItemId != null;

  // "kidId" field.
  String? _kidId;
  String get kidId => _kidId ?? '';
  set kidId(String? val) => _kidId = val;

  bool hasKidId() => _kidId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  set cost(int? val) => _cost = val;

  void incrementCost(int amount) => cost = cost + amount;

  bool hasCost() => _cost != null;

  static RedemptionStruct fromMap(Map<String, dynamic> data) =>
      RedemptionStruct(
        id: data['id'] as String?,
        targetType: data['targetType'] as String?,
        rewardId: data['rewardId'] as String?,
        avatarItemId: data['avatarItemId'] as String?,
        kidId: data['kidId'] as String?,
        status: data['status'] as String?,
        timestamp: data['timestamp'] as DateTime?,
        title: data['title'] as String?,
        cost: castToType<int>(data['cost']),
      );

  static RedemptionStruct? maybeFromMap(dynamic data) => data is Map
      ? RedemptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'targetType': _targetType,
        'rewardId': _rewardId,
        'avatarItemId': _avatarItemId,
        'kidId': _kidId,
        'status': _status,
        'timestamp': _timestamp,
        'title': _title,
        'cost': _cost,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'targetType': serializeParam(
          _targetType,
          ParamType.String,
        ),
        'rewardId': serializeParam(
          _rewardId,
          ParamType.String,
        ),
        'avatarItemId': serializeParam(
          _avatarItemId,
          ParamType.String,
        ),
        'kidId': serializeParam(
          _kidId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'cost': serializeParam(
          _cost,
          ParamType.int,
        ),
      }.withoutNulls;

  static RedemptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      RedemptionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        targetType: deserializeParam(
          data['targetType'],
          ParamType.String,
          false,
        ),
        rewardId: deserializeParam(
          data['rewardId'],
          ParamType.String,
          false,
        ),
        avatarItemId: deserializeParam(
          data['avatarItemId'],
          ParamType.String,
          false,
        ),
        kidId: deserializeParam(
          data['kidId'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        cost: deserializeParam(
          data['cost'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RedemptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RedemptionStruct &&
        id == other.id &&
        targetType == other.targetType &&
        rewardId == other.rewardId &&
        avatarItemId == other.avatarItemId &&
        kidId == other.kidId &&
        status == other.status &&
        timestamp == other.timestamp &&
        title == other.title &&
        cost == other.cost;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        targetType,
        rewardId,
        avatarItemId,
        kidId,
        status,
        timestamp,
        title,
        cost
      ]);
}

RedemptionStruct createRedemptionStruct({
  String? id,
  String? targetType,
  String? rewardId,
  String? avatarItemId,
  String? kidId,
  String? status,
  DateTime? timestamp,
  String? title,
  int? cost,
}) =>
    RedemptionStruct(
      id: id,
      targetType: targetType,
      rewardId: rewardId,
      avatarItemId: avatarItemId,
      kidId: kidId,
      status: status,
      timestamp: timestamp,
      title: title,
      cost: cost,
    );
