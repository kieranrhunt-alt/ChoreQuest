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
import 'my_treasure_page_model.dart';
export 'my_treasure_page_model.dart';

/// Kid wallet: gold balance, history, and request status.
class MyTreasurePageWidget extends StatefulWidget {
  const MyTreasurePageWidget({super.key});

  static String routeName = 'MyTreasurePage';
  static String routePath = '/my-treasure';

  @override
  State<MyTreasurePageWidget> createState() => _MyTreasurePageWidgetState();
}

class _MyTreasurePageWidgetState extends State<MyTreasurePageWidget>
    with TickerProviderStateMixin {
  late MyTreasurePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyTreasurePageModel());

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
                    animate: true,
                    scene: 'treasure',
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
                                      'My Gold',
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
                                      'Every coin you earned and spent',
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
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16.0,
                              color: Color(0x40000000),
                              offset: Offset(
                                0.0,
                                5.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFE27A),
                              Color(0xFFF2B53A),
                              Color(0xFFD79A1E)
                            ],
                            stops: [0.0, 0.6, 1.0],
                            begin: AlignmentDirectional(1.0, 1.0),
                            end: AlignmentDirectional(-1.0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(26.0),
                          border: Border.all(
                            color: Color(0xFFB07A12),
                            width: 2.5,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.center).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                width: 96.0,
                                height: 96.0,
                                child: Container(
                                  child: custom_widgets.SquishyAvatar(
                                    animate: true,
                                    look: functions.avatarLook(
                                        FFAppState().members.toList(),
                                        FFAppState().wardrobe.toList(),
                                        FFAppState().avatarItems.toList(),
                                        FFAppState().currentMemberId,
                                        ''),
                                    showBackground: true,
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
                                      'Treasure chest',
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
                                        color: Color(0xFF2A1B4D),
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
                                    ),
                                    Text(
                                      ((int? v) {
                                        return '🪙 $v';
                                      }(functions.kidBalance(
                                          FFAppState().transactions.toList(),
                                          FFAppState().currentMemberId)))!,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                        font: GoogleFonts.sniglet(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF2A1B4D),
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
                                    Text(
                                      'Parent Bucks · no cash value',
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
                                            color: Color(0xFF2A1B4D),
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
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 14.0)),
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
                                    '🎁 My requests',
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
                              .redemptionsBy(FFAppState().redemptions.toList(),
                                  '', FFAppState().currentMemberId)
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
                              'No requests yet. Visit the shops!',
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
                                  .redemptionsBy(
                                      FFAppState().redemptions.toList(),
                                      '',
                                      FFAppState().currentMemberId)
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
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          itemItem.title,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.sniglet(
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
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        functions.statusLabel(itemItem.status)!,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              );
                            },
                          );
                        },
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
                                    '📒 History',
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
                              .txFor(FFAppState().transactions.toList(),
                                  FFAppState().currentMemberId)
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
                              'Finish a quest to earn your first gold!',
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
                                  .txFor(FFAppState().transactions.toList(),
                                      FFAppState().currentMemberId)
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
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: Color(0x99F2B53A),
                                    width: 1.0,
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
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          functions.isPositive(itemItem.amount)!
                                              ? '🪙'
                                              : '🎁',
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                              itemItem.reason,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.sniglet(
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
                                                        letterSpacing: 0.0,
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
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              dateTimeFormat("MMM d, h:mm a",
                                                  itemItem.timestamp!),
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
                                      if (functions
                                              .isPositive(itemItem.amount) ??
                                          true)
                                        Text(
                                          functions
                                              .signedAmount(itemItem.amount)!,
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
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                        ),
                                      if (!functions
                                          .isPositive(itemItem.amount)!)
                                        Text(
                                          functions
                                              .signedAmount(itemItem.amount)!,
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
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                        ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Container(
                        height: 250.0,
                        child: Container(
                          child: custom_widgets.SquishieNav(
                            current: 'MyTreasurePage',
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
