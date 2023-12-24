import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _username = prefs.getString('ff_username') ?? _username;
    });
    _safeInit(() {
      _projects = prefs
              .getStringList('ff_projects')
              ?.map((x) {
                try {
                  return ProjectStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _projects;
    });
    _safeInit(() {
      _moments = prefs
              .getStringList('ff_moments')
              ?.map((x) {
                try {
                  return MomentsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _moments;
    });
    _safeInit(() {
      _isAppFirstTime = prefs.getBool('ff_isAppFirstTime') ?? _isAppFirstTime;
    });
    _safeInit(() {
      _notificationId = prefs.getInt('ff_notificationId') ?? _notificationId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _username = '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
    prefs.setString('ff_username', _value);
  }

  List<ProjectStruct> _projects = [];
  List<ProjectStruct> get projects => _projects;
  set projects(List<ProjectStruct> _value) {
    _projects = _value;
    prefs.setStringList(
        'ff_projects', _value.map((x) => x.serialize()).toList());
  }

  void addToProjects(ProjectStruct _value) {
    _projects.add(_value);
    prefs.setStringList(
        'ff_projects', _projects.map((x) => x.serialize()).toList());
  }

  void removeFromProjects(ProjectStruct _value) {
    _projects.remove(_value);
    prefs.setStringList(
        'ff_projects', _projects.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProjects(int _index) {
    _projects.removeAt(_index);
    prefs.setStringList(
        'ff_projects', _projects.map((x) => x.serialize()).toList());
  }

  void updateProjectsAtIndex(
    int _index,
    ProjectStruct Function(ProjectStruct) updateFn,
  ) {
    _projects[_index] = updateFn(_projects[_index]);
    prefs.setStringList(
        'ff_projects', _projects.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProjects(int _index, ProjectStruct _value) {
    _projects.insert(_index, _value);
    prefs.setStringList(
        'ff_projects', _projects.map((x) => x.serialize()).toList());
  }

  List<MomentsStruct> _moments = [];
  List<MomentsStruct> get moments => _moments;
  set moments(List<MomentsStruct> _value) {
    _moments = _value;
    prefs.setStringList(
        'ff_moments', _value.map((x) => x.serialize()).toList());
  }

  void addToMoments(MomentsStruct _value) {
    _moments.add(_value);
    prefs.setStringList(
        'ff_moments', _moments.map((x) => x.serialize()).toList());
  }

  void removeFromMoments(MomentsStruct _value) {
    _moments.remove(_value);
    prefs.setStringList(
        'ff_moments', _moments.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMoments(int _index) {
    _moments.removeAt(_index);
    prefs.setStringList(
        'ff_moments', _moments.map((x) => x.serialize()).toList());
  }

  void updateMomentsAtIndex(
    int _index,
    MomentsStruct Function(MomentsStruct) updateFn,
  ) {
    _moments[_index] = updateFn(_moments[_index]);
    prefs.setStringList(
        'ff_moments', _moments.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMoments(int _index, MomentsStruct _value) {
    _moments.insert(_index, _value);
    prefs.setStringList(
        'ff_moments', _moments.map((x) => x.serialize()).toList());
  }

  bool _isAppFirstTime = true;
  bool get isAppFirstTime => _isAppFirstTime;
  set isAppFirstTime(bool _value) {
    _isAppFirstTime = _value;
    prefs.setBool('ff_isAppFirstTime', _value);
  }

  int _notificationId = 0;
  int get notificationId => _notificationId;
  set notificationId(int _value) {
    _notificationId = _value;
    prefs.setInt('ff_notificationId', _value);
  }

  String _redirectTo = '';
  String get redirectTo => _redirectTo;
  set redirectTo(String _value) {
    _redirectTo = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
