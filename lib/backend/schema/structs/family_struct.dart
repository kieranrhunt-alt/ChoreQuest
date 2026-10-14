// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// The family that owns every record on this device.
class FamilyStruct extends BaseStruct {
  FamilyStruct({
    /// Family.id
    String? id,

    /// Family.name
    String? name,
  })  : _id = id,
        _name = name;

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

  static FamilyStruct fromMap(Map<String, dynamic> data) => FamilyStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static FamilyStruct? maybeFromMap(dynamic data) =>
      data is Map ? FamilyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
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
      }.withoutNulls;

  static FamilyStruct fromSerializableMap(Map<String, dynamic> data) =>
      FamilyStruct(
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
      );

  @override
  String toString() => 'FamilyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FamilyStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

FamilyStruct createFamilyStruct({
  String? id,
  String? name,
}) =>
    FamilyStruct(
      id: id,
      name: name,
    );
