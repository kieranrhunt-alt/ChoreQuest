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
import 'quest_photo_sheet_model.dart';
export 'quest_photo_sheet_model.dart';

/// Kid finishes a photo-proof quest: optional photo link, then submit for
/// review.
class QuestPhotoSheetWidget extends StatefulWidget {
  const QuestPhotoSheetWidget({
    super.key,
    this.questId,
    this.kidId,
  });

  final String? questId;
  final String? kidId;

  @override
  State<QuestPhotoSheetWidget> createState() => _QuestPhotoSheetWidgetState();
}

class _QuestPhotoSheetWidgetState extends State<QuestPhotoSheetWidget> {
  late QuestPhotoSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestPhotoSheetModel());

    _model.questPhotoUrlTextController ??= TextEditingController();
    _model.questPhotoUrlFocusNode ??= FocusNode();
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
              'This quest asks for a photo. Paste a photo link (optional), then finish your quest!',
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
              controller: _model.questPhotoUrlTextController,
              focusNode: _model.questPhotoUrlFocusNode,
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
              validator: _model.questPhotoUrlTextControllerValidator
                  .asValidator(context),
            ),
            FFButtonWidget(
              onPressed: () async {
                FFAppState().quests = functions
                    .submitQuest(FFAppState().quests.toList(), widget!.questId,
                        widget!.kidId, _model.questPhotoUrlTextController.text)!
                    .toList()
                    .cast<QuestStruct>();
                safeSetState(() {});
                FFAppState().submissions = functions
                    .addSubmission(
                        FFAppState().submissions.toList(),
                        widget!.questId,
                        widget!.kidId,
                        _model.questPhotoUrlTextController.text)!
                    .toList()
                    .cast<SubmissionStruct>();
                safeSetState(() {});
                Navigator.pop(context);
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
