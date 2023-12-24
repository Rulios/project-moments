// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MomentsStruct extends BaseStruct {
  MomentsStruct({
    String? id,
    List<String>? belongsTo,
    DateTime? createdAt,
    String? path,
  })  : _id = id,
        _belongsTo = belongsTo,
        _createdAt = createdAt,
        _path = path;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "belongs_to" field.
  List<String>? _belongsTo;
  List<String> get belongsTo => _belongsTo ?? const [];
  set belongsTo(List<String>? val) => _belongsTo = val;
  void updateBelongsTo(Function(List<String>) updateFn) =>
      updateFn(_belongsTo ??= []);
  bool hasBelongsTo() => _belongsTo != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;
  bool hasPath() => _path != null;

  static MomentsStruct fromMap(Map<String, dynamic> data) => MomentsStruct(
        id: data['id'] as String?,
        belongsTo: getDataList(data['belongs_to']),
        createdAt: data['created_at'] as DateTime?,
        path: data['path'] as String?,
      );

  static MomentsStruct? maybeFromMap(dynamic data) =>
      data is Map ? MomentsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'belongs_to': _belongsTo,
        'created_at': _createdAt,
        'path': _path,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'belongs_to': serializeParam(
          _belongsTo,
          ParamType.String,
          true,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
      }.withoutNulls;

  static MomentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MomentsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        belongsTo: deserializeParam<String>(
          data['belongs_to'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MomentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MomentsStruct &&
        id == other.id &&
        listEquality.equals(belongsTo, other.belongsTo) &&
        createdAt == other.createdAt &&
        path == other.path;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, belongsTo, createdAt, path]);
}

MomentsStruct createMomentsStruct({
  String? id,
  DateTime? createdAt,
  String? path,
}) =>
    MomentsStruct(
      id: id,
      createdAt: createdAt,
      path: path,
    );
