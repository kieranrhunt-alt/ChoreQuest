import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'royal_deny_sheet_model.dart';
export 'royal_deny_sheet_model.dart';

/// Parent denies a submitted quest with a note; the quest returns to Open.
class RoyalDenySheetWidget extends StatefulWidget {
  const RoyalDenySheetWidget({
    super.key,
    this.questId,
    this.questTitle,
  });

  final String? questId;
  final String? questTitle;

  @override
  State<RoyalDenySheetWidget> createState() => _RoyalDenySheetWidgetState();
}

class _RoyalDenySheetWidgetState extends State<RoyalDenySheetWidget> {
  late RoyalDenySheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoyalDenySheetModel());

    _model.denyNoteTextController ??= TextEditingController();
    _model.denyNoteFocusNode ??= FocusNode();
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border.all(
          color: FlutterFlowTheme.of(context).tertiary,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
          crossAxisAlignment: (FFCrossAxisAlignment.stretch).flutterValue,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '📜 Send it back',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.cinzel(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
            ),
            Text(
              widget!.questTitle!,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.nunito(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
            ),
            TextFormField(
              controller: _model.denyNoteTextController,
              focusNode: _model.denyNoteFocusNode,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Note for your hero',
                hintText: 'e.g. Please put the toys in the chest too',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
              ),
              style: TextStyle(),
              maxLines: 3,
              validator:
                  _model.denyNoteTextControllerValidator.asValidator(context),
            ),
            FFButtonWidget(
              onPressed: () async {
                FFAppState().quests = functions
                    .reviewQuest(FFAppState().quests.toList(), widget!.questId,
                        false, _model.denyNoteTextController.text)!
                    .toList()
                    .cast<QuestStruct>();
                safeSetState(() {});
                FFAppState().submissions = functions
                    .reviewSubmission(
                        FFAppState().submissions.toList(),
                        widget!.questId,
                        false,
                        _model.denyNoteTextController.text)!
                    .toList()
                    .cast<SubmissionStruct>();
                safeSetState(() {});
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Quest returned to Open with your note',
                      style: TextStyle(),
                    ),
                    duration: Duration(milliseconds: 4000),
                  ),
                );
              },
              text: 'Deny & return to Open',
              icon: Icon(
                Icons.undo,
                size: 20.0,
              ),
              options: FFButtonOptions(
                height: 52.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconColor: Colors.white,
                color: FlutterFlowTheme.of(context).error,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ].divide(SizedBox(height: 14.0)),
        ),
      ),
    );
  }
}
