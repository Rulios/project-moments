import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'moments_video_previewer_model.dart';
export 'moments_video_previewer_model.dart';

class MomentsVideoPreviewerWidget extends StatefulWidget {
  const MomentsVideoPreviewerWidget({
    Key? key,
    required this.moments,
    required this.videoSpeed,
  }) : super(key: key);

  final List<MomentsStruct>? moments;
  final int? videoSpeed;

  @override
  _MomentsVideoPreviewerWidgetState createState() =>
      _MomentsVideoPreviewerWidgetState();
}

class _MomentsVideoPreviewerWidgetState
    extends State<MomentsVideoPreviewerWidget> {
  late MomentsVideoPreviewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MomentsVideoPreviewerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.updatePage(() {
        _model.videoLengthInSeconds =
            (random_data.randomInteger(100, 110) / widget.videoSpeed!).toInt();
      });
      while (true) {
        if (!_model.isStopped) {
          if (_model.currentMomentIndex == (widget.moments!.length - 1)) {
            setState(() {
              _model.currentMomentIndex = 0;
            });
          } else {
            setState(() {
              _model.currentMomentIndex = _model.currentMomentIndex + 1;
            });
          }
        }
        await actions.delay(
          (1000 / widget.videoSpeed!).toInt(),
        );
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 350.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Builder(
              builder: (context) {
                if (widget.moments!.length > 0) {
                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: custom_widgets.LocalImageWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      imageUrl:
                          (widget.moments![_model.currentMomentIndex]).path,
                      fit: 'contain',
                      showCached: true,
                    ),
                  );
                } else {
                  return Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Loading...',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_model.isStopped)
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.play_arrow_sharp,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      _model.isStopped = false;
                    });
                  },
                ),
              if (!_model.isStopped)
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.pause_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      _model.isStopped = true;
                    });
                  },
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      ((widget.moments!.length / widget.videoSpeed!) / 60)
                          .toInt()
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      ':',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      '${((widget.moments!.length / widget.videoSpeed!) % 60).toInt() < 10 ? '0' : ' '}${((widget.moments!.length / widget.videoSpeed!) % 60).toInt().toString()}',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
