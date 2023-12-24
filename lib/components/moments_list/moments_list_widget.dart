import '/backend/schema/structs/index.dart';
import '/components/moment_card/moment_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'moments_list_model.dart';
export 'moments_list_model.dart';

class MomentsListWidget extends StatefulWidget {
  const MomentsListWidget({
    Key? key,
    required this.moments,
  }) : super(key: key);

  final List<MomentsStruct>? moments;

  @override
  _MomentsListWidgetState createState() => _MomentsListWidgetState();
}

class _MomentsListWidgetState extends State<MomentsListWidget> {
  late MomentsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MomentsListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Builder(
            builder: (context) {
              final moments = widget.moments!.toList();
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                scrollDirection: Axis.vertical,
                itemCount: moments.length,
                itemBuilder: (context, momentsIndex) {
                  final momentsItem = moments[momentsIndex];
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: wrapWithModel(
                      model: _model.momentCardModels.getModel(
                        'gridview_moment_${momentsItem.id}',
                        momentsIndex,
                      ),
                      updateCallback: () => setState(() {}),
                      child: MomentCardWidget(
                        key: Key(
                          'Keyseq_${'gridview_moment_${momentsItem.id}'}',
                        ),
                        mediaPath: momentsItem.path,
                        momentId: momentsItem.id,
                        onClick: () async {
                          context.pushNamed(
                            'MomentVisualizer',
                            queryParameters: {
                              'momentId': serializeParam(
                                momentsItem.id,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
