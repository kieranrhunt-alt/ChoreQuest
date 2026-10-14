// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A quest.
///
/// assigneeId empty = open to claim. Recurring quests are templates that
/// spawn independent instances. status: open | claimed | submitted | approved
/// | template.
class QuestStruct extends BaseStruct {
  QuestStruct({
    /// Quest.id
    String? id,

    /// Quest.title
    String? title,

    /// Quest.description
    String? description,

    /// Quest.buckValue
    int? buckValue,

    /// Quest.assigneeId
    String? assigneeId,

    /// Quest.claimedById
    String? claimedById,

    /// Quest.dueDate
    DateTime? dueDate,

    /// Quest.recurrence
    String? recurrence,

    /// Quest.requiresPhoto
    bool? requiresPhoto,

    /// Quest.status
    String? status,

    /// Quest.parentNote
    String? parentNote,

    /// Quest.isTemplate
    bool? isTemplate,

    /// Quest.templateId
    String? templateId,

    /// Quest.instanceKey
    String? instanceKey,

    /// Quest.photoUrl
    String? photoUrl,

    /// Quest.submittedAt
    DateTime? submittedAt,

    /// Quest.approvedAt
    DateTime? approvedAt,

    /// Quest.createdAt
    DateTime? createdAt,
  })  : _id = id,
        _title = title,
        _description = description,
        _buckValue = buckValue,
        _assigneeId = assigneeId,
        _claimedById = claimedById,
        _dueDate = dueDate,
        _recurrence = recurrence,
        _requiresPhoto = requiresPhoto,
        _status = status,
        _parentNote = parentNote,
        _isTemplate = isTemplate,
        _templateId = templateId,
        _instanceKey = instanceKey,
        _photoUrl = photoUrl,
        _submittedAt = submittedAt,
        _approvedAt = approvedAt,
        _createdAt = createdAt;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "buckValue" field.
  int? _buckValue;
  int get buckValue => _buckValue ?? 0;
  set buckValue(int? val) => _buckValue = val;

  void incrementBuckValue(int amount) => buckValue = buckValue + amount;

  bool hasBuckValue() => _buckValue != null;

  // "assigneeId" field.
  String? _assigneeId;
  String get assigneeId => _assigneeId ?? '';
  set assigneeId(String? val) => _assigneeId = val;

  bool hasAssigneeId() => _assigneeId != null;

  // "claimedById" field.
  String? _claimedById;
  String get claimedById => _claimedById ?? '';
  set claimedById(String? val) => _claimedById = val;

  bool hasClaimedById() => _claimedById != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  set dueDate(DateTime? val) => _dueDate = val;

  bool hasDueDate() => _dueDate != null;

  // "recurrence" field.
  String? _recurrence;
  String get recurrence => _recurrence ?? '';
  set recurrence(String? val) => _recurrence = val;

  bool hasRecurrence() => _recurrence != null;

  // "requiresPhoto" field.
  bool? _requiresPhoto;
  bool get requiresPhoto => _requiresPhoto ?? false;
  set requiresPhoto(bool? val) => _requiresPhoto = val;

  bool hasRequiresPhoto() => _requiresPhoto != null;

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

  // "isTemplate" field.
  bool? _isTemplate;
  bool get isTemplate => _isTemplate ?? false;
  set isTemplate(bool? val) => _isTemplate = val;

  bool hasIsTemplate() => _isTemplate != null;

  // "templateId" field.
  String? _templateId;
  String get templateId => _templateId ?? '';
  set templateId(String? val) => _templateId = val;

  bool hasTemplateId() => _templateId != null;

  // "instanceKey" field.
  String? _instanceKey;
  String get instanceKey => _instanceKey ?? '';
  set instanceKey(String? val) => _instanceKey = val;

  bool hasInstanceKey() => _instanceKey != null;

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

  // "approvedAt" field.
  DateTime? _approvedAt;
  DateTime? get approvedAt => _approvedAt;
  set approvedAt(DateTime? val) => _approvedAt = val;

