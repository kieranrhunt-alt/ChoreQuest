import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class _RoyalDenySheetWidgetState extends State<RoyalDenySheetWidget>
    with TickerProviderStateMixin {
  late RoyalDenySheetModel _model;

  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

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

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 90.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.08, 0.86),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 90.0.ms,
            duration: 100.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.94, 1.2),
          ),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 190.0.ms,
            duration: 110.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.985, 0.97),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
                    font: GoogleFonts.comicNeue(
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
                    font: GoogleFonts.comicNeue(
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
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFF7E1028),
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFB3C3),
                    Color(0xFFE64A6C),
                    Color(0xFFD23356),
                    Color(0xFFB01E40)
                  ],
                  stops: [0.0, 0.48, 0.52, 1.0],
                  begin: AlignmentDirectional(1.0, 0.0),
                  end: AlignmentDirectional(-1.0, 0),
                ),
                borderRadius: BorderRadius.circular(22.0),
                border: Border.all(
                  color: Color(0xD9FFFFFF),
                  width: 2.5,
                ),
              ),
              child: FFButtonWidget(
                onPressed: () async {
                  if (animationsMap['containerOnActionTriggerAnimation'] !=
                      null) {
                    safeSetState(() => hasContainerTriggered = true);
                    SchedulerBinding.instance.addPostFrameCallback((_) async =>
                        await animationsMap[
                                'containerOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0));
                  }
                  FFAppState().quests = functions
                      .reviewQuest(
                          FFAppState().quests.toList(),
                          widget!.questId,
                          false,
                          _model.denyNoteTextController.text)!
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
                        style: GoogleFonts.comicNeue(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                    ),
                  );
                },
                text: '🚫 Deny & return to Open',
                options: FFButtonOptions(
                  height: 52.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x00FFFFFF),
                  textStyle: GoogleFonts.comicNeue(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
            ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
                hasBeenTriggered: hasContainerTriggered),
          ].divide(SizedBox(height: 14.0)),
        ),
      ),
    );
  }
}
