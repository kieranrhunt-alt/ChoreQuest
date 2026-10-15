import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_styled_border.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reward_road_page_model.dart';
export 'reward_road_page_model.dart';

/// Reward Road: a board game with one space per gold of the reward; the hero
/// advances as their gold grows and reveals mystery-chest surprises.
class RewardRoadPageWidget extends StatefulWidget {
  const RewardRoadPageWidget({
    super.key,
    this.rewardId,
  });

  final String? rewardId;

  static String routeName = 'RewardRoadPage';
  static String routePath = '/reward-road';

  @override
  State<RewardRoadPageWidget> createState() => _RewardRoadPageWidgetState();
}

class _RewardRoadPageWidgetState extends State<RewardRoadPageWidget>
    with TickerProviderStateMixin {
  late RewardRoadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardRoadPageModel());

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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional(0.0, -1.0),
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  child: custom_widgets.KingdomBackdrop(
                    scene: functions.boardTheme(
                        FFAppState().boardThemes, widget!.rewardId),
                    animate: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 40.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                    crossAxisAlignment:
                        (FFCrossAxisAlignment.stretch).flutterValue,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 14.0,
                              color: Color(0x40000000),
                              offset: Offset(
                                0.0,
                                4.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [Color(0xFF6B47D6), Color(0xFF3E2490)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, 1.0),
                            end: AlignmentDirectional(-1.0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 10.0, 12.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.center).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 14.0,
                                buttonSize: 52.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color(0xFF2A1B4D),
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.start).flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      'Treasure Quest',
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                        font: GoogleFonts.sniglet(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                        shadows: [
                                          Shadow(
                                            color: Color(0xFF4A1FA0),
                                            offset: Offset(0.0, 3.0),
                                            blurRadius: 0.0,
                                          ),
                                          Shadow(
                                            color: Color(0x66FF9ECF),
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 8.0,
                                          )
                                        ],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      functions.rewardText(
                                          FFAppState().rewards.toList(),
                                          widget!.rewardId,
                                          'title')!,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.sniglet(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFF7E7B5),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ].divide(SizedBox(height: 2.0)),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation'] !=
                                      null) {
                                    safeSetState(
                                        () => hasContainerTriggered = true);
                                    SchedulerBinding.instance.addPostFrameCallback(
                                        (_) async => await animationsMap[
                                                'containerOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0));
                                  }
                                  if (functions.memberRole(
                                          FFAppState().members.toList(),
                                          FFAppState().currentMemberId) ==
                                      'parent') {
                                    context.pushNamed(
                                        ThroneRoomPageWidget.routeName);
                                  } else {
                                    context.pushNamed(
                                        HeroHomePageWidget.routeName);
                                  }
                                },
                                child: Container(
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: Color(0xFFB8740A),
                                        offset: Offset(
                                          0.0,
                                          4.0,
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
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: Color(0xD9FFFFFF),
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          (FFMainAxisAlignment.center)
                                              .flutterValue,
                                      crossAxisAlignment:
                                          (FFCrossAxisAlignment.center)
                                              .flutterValue,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Container(
                                          width: 26.0,
                                          height: 26.0,
                                          child: Container(
                                            child:
                                                custom_widgets.ChoreQuestLogo(
                                              showTitle: false,
                                              animate: false,
                                              titleFontFamily: '',
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Throne Room',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font: GoogleFonts.sniglet(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF3A2400),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation']!,
                                  hasBeenTriggered: hasContainerTriggered),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xF2FFFCF5),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Color(0x99F2B53A),
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.center).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                width: 68.0,
                                height: 68.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFF3B0),
                                      Color(0xFFF2B53A)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(1.0, 1.0),
                                    end: AlignmentDirectional(-1.0, -1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                  border: Border.all(
                                    color: Color(0xFFB07A12),
                                    width: 2.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  functions.rewardText(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId,
                                      'icon')!,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                    font: GoogleFonts.sniglet(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
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
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.start).flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      functions.rewardText(
                                          FFAppState().rewards.toList(),
                                          widget!.rewardId,
                                          'title')!,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                        font: GoogleFonts.sniglet(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
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
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ((int? e, int? c) {
                                        return '🪙 $e / $c quest gold';
                                      }(
                                          functions.tqEarned(
                                              FFAppState()
                                                  .transactions
                                                  .toList(),
                                              FFAppState().currentMemberId,
                                              widget!.rewardId),
                                          functions.rewardCost(
                                              FFAppState().rewards.toList(),
                                              widget!.rewardId)))!,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.sniglet(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF8A5A00),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      functions.tqStatusText(
                                          FFAppState().transactions.toList(),
                                          FFAppState().currentMemberId,
                                          widget!.rewardId,
                                          functions.rewardCost(
                                              FFAppState().rewards.toList(),
                                              widget!.rewardId))!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.sniglet(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xF2FFFCF5),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 14.0,
                              color: Color(0x26000000),
                              offset: Offset(
                                0.0,
                                4.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Color(0x99F2B53A),
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            child: custom_widgets.RewardBoard(
                              burstKey: (int? n) {
                                return n == 0 ? '' : 'claim$n';
                              }(_model.burstCount),
                              goalIcon: functions.rewardText(
                                  FFAppState().rewards.toList(),
                                  widget!.rewardId,
                                  'icon'),
                              position: functions.tqPosition(
                                  FFAppState().transactions.toList(),
                                  FFAppState().currentMemberId,
                                  widget!.rewardId,
                                  functions.rewardCost(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId)),
                              prizes: functions.boardCode(functions
                                  .boardPrizes(
                                      widget!.rewardId,
                                      FFAppState().currentMemberId,
                                      functions.rewardCost(
                                          FFAppState().rewards.toList(),
                                          widget!.rewardId),
                                      functions.boardRound(
                                          FFAppState().redemptions.toList(),
                                          FFAppState().currentMemberId,
                                          widget!.rewardId),
                                      FFAppState().avatarItems.toList(),
                                      FFAppState().members.toList(),
                                      FFAppState().wardrobe.toList(),
                                      FFAppState().boardClaims.toList(),
                                      FFAppState().transactions.toList(),
                                      FFAppState().boardSurprisesOn)
                                  ?.toList()),
                              spaces: functions.boardSpaces(
                                  functions.rewardCost(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId)),
                              tokenLook: functions.avatarLook(
                                  FFAppState().members.toList(),
                                  FFAppState().wardrobe.toList(),
                                  FFAppState().avatarItems.toList(),
                                  FFAppState().currentMemberId,
                                  ''),
                              theme: functions.boardTheme(
                                  FFAppState().boardThemes, widget!.rewardId),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xF2FFFCF5),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Color(0x99F2B53A),
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.stretch).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '🎨 Board theme',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.sniglet(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF2A1B4D),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'road')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'road',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'road')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Royal Road',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'castle')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'castle',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'castle')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Castle',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'throne')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'throne',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'throne')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Throne Room',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'questboard')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'questboard',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'questboard')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Quest Board',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'forge')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'forge',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'forge')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Forge',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'tournament')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'tournament',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'tournament')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Tournament',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'treasury')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'treasury',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'treasury')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Treasury',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'market')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'market',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'market')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Market',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'clocktower')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'clocktower',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'clocktower')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Clock Tower',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'mint')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'mint',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'mint')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Royal Mint',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'tailor')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'tailor',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'tailor')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Tailor',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'gears')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'gears',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'gears')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Clockwork',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'treasure')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'treasure',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'treasure')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Treasure Cave',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'mirror')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'mirror',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'mirror')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Mirror Hall',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'toyshop')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'toyshop',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'toyshop')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Toy Shop',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'meadow')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'meadow',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'meadow')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Meadow',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'dusk')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'dusk',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'dusk')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Dragon\'s Lair',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().boardThemes =
                                            functions.setBoardTheme(
                                                FFAppState().boardThemes,
                                                widget!.rewardId,
                                                'night')!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 74.0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 104.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    child: custom_widgets
                                                        .KingdomBackdrop(
                                                      scene: 'night',
                                                      animate: false,
                                                    ),
                                                  ),
                                                ),
                                                if (functions.boardTheme(
                                                        FFAppState()
                                                            .boardThemes,
                                                        widget!.rewardId) ==
                                                    'night')
                                                  Container(
                                                    width: 70.0,
                                                    height: 104.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        width: 4.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Text(
                                                      '✅',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .sniglet(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              'Starry Night',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2A1B4D),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 6.0, 12.0, 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xEBFFFCF5),
                            borderRadius: BorderRadius.circular(14.0),
                            border: Border.all(
                              color: Color(0x99F2B53A),
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            'Start the quest, then earn gold — only gold earned after you start moves your squishie. Purple “?” chests hide surprises!',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      font: GoogleFonts.sniglet(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF2A1B4D),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.start).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.center).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xE6FFFCF5),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: FlutterFlowStyledBorder(
                                    side: BorderSide(
                                      color: Color(0xFF7B3FE4),
                                      width: 6.0,
                                    ),
                                    style: FlutterFlowDashStyle.solid,
                                    showTop: false,
                                    showRight: false,
                                    showBottom: false,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 7.0, 16.0, 7.0),
                                  child: Text(
                                    '🎁 Treasures found',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.sniglet(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF2A1B4D),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (functions
                              .revealedPrizes(functions
                                  .boardPrizes(
                                      widget!.rewardId,
                                      FFAppState().currentMemberId,
                                      functions.rewardCost(
                                          FFAppState().rewards.toList(),
                                          widget!.rewardId),
                                      functions.boardRound(
                                          FFAppState().redemptions.toList(),
                                          FFAppState().currentMemberId,
                                          widget!.rewardId),
                                      FFAppState().avatarItems.toList(),
                                      FFAppState().members.toList(),
                                      FFAppState().wardrobe.toList(),
                                      FFAppState().boardClaims.toList(),
                                      FFAppState().transactions.toList(),
                                      FFAppState().boardSurprisesOn)
                                  ?.toList())
                              ?.length ==
                          0)
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xF2FFFCF5),
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Color(0x99F2B53A),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'No chests reached yet — keep questing to reveal the surprises!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.sniglet(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          final item = functions
                                  .revealedPrizes(functions
                                      .boardPrizes(
                                          widget!.rewardId,
                                          FFAppState().currentMemberId,
                                          functions.rewardCost(
                                              FFAppState().rewards.toList(),
                                              widget!.rewardId),
                                          functions.boardRound(
                                              FFAppState().redemptions.toList(),
                                              FFAppState().currentMemberId,
                                              widget!.rewardId),
                                          FFAppState().avatarItems.toList(),
                                          FFAppState().members.toList(),
                                          FFAppState().wardrobe.toList(),
                                          FFAppState().boardClaims.toList(),
                                          FFAppState().transactions.toList(),
                                          FFAppState().boardSurprisesOn)
                                      ?.toList())
                                  ?.toList() ??
                              [];

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: item.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, itemIndex) {
                              final itemItem = item[itemIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xF2FFFCF5),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 14.0,
                                      color: Color(0x26000000),
                                      offset: Offset(
                                        0.0,
                                        4.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: Color(0x99F2B53A),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        (FFMainAxisAlignment.start)
                                            .flutterValue,
                                    crossAxisAlignment:
                                        (FFCrossAxisAlignment.center)
                                            .flutterValue,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            if (itemItem.kind == 'gold')
                                              Text(
                                                '🪙',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                  font: GoogleFonts.sniglet(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
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
                                            if (itemItem.kind == 'item')
                                              Container(
                                                child: Container(
                                                  width: 58.0,
                                                  height: 58.0,
                                                  child: Container(
                                                    child: custom_widgets
                                                        .SquishyAvatar(
                                                      look: itemItem.look,
                                                      animate: false,
                                                      showBackground: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.start)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              itemItem.label,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.sniglet(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              ((int? s) {
                                                return 'Found on space $s';
                                              }(itemItem.space))!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.sniglet(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(height: 2.0)),
                                        ),
                                      ),
                                      if (itemItem.claimed)
                                        Text(
                                          '✅ Claimed',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.sniglet(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      if (!itemItem.claimed)
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0.0,
                                                color: Color(0xFF167A5A),
                                                offset: Offset(
                                                  0.0,
                                                  5.0,
                                                ),
                                                spreadRadius: 0.0,
                                              )
                                            ],
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFD4FFEF),
                                                Color(0xFF5EE0B5),
                                                Color(0xFF3FD0A0),
                                                Color(0xFF22AE80)
                                              ],
                                              stops: [0.0, 0.48, 0.52, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, 0.0),
                                              end:
                                                  AlignmentDirectional(-1.0, 0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(22.0),
                                            border: Border.all(
                                              color: Color(0xD9FFFFFF),
                                              width: 2.5,
                                            ),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (itemItem.kind == 'item') {
                                                FFAppState().wardrobe = functions
                                                    .grantItem(
                                                        FFAppState()
                                                            .wardrobe
                                                            .toList(),
                                                        FFAppState()
                                                            .currentMemberId,
                                                        itemItem.itemId,
                                                        'board')!
                                                    .toList()
                                                    .cast<
                                                        WardrobeEntryStruct>();
                                                safeSetState(() {});
                                                FFAppState().transactions =
                                                    functions
                                                        .addTx(
                                                            FFAppState()
                                                                .transactions
                                                                .toList(),
                                                            FFAppState()
                                                                .currentMemberId,
                                                            0,
                                                            (String? l) {
                                                              return 'Reward Road surprise: $l';
                                                            }(itemItem.label))!
                                                        .toList()
                                                        .cast<
                                                            BuckTransactionStruct>();
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().transactions =
                                                    functions
                                                        .addTx(
                                                            FFAppState()
                                                                .transactions
                                                                .toList(),
                                                            FFAppState()
                                                                .currentMemberId,
                                                            itemItem.gold,
                                                            (String? l) {
                                                              return 'Reward Road surprise: $l';
                                                            }(itemItem.label))!
                                                        .toList()
                                                        .cast<
                                                            BuckTransactionStruct>();
                                                safeSetState(() {});
                                              }

                                              FFAppState().boardClaims = functions
                                                  .addBoardClaim(
                                                      FFAppState()
                                                          .boardClaims
                                                          .toList(),
                                                      FFAppState()
                                                          .currentMemberId,
                                                      widget!.rewardId,
                                                      functions.boardRound(
                                                          FFAppState()
                                                              .redemptions
                                                              .toList(),
                                                          FFAppState()
                                                              .currentMemberId,
                                                          widget!.rewardId),
                                                      itemItem.space)!
                                                  .toList()
                                                  .cast<BoardClaimStruct>();
                                              safeSetState(() {});
                                              _model.burstCount =
                                                  _model.burstCount! + 1;
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    '🎉 Surprise claimed! It is logged in your treasure history.',
                                                    style: GoogleFonts.sniglet(
                                                      color: Colors.white,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                ),
                                              );
                                            },
                                            text: '🎁 Claim!',
                                            options: FFButtonOptions(
                                              height: 58.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00FFFFFF),
                                              textStyle: GoogleFonts.sniglet(
                                                color: Color(0xFF0E3B2E),
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20.0,
                                              ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(22.0),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      if (functions.hasPending(
                              FFAppState().redemptions.toList(),
                              FFAppState().currentMemberId,
                              widget!.rewardId) ??
                          true)
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent3,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              '⏳ Requested — waiting for the ruler',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.sniglet(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.start).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.stretch).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          if (functions.tqMode(
                                  FFAppState().transactions.toList(),
                                  FFAppState().currentMemberId,
                                  widget!.rewardId,
                                  functions.rewardCost(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId)) ==
                              'none')
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
                                  FFAppState().transactions = functions
                                      .tqStart(
                                          FFAppState().transactions.toList(),
                                          FFAppState().currentMemberId,
                                          widget!.rewardId,
                                          functions.rewardText(
                                              FFAppState().rewards.toList(),
                                              widget!.rewardId,
                                              'title'))!
                                      .toList()
                                      .cast<BuckTransactionStruct>();
                                  safeSetState(() {});
                                  _model.burstCount = _model.burstCount! + 1;
                                  safeSetState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '🗺️ Treasure Quest started! Earn gold to move your squishie.',
                                        style: GoogleFonts.sniglet(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                    ),
                                  );
                                },
                                text: '🗺️ Start this Treasure Quest!',
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00FFFFFF),
                                  textStyle: GoogleFonts.sniglet(
                                    color: Color(0xFF3A2400),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                              ),
                            ),
                          if (functions.tqMode(
                                  FFAppState().transactions.toList(),
                                  FFAppState().currentMemberId,
                                  widget!.rewardId,
                                  functions.rewardCost(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId)) ==
                              'other')
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFF1C9),
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: Color(0xFFF2B53A),
                                  width: 1.5,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Text(
                                  '🔒 One Treasure Quest at a time — finish or quit your current quest first.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.sniglet(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF2A1B4D),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          if (functions.tqMode(
                                  FFAppState().transactions.toList(),
                                  FFAppState().currentMemberId,
                                  widget!.rewardId,
                                  functions.rewardCost(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId)) ==
                              'other')
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0.0,
                                    color: Color(0xFF4A1FA0),
                                    offset: Offset(
                                      0.0,
                                      5.0,
                                    ),
                                    spreadRadius: 0.0,
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFD9C2FF),
                                    Color(0xFF9A5CF0),
                                    Color(0xFF8446E6),
                                    Color(0xFF6A2FCC)
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
                                  context.pushNamed(
                                    RewardRoadPageWidget.routeName,
                                    queryParameters: {
                                      'rewardId': serializeParam(
                                        functions.tqActiveReward(
                                            FFAppState().transactions.toList(),
                                            FFAppState().currentMemberId),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: '⭐ Go to my current quest',
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00FFFFFF),
                                  textStyle: GoogleFonts.sniglet(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                              ),
                            ),
                          if (functions.tqMode(
                                  FFAppState().transactions.toList(),
                                  FFAppState().currentMemberId,
                                  widget!.rewardId,
                                  functions.rewardCost(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId)) ==
                              'ready')
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
                                  if (functions.canAfford(
                                      FFAppState().transactions.toList(),
                                      FFAppState().currentMemberId,
                                      functions.rewardCost(
                                          FFAppState().rewards.toList(),
                                          widget!.rewardId))!) {
                                    FFAppState().redemptions = functions
                                        .buyRewardRedemption(
                                            FFAppState().redemptions.toList(),
                                            widget!.rewardId,
                                            FFAppState().currentMemberId,
                                            functions.rewardText(
                                                FFAppState().rewards.toList(),
                                                widget!.rewardId,
                                                'title'),
                                            functions.rewardCost(
                                                FFAppState().rewards.toList(),
                                                widget!.rewardId))!
                                        .toList()
                                        .cast<RedemptionStruct>();
                                    safeSetState(() {});
                                    FFAppState().transactions = functions
                                        .buyRewardTx(
                                            FFAppState().transactions.toList(),
                                            FFAppState().currentMemberId,
                                            functions.rewardText(
                                                FFAppState().rewards.toList(),
                                                widget!.rewardId,
                                                'title'),
                                            functions.rewardCost(
                                                FFAppState().rewards.toList(),
                                                widget!.rewardId))!
                                        .toList()
                                        .cast<BuckTransactionStruct>();
                                    safeSetState(() {});
                                    FFAppState().transactions = functions
                                        .tqEnd(
                                            FFAppState().transactions.toList(),
                                            FFAppState().currentMemberId,
                                            widget!.rewardId,
                                            functions.rewardText(
                                                FFAppState().rewards.toList(),
                                                widget!.rewardId,
                                                'title'),
                                            true)!
                                        .toList()
                                        .cast<BuckTransactionStruct>();
                                    safeSetState(() {});
                                    _model.burstCount = _model.burstCount! + 1;
                                    safeSetState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '🏆 Treasure claimed! Show a ruler to enjoy it.',
                                          style: GoogleFonts.sniglet(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Keep questing — you need a little more gold! 💪',
                                          style: GoogleFonts.sniglet(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  }
                                },
                                text: '🏆 Claim my treasure!',
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00FFFFFF),
                                  textStyle: GoogleFonts.sniglet(
                                    color: Color(0xFF3A2400),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                              ),
                            ),
                          if (((String? m) {
                                return m == 'active' || m == 'ready';
                              }(functions.tqMode(
                                  FFAppState().transactions.toList(),
                                  FFAppState().currentMemberId,
                                  widget!.rewardId,
                                  functions.rewardCost(
                                      FFAppState().rewards.toList(),
                                      widget!.rewardId)))) ??
                              true)
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
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Quit this Treasure Quest?'),
                                                content: Text(
                                                    'Your board progress resets. You keep all of your gold.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Confirm'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().transactions = functions
                                        .tqEnd(
                                            FFAppState().transactions.toList(),
                                            FFAppState().currentMemberId,
                                            widget!.rewardId,
                                            functions.rewardText(
                                                FFAppState().rewards.toList(),
                                                widget!.rewardId,
                                                'title'),
                                            false)!
                                        .toList()
                                        .cast<BuckTransactionStruct>();
                                    safeSetState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '🏳️ Quest quit. Pick a new treasure anytime!',
                                          style: GoogleFonts.sniglet(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  }
                                },
                                text: '🏳️ Quit this quest',
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00FFFFFF),
                                  textStyle: GoogleFonts.sniglet(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.0,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                              ),
                            ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                      Container(
                        height: 250.0,
                        child: Container(
                          child: custom_widgets.SquishieNav(
                            current: 'RewardRoadPage',
                            mode: 'dock',
                            role: functions.memberRole(
                                FFAppState().members.toList(),
                                FFAppState().currentMemberId),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 14.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
