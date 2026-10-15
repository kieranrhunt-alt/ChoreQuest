import '/backend/schema/structs/index.dart';
import '/components/royal_deny_sheet_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_styled_border.dart';
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
import 'throne_room_page_model.dart';
export 'throne_room_page_model.dart';

/// Parent control center: approvals, family balances, and royal tools.
class ThroneRoomPageWidget extends StatefulWidget {
  const ThroneRoomPageWidget({super.key});

  static String routeName = 'ThroneRoomPage';
  static String routePath = '/throne-room';

  @override
  State<ThroneRoomPageWidget> createState() => _ThroneRoomPageWidgetState();
}

class _ThroneRoomPageWidgetState extends State<ThroneRoomPageWidget> {
  late ThroneRoomPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThroneRoomPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().quests = functions
          .generateRecurring(FFAppState().quests.toList())!
          .toList()
          .cast<QuestStruct>();
      safeSetState(() {});
      FFAppState().avatarItems = functions
          .upgradeCatalog(FFAppState().avatarItems.toList())!
          .toList()
          .cast<AvatarItemStruct>();
      safeSetState(() {});
    });
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
                    scene: 'throne',
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
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.center).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Container(
                                width: 64.0,
                                height: 64.0,
                                child: Container(
                                  child: custom_widgets.SquishyAvatar(
                                    animate: false,
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
                                      'Throne Room',
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
                                    ),
                                    Text(
                                      ((String? n, String? f) {
                                        return '$n of $f';
                                      }(
                                          functions.memberName(
                                              FFAppState().members.toList(),
                                              FFAppState().currentMemberId),
                                          FFAppState().family.name))!,
                                      maxLines: 1,
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
                                  ],
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 14.0,
                                buttonSize: 52.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                icon: Icon(
                                  Icons.switch_account,
                                  color: Color(0xFF2A1B4D),
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context
                                      .pushNamed(GatehousePageWidget.routeName);
                                },
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
                                    '💰 Royal treasury',
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
                      Container(
                        height: 158.0,
                        child: Builder(
                          builder: (context) {
                            final item = functions
                                    .kidsOnly(FFAppState().members.toList())
                                    ?.toList() ??
                                [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: item.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: 10.0),
                              itemBuilder: (context, itemIndex) {
                                final itemItem = item[itemIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(KnightsPageWidget.routeName);
                                  },
                                  child: Container(
                                    width: 128.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xF2FFFCF5),
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
                                            (FFCrossAxisAlignment.center)
                                                .flutterValue,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Container(
                                            width: 76.0,
                                            height: 76.0,
                                            child: Container(
                                              child:
                                                  custom_widgets.SquishyAvatar(
                                                animate: false,
                                                look: functions.avatarLook(
                                                    FFAppState()
                                                        .members
                                                        .toList(),
                                                    FFAppState()
                                                        .wardrobe
                                                        .toList(),
                                                    FFAppState()
                                                        .avatarItems
                                                        .toList(),
                                                    itemItem.id,
                                                    ''),
                                                showBackground: true,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            itemItem.name,
                                            maxLines: 1,
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
                                            ((int? v) {
                                              return '🪙 $v';
                                            }(functions.kidBalance(
                                                FFAppState()
                                                    .transactions
                                                    .toList(),
                                                itemItem.id)))!,
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
                                                  color: Color(0xFFB07A12),
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
                                          ),
                                        ].divide(SizedBox(height: 2.0)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if (functions
                              .kidsOnly(FFAppState().members.toList())
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
                              'No heroes yet — add them in Knights & Royals.',
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.start).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.center).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 7.0, 16.0, 7.0),
                                  child: Text(
                                    '📜 Quests to review',
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
                                          color: Colors.white,
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
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(999.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 4.0, 10.0, 4.0),
                              child: Text(
                                functions
                                    .parentQuests(
                                        FFAppState().quests.toList(), 'review')!
                                    .length
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.sniglet(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      if (functions
                              .parentQuests(
                                  FFAppState().quests.toList(), 'review')
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
                              'All caught up — nothing waiting for approval.',
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
                                  .parentQuests(
                                      FFAppState().quests.toList(), 'review')
                                  ?.toList() ??
                              [];

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: item.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
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
                                  padding: EdgeInsets.all(16.0),
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
                                          Container(
                                            width: 44.0,
                                            height: 44.0,
                                            child: Container(
                                              child:
                                                  custom_widgets.SquishyAvatar(
                                                animate: false,
                                                look: functions.avatarLook(
                                                    FFAppState()
                                                        .members
                                                        .toList(),
                                                    FFAppState()
                                                        .wardrobe
                                                        .toList(),
                                                    FFAppState()
                                                        .avatarItems
                                                        .toList(),
                                                    functions
                                                        .questOwnerId(itemItem),
                                                    ''),
                                                showBackground: false,
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
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  itemItem.title,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  ((String? n) {
                                                    return 'by $n';
                                                  }(functions.memberName(
                                                      FFAppState()
                                                          .members
                                                          .toList(),
                                                      functions.questOwnerId(
                                                          itemItem))))!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.sniglet(
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                              ],
                                            ),
                                          ),
                                          Text(
                                            ((int? v) {
                                              return '🪙 $v';
                                            }(itemItem.buckValue))!,
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
                                                  color: Color(0xFFB07A12),
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
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                      if (functions
                                              .notEmpty(itemItem.photoUrl) ??
                                          true)
                                        Text(
                                          itemItem.photoUrl,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                          Expanded(
                                            flex: 1,
                                            child: Container(
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
                                                  begin: AlignmentDirectional(
                                                      1.0, 0.0),
                                                  end: AlignmentDirectional(
                                                      -1.0, 0),
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
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              RoyalDenySheetWidget(
                                                            questId:
                                                                itemItem.id,
                                                            questTitle:
                                                                itemItem.title,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                text: '🚫 Deny',
                                                options: FFButtonOptions(
                                                  height: 58.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00FFFFFF),
                                                  textStyle:
                                                      GoogleFonts.sniglet(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
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
                                                  end: AlignmentDirectional(
                                                      -1.0, 0),
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
                                                  FFAppState().quests =
                                                      functions
                                                          .reviewQuest(
                                                              FFAppState()
                                                                  .quests
                                                                  .toList(),
                                                              itemItem.id,
                                                              true,
                                                              '')!
                                                          .toList()
                                                          .cast<QuestStruct>();
                                                  safeSetState(() {});
                                                  FFAppState().submissions =
                                                      functions
                                                          .reviewSubmission(
                                                              FFAppState()
                                                                  .submissions
                                                                  .toList(),
                                                              itemItem.id,
                                                              true,
                                                              '')!
                                                          .toList()
                                                          .cast<
                                                              SubmissionStruct>();
                                                  safeSetState(() {});
                                                  FFAppState().transactions =
                                                      functions
                                                          .questEarnTx(
                                                              FFAppState()
                                                                  .transactions
                                                                  .toList(),
                                                              itemItem)!
                                                          .toList()
                                                          .cast<
                                                              BuckTransactionStruct>();
                                                  safeSetState(() {});
                                                  FFAppState().transactions =
                                                      functions
                                                          .applyMilestoneTxs(
                                                              FFAppState()
                                                                  .transactions
                                                                  .toList(),
                                                              FFAppState()
                                                                  .wardrobe
                                                                  .toList(),
                                                              FFAppState()
                                                                  .avatarItems
                                                                  .toList(),
                                                              FFAppState()
                                                                  .quests
                                                                  .toList(),
                                                              functions
                                                                  .questOwnerId(
                                                                      itemItem))!
                                                          .toList()
                                                          .cast<
                                                              BuckTransactionStruct>();
                                                  safeSetState(() {});
                                                  FFAppState().wardrobe = functions
                                                      .applyMilestoneWardrobe(
                                                          FFAppState()
                                                              .wardrobe
                                                              .toList(),
                                                          FFAppState()
                                                              .avatarItems
                                                              .toList(),
                                                          FFAppState()
                                                              .quests
                                                              .toList(),
                                                          functions
                                                              .questOwnerId(
                                                                  itemItem))!
                                                      .toList()
                                                      .cast<
                                                          WardrobeEntryStruct>();
                                                  safeSetState(() {});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Approved — gold awarded and logged ✅',
                                                        style:
                                                            GoogleFonts.sniglet(
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                    ),
                                                  );
                                                },
                                                text: '✅ Approve',
                                                options: FFButtonOptions(
                                                  height: 58.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00FFFFFF),
                                                  textStyle:
                                                      GoogleFonts.sniglet(
                                                    color: Color(0xFF0E3B2E),
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
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
                                    '🎁 Treasure requests',
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
                                  'pending', '')
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
                              'No requests right now.',
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
                                      'pending',
                                      '')
                                  ?.toList() ??
                              [];

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: item.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
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
                                  padding: EdgeInsets.all(16.0),
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
                                          Container(
                                            width: 44.0,
                                            height: 44.0,
                                            child: Container(
                                              child:
                                                  custom_widgets.SquishyAvatar(
                                                animate: false,
                                                look: functions.avatarLook(
                                                    FFAppState()
                                                        .members
                                                        .toList(),
                                                    FFAppState()
                                                        .wardrobe
                                                        .toList(),
                                                    FFAppState()
                                                        .avatarItems
                                                        .toList(),
                                                    itemItem.kidId,
                                                    ''),
                                                showBackground: false,
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
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  itemItem.title,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  ((String? t, String? n,
                                                          int? b) {
                                                    return '$t · $n has 🪙 $b';
                                                  }(
                                                      (itemItem.targetType ==
                                                              'avatar_item'
                                                          ? 'Squishy style'
                                                          : 'Reward'),
                                                      functions.memberName(
                                                          FFAppState()
                                                              .members
                                                              .toList(),
                                                          itemItem.kidId),
                                                      functions.kidBalance(
                                                          FFAppState()
                                                              .transactions
                                                              .toList(),
                                                          itemItem.kidId)))!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.sniglet(
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                              ],
                                            ),
                                          ),
                                          Text(
                                            ((int? v) {
                                              return '🪙 $v';
                                            }(itemItem.cost))!,
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
                                                  color: Color(0xFFB07A12),
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
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
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
                                          Expanded(
                                            flex: 1,
                                            child: Container(
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
                                                  begin: AlignmentDirectional(
                                                      1.0, 0.0),
                                                  end: AlignmentDirectional(
                                                      -1.0, 0),
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
                                                  FFAppState().redemptions =
                                                      functions
                                                          .setRedemptionStatus(
                                                              FFAppState()
                                                                  .redemptions
                                                                  .toList(),
                                                              itemItem.id,
                                                              'declined')!
                                                          .toList()
                                                          .cast<
                                                              RedemptionStruct>();
                                                  safeSetState(() {});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Request declined',
                                                        style:
                                                            GoogleFonts.sniglet(
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                    ),
                                                  );
                                                },
                                                text: '🙅 Decline',
                                                options: FFButtonOptions(
                                                  height: 58.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00FFFFFF),
                                                  textStyle:
                                                      GoogleFonts.sniglet(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
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
                                                  end: AlignmentDirectional(
                                                      -1.0, 0),
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
                                                  if (functions.canAfford(
                                                      FFAppState()
                                                          .transactions
                                                          .toList(),
                                                      itemItem.kidId,
                                                      itemItem.cost)!) {
                                                    FFAppState().redemptions =
                                                        functions
                                                            .setRedemptionStatus(
                                                                FFAppState()
                                                                    .redemptions
                                                                    .toList(),
                                                                itemItem.id,
                                                                'approved')!
                                                            .toList()
                                                            .cast<
                                                                RedemptionStruct>();
                                                    safeSetState(() {});
                                                    FFAppState().transactions =
                                                        functions
                                                            .spendTx(
                                                                FFAppState()
                                                                    .transactions
                                                                    .toList(),
                                                                itemItem)!
                                                            .toList()
                                                            .cast<
                                                                BuckTransactionStruct>();
                                                    safeSetState(() {});
                                                    if (itemItem.targetType ==
                                                        'avatar_item') {
                                                      FFAppState().wardrobe = functions
                                                          .grantItem(
                                                              FFAppState()
                                                                  .wardrobe
                                                                  .toList(),
                                                              itemItem.kidId,
                                                              itemItem
                                                                  .avatarItemId,
                                                              'purchased')!
                                                          .toList()
                                                          .cast<
                                                              WardrobeEntryStruct>();
                                                      safeSetState(() {});
                                                    }
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Approved — gold deducted and logged ✅',
                                                          style: GoogleFonts
                                                              .sniglet(
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Not enough Parent Bucks for this one yet',
                                                          style: GoogleFonts
                                                              .sniglet(
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                      ),
                                                    );
                                                  }
                                                },
                                                text: '✅ Approve',
                                                options: FFButtonOptions(
                                                  height: 58.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00FFFFFF),
                                                  textStyle:
                                                      GoogleFonts.sniglet(
                                                    color: Color(0xFF0E3B2E),
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20.0,
                                                  ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
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
                                    '🏰 Royal tools',
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
                      Container(
                        height: 250.0,
                        child: Container(
                          child: custom_widgets.SquishieNav(
                            current: 'ThroneRoomPage',
                            mode: 'carousel',
                            role: 'parent',
                          ),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        child: Container(
                          child: custom_widgets.SquishieNav(
                            current: 'ThroneRoomPage',
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
