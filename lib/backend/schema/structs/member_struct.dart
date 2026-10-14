// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A parent or kid profile (role: parent | kid).
class MemberStruct extends BaseStruct {
  MemberStruct({
    /// Member.id
    String? id,

    /// Member.role
    String? role,

    /// Member.name
    String? name,

    /// Member.age
    int? age,

    /// Member.baseAvatar
    String? baseAvatar,

    /// Member.pin
    String? pin,
  })  : _id = id,
        _role = role,
        _name = name,
        _age = age,
        _baseAvatar = baseAvatar,
        _pin = pin;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "baseAvatar" field.
  String? _baseAvatar;
  String get baseAvatar => _baseAvatar ?? '';
  set baseAvatar(String? val) => _baseAvatar = val;

  bool hasBaseAvatar() => _baseAvatar != null;

  // "pin" field.
  String? _pin;
  String get pin => _pin ?? '';
  set pin(String? val) => _pin = val;

  bool hasPin() => _pin != null;

  static MemberStruct fromMap(Map<String, dynamic> data) => MemberStruct(
        id: data['id'] as String?,
        role: data['role'] as String?,
        name: data['name'] as String?,
        age: castToType<int>(data['age']),
        baseAvatar: data['baseAvatar'] as String?,
        pin: data['pin'] as String?,
      );

  static MemberStruct? maybeFromMap(dynamic data) =>
      data is Map ? MemberStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'role': _role,
        'name': _name,
        'age': _age,
        'baseAvatar': _baseAvatar,
        'pin': _pin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'baseAvatar': serializeParam(
          _baseAvatar,
          ParamType.String,
        ),
        'pin': serializeParam(
          _pin,
          ParamType.String,
        ),
      }.withoutNulls;

  static MemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      MemberStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        baseAvatar: deserializeParam(
          data['baseAvatar'],
          ParamType.String,
          false,
        ),
        pin: deserializeParam(
          data['pin'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MemberStruct &&
        id == other.id &&
        role == other.role &&
        name == other.name &&
        age == other.age &&
        baseAvatar == other.baseAvatar &&
        pin == other.pin;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, role, name, age, baseAvatar, pin]);
}

MemberStruct createMemberStruct({
  String? id,
  String? role,
  String? name,
  int? age,
  String? baseAvatar,
  String? pin,
}) =>
    MemberStruct(
      id: id,
      role: role,
      name: name,
      age: age,
      baseAvatar: baseAvatar,
      pin: pin,
    );
