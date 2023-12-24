import '/bottom_sheets/loading_bottom_sheet/loading_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'loading_page_widget.dart' show LoadingPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingPageModel extends FlutterFlowModel<LoadingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for LoadingBottomSheet component.
  late LoadingBottomSheetModel loadingBottomSheetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingBottomSheetModel =
        createModel(context, () => LoadingBottomSheetModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loadingBottomSheetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
