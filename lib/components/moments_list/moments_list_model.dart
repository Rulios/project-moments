import '/backend/schema/structs/index.dart';
import '/components/moment_card/moment_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'moments_list_widget.dart' show MomentsListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MomentsListModel extends FlutterFlowModel<MomentsListWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for MomentCard dynamic component.
  late FlutterFlowDynamicModels<MomentCardModel> momentCardModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    momentCardModels = FlutterFlowDynamicModels(() => MomentCardModel());
  }

  void dispose() {
    momentCardModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
