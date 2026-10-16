import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'squishy_shop_page_model.dart';
export 'squishy_shop_page_model.dart';

/// Kids browse squishy styles shown on their own squishy, request purchases,
/// and track milestone progress.
class SquishyShopPageWidget extends StatefulWidget {
  const SquishyShopPageWidget({super.key});

  static String routeName = 'SquishyShopPage';
  static String routePath = '/squishy-shop';

  @override
  State<SquishyShopPageWidget> createState() => _SquishyShopPageWidgetState();
}

class _SquishyShopPageWidgetState extends State<SquishyShopPageWidget>
    with TickerProviderStateMixin {
  late SquishyShopPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SquishyShopPageModel());

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
                    scene: 'toyshop',
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
                                      'Squishie Shop',
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
                                      ((int? b) {
                                        return 'You have 🪙 $b gold';
                                      }(functions.kidBalance(
                                          FFAppState().transactions.toList(),
                                          FFAppState().currentMemberId)))!,
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.start).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.center).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            if (_model.category == 'all')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'all';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '⭐ All',
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
                            if (!(_model.category == 'all'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'all';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '⭐ All',
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
                            if (_model.category == 'holiday')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'holiday';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🎉 Holiday',
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
                            if (!(_model.category == 'holiday'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'holiday';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🎉 Holiday',
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
                            if (_model.category == 'species')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'species';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🐾 Squishie',
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
                            if (!(_model.category == 'species'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'species';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🐾 Squishie',
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
                            if (_model.category == 'color')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'color';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🎨 Color',
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
                            if (!(_model.category == 'color'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'color';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🎨 Color',
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
                            if (_model.category == 'texture')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'texture';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🧶 Texture',
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
                            if (!(_model.category == 'texture'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'texture';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🧶 Texture',
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
                            if (_model.category == 'fill')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'fill';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🫧 Filler',
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
                            if (!(_model.category == 'fill'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'fill';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🫧 Filler',
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
                            if (_model.category == 'hat')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'hat';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🎩 Head',
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
                            if (!(_model.category == 'hat'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'hat';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🎩 Head',
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
                            if (_model.category == 'gear')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'gear';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '💪 Arm',
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
                            if (!(_model.category == 'gear'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'gear';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '💪 Arm',
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
                            if (_model.category == 'background')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'background';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🏰 Realm',
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
                            if (!(_model.category == 'background'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'background';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '🏰 Realm',
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
                            if (_model.category == 'effect')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'effect';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0xFFB07A12),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '✨ Aura',
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
                            if (!(_model.category == 'effect'))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.category = 'effect';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    borderRadius: BorderRadius.circular(999.0),
                                    border: Border.all(
                                      color: Color(0x99F2B53A),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 9.0, 14.0, 9.0),
                                    child: Text(
                                      '✨ Aura',
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
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final item = functions
                                  .itemsByCategory(
                                      FFAppState().avatarItems.toList(),
                                      _model.category)
                                  ?.toList() ??
                              [];

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              childAspectRatio: 0.48,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: item.length,
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
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        (FFMainAxisAlignment.start)
                                            .flutterValue,
                                    crossAxisAlignment:
                                        (FFCrossAxisAlignment.stretch)
                                            .flutterValue,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        children: [
                                          Container(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 128.0,
                                              height: 128.0,
                                              child: Container(
                                                child: custom_widgets
                                                    .SquishyAvatar(
                                                  look: functions.itemLook(
                                                      itemItem,
                                                      FFAppState()
                                                          .members
                                                          .toList(),
                                                      FFAppState()
                                                          .currentMemberId),
                                                  animate: false,
                                                  showBackground: true,
                                                  burstKey: functions.ownsItem(
                                                          FFAppState()
                                                              .wardrobe
                                                              .toList(),
                                                          FFAppState()
                                                              .currentMemberId,
                                                          itemItem.id)!
                                                      ? 'owned'
                                                      : '',
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (functions.ownsItem(
                                                  FFAppState()
                                                      .wardrobe
                                                      .toList(),
                                                  FFAppState().currentMemberId,
                                                  itemItem.id) ??
                                              true)
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        999.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 3.0, 8.0, 3.0),
                                                child: Text(
                                                  '✅ Mine',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.sniglet(
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
                                                        color: Colors.white,
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
                                              ),
                                            ),
                                        ],
                                      ),
                                      Text(
                                        itemItem.name,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
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
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        ((String? c, String? p) {
                                          return '$c · $p';
                                        }(
                                            functions.categoryLabel(
                                                itemItem.category),
                                            functions
                                                .itemPriceLabel(itemItem)))!,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.sniglet(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                                      if (functions.hasMilestone(itemItem) ??
                                          true)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.center)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            CircularPercentIndicator(
                                              percent: functions.milestoneRatio(
                                                  itemItem,
                                                  FFAppState().quests.toList(),
                                                  FFAppState()
                                                      .currentMemberId)!,
                                              radius: 15.0,
                                              lineWidth: 4.0,
                                              animation: false,
                                              animateFromLastPercent: true,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                functions.milestoneText(
                                                    itemItem,
                                                    FFAppState()
                                                        .quests
                                                        .toList(),
                                                    FFAppState()
                                                        .currentMemberId)!,
                                                maxLines: 3,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                            ),
                                          ].divide(SizedBox(width: 6.0)),
                                        ),
                                      if (functions.hasPending(
                                              FFAppState().redemptions.toList(),
                                              FFAppState().currentMemberId,
                                              itemItem.id) ??
                                          true)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              '⏳ Waiting for ruler',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.sniglet(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      if (functions.canBuyItem(
                                              itemItem,
                                              FFAppState().wardrobe.toList(),
                                              FFAppState().redemptions.toList(),
                                              FFAppState().currentMemberId) ??
                                          true)
                                        Container(
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
                                              begin: AlignmentDirectional(
                                                  1.0, 0.0),
                                              end:
                                                  AlignmentDirectional(-1.0, 0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: Color(0xD9FFFFFF),
                                              width: 2.5,
                                            ),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (functions.canAfford(
                                                  FFAppState()
                                                      .transactions
                                                      .toList(),
                                                  FFAppState().currentMemberId,
                                                  itemItem.buckCost)!) {
                                                FFAppState().transactions = functions
                                                    .shopBuyTx(
                                                        FFAppState()
                                                            .transactions
                                                            .toList(),
                                                        FFAppState()
                                                            .currentMemberId,
                                                        itemItem.name,
                                                        itemItem.buckCost)!
                                                    .toList()
                                                    .cast<
                                                        BuckTransactionStruct>();
                                                safeSetState(() {});
                                                FFAppState().wardrobe = functions
                                                    .grantItem(
                                                        FFAppState()
                                                            .wardrobe
                                                            .toList(),
                                                        FFAppState()
                                                            .currentMemberId,
                                                        itemItem.id,
                                                        'purchased')!
                                                    .toList()
                                                    .cast<
                                                        WardrobeEntryStruct>();
                                                safeSetState(() {});
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      '✨ It is yours! Find it in the Squishie Studio to wear it.',
                                                      style: TextStyle(),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Not enough gold yet — keep questing! 💪',
                                                      style: TextStyle(),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                  ),
                                                );
                                              }
                                            },
                                            text: ((int? c) {
                                              return '🛍️ Buy 🪙 $c';
                                            }(itemItem.buckCost))!,
                                            options: FFButtonOptions(
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00FFFFFF),
                                              textStyle: TextStyle(
                                                color: Color(0xFF3A2400),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                      if (functions.ownsItem(
                                              FFAppState().wardrobe.toList(),
                                              FFAppState().currentMemberId,
                                              itemItem.id) ??
                                          true)
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0.0,
                                                color: Color(0xFF167A5A),
                                                offset: Offset(
                                                  0.0,
                                                  4.0,
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
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: Color(0xD9FFFFFF),
                                              width: 2.5,
                                            ),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                  SquishyStudioPageWidget
                                                      .routeName);
                                            },
                                            text: '🧸 Wear it!',
                                            options: FFButtonOptions(
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00FFFFFF),
                                              textStyle: TextStyle(
                                                color: Color(0xFF0E3B2E),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 5.0)),
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
                            current: 'SquishyShopPage',
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
