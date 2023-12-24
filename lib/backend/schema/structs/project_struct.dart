// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectStruct extends BaseStruct {
  ProjectStruct({
    String? id,
    String? name,
    String? description,
    int? reminderValue,
    String? reminderUnit,
    DateTime? createdAt,
    DateTime? lastTimeNotificationSent,
  })  : _id = id,
        _name = name,
        _description = description,
        _reminderValue = reminderValue,
        _reminderUnit = reminderUnit,
        _createdAt = createdAt,
        _lastTimeNotificationSent = lastTimeNotificationSent;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "reminder_value" field.
  int? _reminderValue;
  int get reminderValue => _reminderValue ?? 0;
  set reminderValue(int? val) => _reminderValue = val;
  void incrementReminderValue(int amount) =>
      _reminderValue = reminderValue + amount;
  bool hasReminderValue() => _reminderValue != null;

  // "reminder_unit" field.
  String? _reminderUnit;
  String get reminderUnit => _reminderUnit ?? '';
  set reminderUnit(String? val) => _reminderUnit = val;
  bool hasReminderUnit() => _reminderUnit != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "last_time_notification_sent" field.
  DateTime? _lastTimeNotificationSent;
  DateTime? get lastTimeNotificationSent => _lastTimeNotificationSent;
  set lastTimeNotificationSent(DateTime? val) =>
      _lastTimeNotificationSent = val;
  bool hasLastTimeNotificationSent() => _lastTimeNotificationSent != null;

  static ProjectStruct fromMap(Map<String, dynamic> data) => ProjectStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        reminderValue: castToType<int>(data['reminder_value']),
        reminderUnit: data['reminder_unit'] as String?,
        createdAt: data['created_at'] as DateTime?,
        lastTimeNotificationSent:
            data['last_time_notification_sent'] as DateTime?,
      );

  static ProjectStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProjectStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'reminder_value': _reminderValue,
        'reminder_unit': _reminderUnit,
        'created_at': _createdAt,
        'last_time_notification_sent': _lastTimeNotificationSent,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'reminder_value': serializeParam(
          _reminderValue,
          ParamType.int,
        ),
        'reminder_unit': serializeParam(
          _reminderUnit,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'last_time_notification_sent': serializeParam(
          _lastTimeNotificationSent,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ProjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        reminderValue: deserializeParam(
          data['reminder_value'],
          ParamType.int,
          false,
        ),
        reminderUnit: deserializeParam(
          data['reminder_unit'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        lastTimeNotificationSent: deserializeParam(
          data['last_time_notification_sent'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ProjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        reminderValue == other.reminderValue &&
        reminderUnit == other.reminderUnit &&
        createdAt == other.createdAt &&
        lastTimeNotificationSent == other.lastTimeNotificationSent;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        description,
        reminderValue,
        reminderUnit,
        createdAt,
        lastTimeNotificationSent
      ]);
}

ProjectStruct createProjectStruct({
  String? id,
  String? name,
  String? description,
  int? reminderValue,
  String? reminderUnit,
  DateTime? createdAt,
  DateTime? lastTimeNotificationSent,
}) =>
    ProjectStruct(
      id: id,
      name: name,
      description: description,
      reminderValue: reminderValue,
      reminderUnit: reminderUnit,
      createdAt: createdAt,
      lastTimeNotificationSent: lastTimeNotificationSent,
    );
