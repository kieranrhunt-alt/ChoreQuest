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

class _RoyalSubmitSheetWidgetState extends State<RoyalSubmitSheetWidget>
    with TickerProviderStateMixin {
  late RoyalSubmitSheetModel _model;

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
    _model = createModel(context, () => RoyalSubmitSheetModel());

    _model.photoUrlFieldTextController ??= TextEditingController();
    _model.photoUrlFieldFocusNode ??= FocusNode();

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
              '📸 Show your brave deed!',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                font: GoogleFonts.sniglet(
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight:
                    FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(0.0, -1.5),
                    blurRadius: 0.0,
                  ),
                  Shadow(
                    color: Color(0x55B79CFF),
                    offset: Offset(0.0, 2.5),
                    blurRadius: 0.0,
                  )
                ],
              ),
            ),
            Text(
              'This quest asks for a photo. Paste a photo link (optional).',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.sniglet(
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
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFFB8740A),
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFF6C4),
                    Color(0xFFFFD54F),
                    Color(0xFFFFC22E),
                    Color(0xFFF0A30A)
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
                      .submitQuest(
                          FFAppState().quests.toList(),
                          widget!.questId,
                          widget!.kidId,
                          _model.photoUrlFieldTextController.text)!
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
                        style: GoogleFonts.sniglet(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                    ),
                  );
                },
                text: '🏆 Quest complete!',
                options: FFButtonOptions(
                  height: 58.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x00FFFFFF),
                  textStyle: GoogleFonts.sniglet(
                    color: Color(0xFF3A2400),
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0,
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
