import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/bottom_sheets/add_content_bottom_sheet/add_content_bottom_sheet_widget.dart';
import '/components/moments_list/moments_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'project_profile_body_widget.dart' show ProjectProfileBodyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectProfileBodyModel
    extends FlutterFlowModel<ProjectProfileBodyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for MomentsList component.
  late MomentsListModel momentsListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    momentsListModel = createModel(context, () => MomentsListModel());
  }

  void dispose() {
    momentsListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
