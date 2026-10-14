import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gatehouse_page_model.dart';
export 'gatehouse_page_model.dart';

/// Castle gatehouse: choose your hero or ruler profile (optional PIN).
class GatehousePageWidget extends StatefulWidget {
  const GatehousePageWidget({super.key});

  static String routeName = 'GatehousePage';
  static String routePath = '/gatehouse';

  @override
  State<GatehousePageWidget> createState() => _GatehousePageWidgetState();
}

class _GatehousePageWidgetState extends State<GatehousePageWidget> {
  late GatehousePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GatehousePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (functions.isBlank(FFAppState().family.name)!) {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(FoundKingdomPageWidget.routeName);
      } else {
        FFAppState().avatarItems = functions
            .upgradeCatalog(FFAppState().avatarItems.toList())!
            .toList()
            .cast<AvatarItemStruct>();
        safeSetState(() {});
      }
    });

    _model.pinFieldTextController ??= TextEditingController();
    _model.pinFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Opacity(
      opacity: 0.9,
      child: GestureDetector(
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
                      scene: 'castle',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 40.0),
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
                            colors: [Color(0xFF6B47D6), Color(0xFF3E2490)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(1.0, 1.0),
                            end: AlignmentDirectional(-1.0, -1.0),
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.center).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                child: Container(
                                  child: custom_widgets.ChoreQuestLogo(
                                    animate: false,
                                    showTitle: false,
                                    titleFontFamily: '',
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
                                      'ChoreQuest',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.cinzel(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      FFAppState().family.name,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.nunito(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFF7E7B5),
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
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
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
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  spreadRadius: 0.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(999.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).tertiary,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 7.0, 16.0, 7.0),
                              child: Text(
                                '⚔️ Who enters the castle?',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.nunito(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
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
                        ],
                      ),
                      if (_model.showPin ?? true)
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
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.stretch).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  ((String? n) {
                                    return 'Secret PIN for $n';
                                  }(functions.memberName(
                                      FFAppState().members.toList(),
                                      _model.selectedId)))!,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.cinzel(
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
                                      ),
                                ),
                                TextFormField(
                                  controller: _model.pinFieldTextController,
                                  focusNode: _model.pinFieldFocusNode,
                                  obscureText: !_model.pinFieldVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Enter PIN',
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
                                    suffixIcon: InkWell(
                                      onTap: () async {
                                        safeSetState(() =>
                                            _model.pinFieldVisibility =
                                                !_model.pinFieldVisibility);
                                      },
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.pinFieldVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(),
                                  keyboardType:
                                      (FFKeyboardType.number).flutterValue,
                                  validator: _model
                                      .pinFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.showPin = false;
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.pinFieldTextController
                                                ?.clear();
                                          });
                                        },
                                        text: 'Cancel',
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.pinFieldTextController
                                                  .text ==
                                              functions.memberPin(
                                                  FFAppState().members.toList(),
                                                  _model.selectedId)) {
                                            FFAppState().currentMemberId =
                                                _model.selectedId!;
                                            safeSetState(() {});
                                            _model.showPin = false;
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.pinFieldTextController
                                                  ?.clear();
                                            });
                                            if (functions.memberRole(
                                                    FFAppState()
                                                        .members
                                                        .toList(),
                                                    _model.selectedId) ==
                                                'parent') {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                  ThroneRoomPageWidget
                                                      .routeName);
                                            } else {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                  HeroHomePageWidget.routeName);
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'That PIN is not right. Try again!',
                                                  style: TextStyle(),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                              ),
                                            );
                                          }
                                        },
                                        text: '🔓 Unlock',
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          textStyle: TextStyle(
                                            color: Color(0xFF2A1B4D),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          final item = FFAppState().members.toList();

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              childAspectRatio: 0.76,
                            ),
                            shrinkWrap: true,
                            itemCount: item.length,
                            itemBuilder: (context, itemIndex) {
                              final itemItem = item[itemIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (functions.notEmpty(itemItem.pin)!) {
                                    _model.selectedId = itemItem.id;
                                    safeSetState(() {});
                                    _model.showPin = true;
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().currentMemberId = itemItem.id;
                                    safeSetState(() {});
                                    if (functions.memberRole(
                                            FFAppState().members.toList(),
                                            itemItem.id) ==
                                        'parent') {
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                          ThroneRoomPageWidget.routeName);
                                    } else {
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                          HeroHomePageWidget.routeName);
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xF2FFFCF5),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 14.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          4.0,
                                        ),
                                        spreadRadius: 0.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
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
                                          width: 112.0,
                                          height: 112.0,
                                          child: Container(
                                            child: custom_widgets.SquishyAvatar(
                                              look: functions.avatarLook(
                                                  FFAppState().members.toList(),
                                                  FFAppState()
                                                      .wardrobe
                                                      .toList(),
                                                  FFAppState()
                                                      .avatarItems
                                                      .toList(),
                                                  itemItem.id,
                                                  ''),
                                              animate: false,
                                              showBackground: true,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          itemItem.name,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.cinzel(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          functions.memberTitle(
                                              FFAppState().members.toList(),
                                              itemItem.id)!,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.nunito(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 14.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
