import '/components/edit_project_form/edit_project_form_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_project_form_page_widget.dart' show EditProjectFormPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProjectFormPageModel
    extends FlutterFlowModel<EditProjectFormPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EditProjectForm component.
  late EditProjectFormModel editProjectFormModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editProjectFormModel = createModel(context, () => EditProjectFormModel());
  }

  void dispose() {
    unfocusNode.dispose();
    editProjectFormModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
