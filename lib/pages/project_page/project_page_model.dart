import '/bottom_sheets/add_content_bottom_sheet/add_content_bottom_sheet_widget.dart';
import '/components/project_profile_body/project_profile_body_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'project_page_widget.dart' show ProjectPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectPageModel extends FlutterFlowModel<ProjectPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ProjectProfileBody component.
  late ProjectProfileBodyModel projectProfileBodyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    projectProfileBodyModel =
        createModel(context, () => ProjectProfileBodyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    projectProfileBodyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
