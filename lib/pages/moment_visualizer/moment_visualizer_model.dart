import '/backend/schema/structs/index.dart';
import '/bottom_sheets/select_projects_bottom_sheet/select_projects_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'moment_visualizer_widget.dart' show MomentVisualizerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MomentVisualizerModel extends FlutterFlowModel<MomentVisualizerWidget> {
  ///  Local state fields for this page.

  MomentsStruct? moment;
  void updateMomentStruct(Function(MomentsStruct) updateFn) =>
      updateFn(moment ??= MomentsStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