  bool hasApprovedAt() => _approvedAt != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static QuestStruct fromMap(Map<String, dynamic> data) => QuestStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        buckValue: castToType<int>(data['buckValue']),
        assigneeId: data['assigneeId'] as String?,
        claimedById: data['claimedById'] as String?,
        dueDate: data['dueDate'] as DateTime?,
        recurrence: data['recurrence'] as String?,
        requiresPhoto: data['requiresPhoto'] as bool?,
        status: data['status'] as String?,
        parentNote: data['parentNote'] as String?,
        isTemplate: data['isTemplate'] as bool?,
        templateId: data['templateId'] as String?,
        instanceKey: data['instanceKey'] as String?,
        photoUrl: data['photoUrl'] as String?,
        submittedAt: data['submittedAt'] as DateTime?,
        approvedAt: data['approvedAt'] as DateTime?,
        createdAt: data['createdAt'] as DateTime?,
      );

  static QuestStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'description': _description,
        'buckValue': _buckValue,
        'assigneeId': _assigneeId,
        'claimedById': _claimedById,
        'dueDate': _dueDate,
        'recurrence': _recurrence,
        'requiresPhoto': _requiresPhoto,
        'status': _status,
        'parentNote': _parentNote,
        'isTemplate': _isTemplate,
        'templateId': _templateId,
        'instanceKey': _instanceKey,
        'photoUrl': _photoUrl,
        'submittedAt': _submittedAt,
        'approvedAt': _approvedAt,
        'createdAt': _createdAt,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'buckValue': serializeParam(
          _buckValue,
          ParamType.int,
        ),
        'assigneeId': serializeParam(
          _assigneeId,
          ParamType.String,
        ),
        'claimedById': serializeParam(
          _claimedById,
          ParamType.String,
        ),
        'dueDate': serializeParam(
          _dueDate,
          ParamType.DateTime,
        ),
        'recurrence': serializeParam(
          _recurrence,
          ParamType.String,
        ),
        'requiresPhoto': serializeParam(
          _requiresPhoto,
          ParamType.bool,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'parentNote': serializeParam(
          _parentNote,
          ParamType.String,
        ),
        'isTemplate': serializeParam(
          _isTemplate,
          ParamType.bool,
        ),
        'templateId': serializeParam(
          _templateId,
          ParamType.String,
        ),
        'instanceKey': serializeParam(
          _instanceKey,
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
        'approvedAt': serializeParam(
          _approvedAt,
          ParamType.DateTime,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static QuestStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        buckValue: deserializeParam(
          data['buckValue'],
          ParamType.int,
          false,
        ),
        assigneeId: deserializeParam(
          data['assigneeId'],
          ParamType.String,
          false,
        ),
        claimedById: deserializeParam(
          data['claimedById'],
          ParamType.String,
          false,
        ),
        dueDate: deserializeParam(
          data['dueDate'],
          ParamType.DateTime,
          false,
        ),
        recurrence: deserializeParam(
          data['recurrence'],
          ParamType.String,
          false,
        ),
        requiresPhoto: deserializeParam(
          data['requiresPhoto'],
          ParamType.bool,
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
        isTemplate: deserializeParam(
          data['isTemplate'],
          ParamType.bool,
          false,
        ),
        templateId: deserializeParam(
          data['templateId'],
          ParamType.String,
          false,
        ),
        instanceKey: deserializeParam(
          data['instanceKey'],
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
        approvedAt: deserializeParam(
          data['approvedAt'],
          ParamType.DateTime,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'QuestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestStruct &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        buckValue == other.buckValue &&
        assigneeId == other.assigneeId &&
        claimedById == other.claimedById &&
        dueDate == other.dueDate &&
        recurrence == other.recurrence &&
        requiresPhoto == other.requiresPhoto &&
        status == other.status &&
        parentNote == other.parentNote &&
        isTemplate == other.isTemplate &&
        templateId == other.templateId &&
        instanceKey == other.instanceKey &&
        photoUrl == other.photoUrl &&
        submittedAt == other.submittedAt &&
        approvedAt == other.approvedAt &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        description,
        buckValue,
        assigneeId,
        claimedById,
        dueDate,
        recurrence,
        requiresPhoto,
        status,
        parentNote,
        isTemplate,
        templateId,
        instanceKey,
        photoUrl,
        submittedAt,
        approvedAt,
        createdAt
      ]);
}

QuestStruct createQuestStruct({
  String? id,
  String? title,
  String? description,
  int? buckValue,
  String? assigneeId,
  String? claimedById,
  DateTime? dueDate,
  String? recurrence,
  bool? requiresPhoto,
  String? status,
  String? parentNote,
  bool? isTemplate,
  String? templateId,
  String? instanceKey,
  String? photoUrl,
  DateTime? submittedAt,
  DateTime? approvedAt,
  DateTime? createdAt,
}) =>
    QuestStruct(
      id: id,
      title: title,
      description: description,
      buckValue: buckValue,
      assigneeId: assigneeId,
      claimedById: claimedById,
      dueDate: dueDate,
      recurrence: recurrence,
      requiresPhoto: requiresPhoto,
      status: status,
      parentNote: parentNote,
      isTemplate: isTemplate,
      templateId: templateId,
      instanceKey: instanceKey,
      photoUrl: photoUrl,
      submittedAt: submittedAt,
      approvedAt: approvedAt,
      createdAt: createdAt,
    );
