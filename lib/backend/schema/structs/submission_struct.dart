// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A kid marking a quest complete for parent review (status: pending |
/// approved | denied).
class SubmissionStruct extends BaseStruct {
  SubmissionStruct({
    /// Submission.id
    String? id,

    /// Submission.questId
    String? questId,

    /// Submission.kidId
    String? kidId,

    /// Submission.photoUrl
    String? photoUrl,

    /// Submission.submittedAt
    DateTime? submittedAt,

    /// Submission.status
    String? status,

    /// Submission.parentNote
    String? parentNote,
  })  : _id = id,
        _questId = questId,
        _kidId = kidId,
        _photoUrl = photoUrl,
        _submittedAt = submittedAt,
        _status = status,
        _parentNote = parentNote;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "questId" field.
  String? _questId;
  String get questId => _questId ?? '';
  set questId(String? val) => _questId = val;

  bool hasQuestId() => _questId != null;

  // "kidId" field.
  String? _kidId;
  String get kidId => _kidId ?? '';
  set kidId(String? val) => _kidId = val;

  bool hasKidId() => _kidId != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "submittedAt" field.
  DateTime? _submittedAt;
  DateTime? get submittedAt => _submittedAt;
  set submittedAt(DateTime? val) => _submittedAt = val;

  bool hasSubmittedAt() => _submittedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "parentNote" field.
  String? _parentNote;
  String get parentNote => _parentNote ?? '';
  set parentNote(String? val) => _parentNote = val;

  bool hasParentNote() => _parentNote != null;

  static SubmissionStruct fromMap(Map<String, dynamic> data) =>
      SubmissionStruct(
        id: data['id'] as String?,
        questId: data['questId'] as String?,
        kidId: data['kidId'] as String?,
        photoUrl: data['photoUrl'] as String?,
        submittedAt: data['submittedAt'] as DateTime?,
        status: data['status'] as String?,
        parentNote: data['parentNote'] as String?,
      );

  static SubmissionStruct? maybeFromMap(dynamic data) => data is Map
      ? SubmissionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'questId': _questId,
        'kidId': _kidId,
        'photoUrl': _photoUrl,
        'submittedAt': _submittedAt,
        'status': _status,
        'parentNote': _parentNote,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'questId': serializeParam(
          _questId,
          ParamType.String,
        ),
        'kidId': serializeParam(
          _kidId,
          ParamType.String,
        ),
        'photoUrl': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'submittedAt': serializeParam(
          _submittedAt,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'parentNote': serializeParam(
          _parentNote,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubmissionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubmissionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        questId: deserializeParam(
          data['questId'],
          ParamType.String,
          false,
        ),
        kidId: deserializeParam(
          data['kidId'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photoUrl'],
          ParamType.String,
          false,
        ),
        submittedAt: deserializeParam(
          data['submittedAt'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        parentNote: deserializeParam(
          data['parentNote'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SubmissionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubmissionStruct &&
        id == other.id &&
        questId == other.questId &&
        kidId == other.kidId &&
        photoUrl == other.photoUrl &&
        submittedAt == other.submittedAt &&
        status == other.status &&
        parentNote == other.parentNote;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, questId, kidId, photoUrl, submittedAt, status, parentNote]);
}

SubmissionStruct createSubmissionStruct({
  String? id,
  String? questId,
  String? kidId,
  String? photoUrl,
  DateTime? submittedAt,
  String? status,
  String? parentNote,
}) =>
    SubmissionStruct(
      id: id,
      questId: questId,
      kidId: kidId,
      photoUrl: photoUrl,
      submittedAt: submittedAt,
      status: status,
      parentNote: parentNote,
    );
