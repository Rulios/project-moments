import '/backend/schema/structs/index.dart';
import '/components/moment_selector_card/moment_selector_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'moments_list_preview_model.dart';
export 'moments_list_preview_model.dart';

class MomentsListPreviewWidget extends StatefulWidget {
  const MomentsListPreviewWidget({
    Key? key,
    required this.moments,
  }) : super(key: key);

  final List<MomentsStruct>? moments;

  @override
  _MomentsListPreviewWidgetState createState() =>
      _MomentsListPreviewWidgetState();
}

class _MomentsListPreviewWidgetState extends State<MomentsListPreviewWidget> {
  late MomentsListPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MomentsListPreviewModel());
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
                  return MomentSelectorCardWidget(
                    key: Key('Keyfx2_${momentsIndex}_of_${moments.length}'),
                    isSelected:
                        _model.selectedMediaIndexes.contains(momentsIndex),
                    showProjectName: false,
                    mediaPath: momentsItem.path,
                    selectedAction: () async {
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
