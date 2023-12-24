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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_preview_model.dart';
export 'video_preview_model.dart';

class VideoPreviewWidget extends StatefulWidget {
  const VideoPreviewWidget({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  final String? projectId;

  @override
  _VideoPreviewWidgetState createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  late VideoPreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPreviewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.videoSettings = VideoSettingsStruct(
          speed: 7,
        );
        _model.momentsList = FFAppState()
            .moments
            .where((e) => e.belongsTo.contains(widget.projectId))
            .toList()
            .toList()
            .cast<MomentsStruct>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.generatedVideoPath = await actions.generateVideo(
                      _model.momentsList.toList(),
                      _model.videoSettings?.speed,
                      () async {
                        setState(() {
                          _model.renderStatus = VideoRenderingStates.rendering;
                        });
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: LoadingBottomSheetWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      () async {
                        setState(() {
                          _model.renderStatus =
                              VideoRenderingStates.success_render;
                        });
                      },
                      () async {
                        setState(() {
                          _model.renderStatus =
                              VideoRenderingStates.failed_render;
                        });
                      },
                    );
                    while (
                        _model.renderStatus == VideoRenderingStates.rendering) {
                      await Future.delayed(const Duration(milliseconds: 200));
                    }
                    Navigator.pop(context);
                    if (_model.renderStatus ==
                        VideoRenderingStates.success_render) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Success!'),
                            content: Text('Video is ready!'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Yay! ;)'),
                              ),
                            ],
                          );
                        },
                      );

                      context.pushNamed(
                        'VideoFinalRendered',
                        queryParameters: {
                          'videoPath': serializeParam(
                            _model.generatedVideoPath,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      if (_model.renderStatus ==
                          VideoRenderingStates.failed_render) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text(
                                  'We had some problems rendering the video :('),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok ;('),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }

                    setState(() {});
                  },
                  child: Text(
                    'Save',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Moments renderer that filters and performs the necessary operations to render moments media accordingly, also handling th e play & stop mechanism.
              //
              wrapWithModel(
                model: _model.momentsVideoPreviewerModel,
                updateCallback: () => setState(() {}),
                child: MomentsVideoPreviewerWidget(
                  videoSpeed: valueOrDefault<int>(
                    _model.videoSettings?.speed,
                    7,
                  ),
                  moments: _model.momentsList,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Speed - ',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '${_model.videoSettings?.speed?.toString()} Moments/second',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            activeColor: FlutterFlowTheme.of(context).secondary,
                            inactiveColor:
                                FlutterFlowTheme.of(context).alternate,
                            min: 1.0,
                            max: 20.0,
                            value: _model.sliderValue ??=
                                valueOrDefault<double>(
                              _model.videoSettings?.speed?.toDouble(),
                              7.0,
                            ),
                            label: _model.sliderValue.toString(),
                            divisions: 19,
                            onChanged: (newValue) async {
                              newValue =
                                  double.parse(newValue.toStringAsFixed(0));
                              setState(() => _model.sliderValue = newValue);
                              setState(() {
                                _model.updateVideoSettingsStruct(
                                  (e) => e..speed = _model.sliderValue!.toInt(),
                                );
                              });
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 18.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _model.momentsList = functions
                                        .reverseMoments(
                                            _model.momentsList.toList())
                                        .toList()
                                        .cast<MomentsStruct>();
                                  });
                                },
                                text: 'Reverse video',
                                icon: Icon(
                                  Icons.restart_alt,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
