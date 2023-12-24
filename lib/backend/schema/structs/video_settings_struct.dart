// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoSettingsStruct extends BaseStruct {
  VideoSettingsStruct({
    int? speed,
  }) : _speed = speed;

  // "speed" field.
  int? _speed;
  int get speed => _speed ?? 0;
  set speed(int? val) => _speed = val;
  void incrementSpeed(int amount) => _speed = speed + amount;
  bool hasSpeed() => _speed != null;

  static VideoSettingsStruct fromMap(Map<String, dynamic> data) =>
      VideoSettingsStruct(
        speed: castToType<int>(data['speed']),
      );

  static VideoSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'speed': _speed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'speed': serializeParam(
          _speed,
          ParamType.int,
        ),
      }.withoutNulls;

  static VideoSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoSettingsStruct(
        speed: deserializeParam(
          data['speed'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VideoSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoSettingsStruct && speed == other.speed;
  }

  @override
  int get hashCode => const ListEquality().hash([speed]);
}

VideoSettingsStruct createVideoSettingsStruct({
  int? speed,
}) =>
    VideoSettingsStruct(
      speed: speed,
    );
