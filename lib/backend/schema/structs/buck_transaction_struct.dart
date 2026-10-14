// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// One signed Parent Bucks ledger entry (+ earns, - spends, 0 milestone).
class BuckTransactionStruct extends BaseStruct {
  BuckTransactionStruct({
    /// BuckTransaction.id
    String? id,

    /// BuckTransaction.kidId
    String? kidId,

    /// BuckTransaction.amount
    int? amount,

    /// BuckTransaction.reason
    String? reason,

    /// BuckTransaction.timestamp
    DateTime? timestamp,
  })  : _id = id,
        _kidId = kidId,
        _amount = amount,
        _reason = reason,
        _timestamp = timestamp;

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

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  set reason(String? val) => _reason = val;

  bool hasReason() => _reason != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static BuckTransactionStruct fromMap(Map<String, dynamic> data) =>
      BuckTransactionStruct(
        id: data['id'] as String?,
        kidId: data['kidId'] as String?,
        amount: castToType<int>(data['amount']),
        reason: data['reason'] as String?,
        timestamp: data['timestamp'] as DateTime?,
      );

  static BuckTransactionStruct? maybeFromMap(dynamic data) => data is Map
      ? BuckTransactionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'kidId': _kidId,
        'amount': _amount,
        'reason': _reason,
        'timestamp': _timestamp,
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
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'reason': serializeParam(
          _reason,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static BuckTransactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      BuckTransactionStruct(
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
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        reason: deserializeParam(
          data['reason'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'BuckTransactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuckTransactionStruct &&
        id == other.id &&
        kidId == other.kidId &&
        amount == other.amount &&
        reason == other.reason &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, kidId, amount, reason, timestamp]);
}

BuckTransactionStruct createBuckTransactionStruct({
  String? id,
  String? kidId,
  int? amount,
  String? reason,
  DateTime? timestamp,
}) =>
    BuckTransactionStruct(
      id: id,
      kidId: kidId,
      amount: amount,
      reason: reason,
      timestamp: timestamp,
    );
