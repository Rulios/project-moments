import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/bottom_sheets/add_content_bottom_sheet/add_content_bottom_sheet_widget.dart';
import '/components/moments_list/moments_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_profile_body_model.dart';
export 'project_profile_body_model.dart';

class ProjectProfileBodyWidget extends StatefulWidget {
  const ProjectProfileBodyWidget({
    Key? key,
    required this.project,
    required this.moments,
  }) : super(key: key);

  final ProjectStruct? project;
  final List<MomentsStruct>? moments;

  @override
  _ProjectProfileBodyWidgetState createState() =>
      _ProjectProfileBodyWidgetState();
}

class _ProjectProfileBodyWidgetState extends State<ProjectProfileBodyWidget> {
  late ProjectProfileBodyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectProfileBodyModel());
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
          child: Text(
            widget.project!.name,
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Outfit',
                  fontSize: 50.0,
                ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
            child: Text(
              widget.project!.description,
              style: FlutterFlowTheme.of(context).labelLarge,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: FFButtonWidget(
            onPressed: widget.moments?.length == 0
                ? null
                : () async {
                    context.pushNamed(
                      'VideoPreview',
                      queryParameters: {
                        'projectId': serializeParam(
                          widget.project?.id,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
            text: 'Compile into video',
            icon: Icon(
              Icons.video_collection,
              color: FlutterFlowTheme.of(context).secondary,
              size: 15.0,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 50.0,
              padding: EdgeInsets.all(0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              elevation: 10.0,
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8.0),
              disabledColor: Color(0xE1FFFFFF),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: Icon(
                Icons.notifications_active,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
            Text(
              'Every ${widget.project?.reminderValue?.toString()} ${widget.project?.reminderUnit}',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ],
        ),
        Builder(
          builder: (context) {
            if (widget.moments?.length == 0) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                                spreadRadius: 2.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height: 200.0,
                                      child: AddContentBottomSheetWidget(
                                        showCreateProject: false,
                                        projectIdRef: widget.project?.id,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 48.0,
                                ),
                                Text(
                                  'Add Moments',
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                Text(
                                  'Embrace your moments. Be patient.',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.6,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: wrapWithModel(
                    model: _model.momentsListModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: MomentsListWidget(
                      moments: functions.sortMomentsByDate(
                          widget.moments!.toList(), SortOrders.DESCENDING),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
