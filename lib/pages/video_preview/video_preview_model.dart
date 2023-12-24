import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/bottom_sheets/loading_bottom_sheet/loading_bottom_sheet_widget.dart';
import '/components/moments_video_previewer/moments_video_previewer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'video_preview_widget.dart' show VideoPreviewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoPreviewModel extends FlutterFlowModel<VideoPreviewWidget> {
  ///  Local state fields for this page.

  VideoSettingsStruct? videoSettings;
  void updateVideoSettingsStruct(Function(VideoSettingsStruct) updateFn) =>
      updateFn(videoSettings ??= VideoSettingsStruct());

  String testSliderValue = '';

  bool isVideoFinishedRendering = false;

  VideoRenderingStates? renderStatus;

  List<MomentsStruct> momentsList = [];
  void addToMomentsList(MomentsStruct item) => momentsList.add(item);
  void removeFromMomentsList(MomentsStruct item) => momentsList.remove(item);
  void removeAtIndexFromMomentsList(int index) => momentsList.removeAt(index);
  void insertAtIndexInMomentsList(int index, MomentsStruct item) =>
      momentsList.insert(index, item);
  void updateMomentsListAtIndex(int index, Function(MomentsStruct) updateFn) =>
      momentsList[index] = updateFn(momentsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - generateVideo] action in Text widget.
  String? generatedVideoPath;
  // Model for MomentsVideoPreviewer component.
  late MomentsVideoPreviewerModel momentsVideoPreviewerModel;
  // State field(s) for Slider widget.
  double? sliderValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    momentsVideoPreviewerModel =
        createModel(context, () => MomentsVideoPreviewerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    momentsVideoPreviewerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
