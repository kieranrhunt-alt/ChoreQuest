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
import 'royal_submit_sheet_model.dart';
export 'royal_submit_sheet_model.dart';

/// Kid submits a photo-proof quest with an optional photo link.
class RoyalSubmitSheetWidget extends StatefulWidget {
  const RoyalSubmitSheetWidget({
    super.key,
    this.questId,
    this.kidId,
  });

  final String? questId;
  final String? kidId;

  @override
  State<RoyalSubmitSheetWidget> createState() => _RoyalSubmitSheetWidgetState();
}

class _RoyalSubmitSheetWidgetState extends State<RoyalSubmitSheetWidget> {
  late RoyalSubmitSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoyalSubmitSheetModel());

    _model.photoUrlFieldTextController ??= TextEditingController();
    _model.photoUrlFieldFocusNode ??= FocusNode();
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
              '📸 Show your brave deed!',
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
              'This quest asks for a photo. Paste a photo link (optional).',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.nunito(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            TextFormField(
              controller: _model.photoUrlFieldTextController,
              focusNode: _model.photoUrlFieldFocusNode,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Photo link',
                hintText: 'https://...',
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
              maxLines: null,
              validator: _model.photoUrlFieldTextControllerValidator
                  .asValidator(context),
            ),
            FFButtonWidget(
              onPressed: () async {
                FFAppState().quests = functions
                    .submitQuest(FFAppState().quests.toList(), widget!.questId,
                        widget!.kidId, _model.photoUrlFieldTextController.text)!
                    .toList()
                    .cast<QuestStruct>();
                safeSetState(() {});
                FFAppState().submissions = functions
                    .addSubmission(
                        FFAppState().submissions.toList(),
                        widget!.questId,
                        widget!.kidId,
                        _model.photoUrlFieldTextController.text)!
                    .toList()
                    .cast<SubmissionStruct>();
                safeSetState(() {});
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Quest complete! 🎉 A ruler will check it soon.',
                      style: TextStyle(),
                    ),
                    duration: Duration(milliseconds: 4000),
                  ),
                );
              },
              text: '🏆 Quest complete!',
              options: FFButtonOptions(
                height: 56.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).tertiary,
                textStyle: TextStyle(
                  color: Color(0xFF2A1B4D),
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ].divide(SizedBox(height: 14.0)),
        ),
      ),
    );
  }
}
