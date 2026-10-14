// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A Reward Road surprise a hero has claimed (one per space per round).
class BoardClaimStruct extends BaseStruct {
  BoardClaimStruct({
    /// BoardClaim.id
    String? id,

    /// BoardClaim.kidId
    String? kidId,

    /// BoardClaim.rewardId
    String? rewardId,

    /// BoardClaim.round
    int? round,

    /// BoardClaim.space
    int? space,

    /// BoardClaim.claimedAt
    DateTime? claimedAt,
  })  : _id = id,
        _kidId = kidId,
        _rewardId = rewardId,
        _round = round,
        _space = space,
        _claimedAt = claimedAt;

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

  // "rewardId" field.
  String? _rewardId;
  String get rewardId => _rewardId ?? '';
  set rewardId(String? val) => _rewardId = val;

  bool hasRewardId() => _rewardId != null;

  // "round" field.
  int? _round;
  int get round => _round ?? 0;
  set round(int? val) => _round = val;

  void incrementRound(int amount) => round = round + amount;

  bool hasRound() => _round != null;

  // "space" field.
  int? _space;
  int get space => _space ?? 0;
  set space(int? val) => _space = val;

  void incrementSpace(int amount) => space = space + amount;

  bool hasSpace() => _space != null;

  // "claimedAt" field.
  DateTime? _claimedAt;
  DateTime? get claimedAt => _claimedAt;
  set claimedAt(DateTime? val) => _claimedAt = val;

  bool hasClaimedAt() => _claimedAt != null;

  static BoardClaimStruct fromMap(Map<String, dynamic> data) =>
      BoardClaimStruct(
        id: data['id'] as String?,
        kidId: data['kidId'] as String?,
        rewardId: data['rewardId'] as String?,
        round: castToType<int>(data['round']),
        space: castToType<int>(data['space']),
        claimedAt: data['claimedAt'] as DateTime?,
      );

  static BoardClaimStruct? maybeFromMap(dynamic data) => data is Map
      ? BoardClaimStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'kidId': _kidId,
        'rewardId': _rewardId,
        'round': _round,
        'space': _space,
        'claimedAt': _claimedAt,
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
        'rewardId': serializeParam(
          _rewardId,
          ParamType.String,
        ),
        'round': serializeParam(
          _round,
          ParamType.int,
        ),
        'space': serializeParam(
          _space,
          ParamType.int,
        ),
        'claimedAt': serializeParam(
          _claimedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static BoardClaimStruct fromSerializableMap(Map<String, dynamic> data) =>
      BoardClaimStruct(
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
        rewardId: deserializeParam(
          data['rewardId'],
          ParamType.String,
          false,
        ),
        round: deserializeParam(
          data['round'],
          ParamType.int,
          false,
        ),
        space: deserializeParam(
          data['space'],
          ParamType.int,
          false,
        ),
        claimedAt: deserializeParam(
          data['claimedAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'BoardClaimStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BoardClaimStruct &&
        id == other.id &&
        kidId == other.kidId &&
        rewardId == other.rewardId &&
        round == other.round &&
        space == other.space &&
        claimedAt == other.claimedAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, kidId, rewardId, round, space, claimedAt]);
}

BoardClaimStruct createBoardClaimStruct({
  String? id,
  String? kidId,
  String? rewardId,
  int? round,
  int? space,
  DateTime? claimedAt,
}) =>
    BoardClaimStruct(
      id: id,
      kidId: kidId,
      rewardId: rewardId,
      round: round,
      space: space,
      claimedAt: claimedAt,
    );
