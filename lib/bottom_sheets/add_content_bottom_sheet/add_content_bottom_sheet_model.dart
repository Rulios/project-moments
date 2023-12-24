import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_content_bottom_sheet_widget.dart' show AddContentBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddContentBottomSheetModel
    extends FlutterFlowModel<AddContentBottomSheetWidget> {
  ///  Local state fields for this component.

  int iterativeIndex = 0;

  List<String> projectIdsReferences = [];
  void addToProjectIdsReferences(String item) => projectIdsReferences.add(item);
  void removeFromProjectIdsReferences(String item) =>
      projectIdsReferences.remove(item);
  void removeAtIndexFromProjectIdsReferences(int index) =>
      projectIdsReferences.removeAt(index);
  void insertAtIndexInProjectIdsReferences(int index, String item) =>
      projectIdsReferences.insert(index, item);
  void updateProjectIdsReferencesAtIndex(
          int index, Function(String) updateFn) =>
      projectIdsReferences[index] = updateFn(projectIdsReferences[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - saveMomentsList] action in Container widget.
  bool? saveStatus;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - saveSingleMoment] action in Container widget.
  String? singleMediaPath;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
