import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_projects_bottom_sheet_widget.dart'
    show SelectProjectsBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectProjectsBottomSheetModel
    extends FlutterFlowModel<SelectProjectsBottomSheetWidget> {
  ///  Local state fields for this component.

  List<String> selectedProjects = [];
  void addToSelectedProjects(String item) => selectedProjects.add(item);
  void removeFromSelectedProjects(String item) => selectedProjects.remove(item);
  void removeAtIndexFromSelectedProjects(int index) =>
      selectedProjects.removeAt(index);
  void insertAtIndexInSelectedProjects(int index, String item) =>
      selectedProjects.insert(index, item);
  void updateSelectedProjectsAtIndex(int index, Function(String) updateFn) =>
      selectedProjects[index] = updateFn(selectedProjects[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.

  Map<ProjectStruct, bool> checkboxListTileValueMap = {};
  List<ProjectStruct> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
