import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'treasury_ledger_page_model.dart';
export 'treasury_ledger_page_model.dart';

/// Full family Parent Bucks ledger plus parent-issued bonuses / adjustments.
class TreasuryLedgerPageWidget extends StatefulWidget {
  const TreasuryLedgerPageWidget({super.key});

  static String routeName = 'TreasuryLedgerPage';
  static String routePath = '/treasury-ledger';

  @override
  State<TreasuryLedgerPageWidget> createState() =>
      _TreasuryLedgerPageWidgetState();
}

class _TreasuryLedgerPageWidgetState extends State<TreasuryLedgerPageWidget> {
  late TreasuryLedgerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreasuryLedgerPageModel());

    _model.adjAmountTextController ??= TextEditingController();
    _model.adjAmountFocusNode ??= FocusNode();

    _model.adjReasonTextController ??= TextEditingController();
    _model.adjReasonFocusNode ??= FocusNode();
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
                    scene: 'treasury',
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
                                buttonSize: 40.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color(0xFF2A1B4D),
                                  size: 24.0,
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
                                      'Treasury Ledger',
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.cinzel(
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Every coin earned or spent, in the royal record',
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.nunito(
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
                            ].divide(SizedBox(width: 10.0)),
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
                                'Grant or adjust gold',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.cinzel(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                              Container(
                                height: 44.0,
                                child: Builder(
                                  builder: (context) {
                                    final item = functions
                                            .kidsOnly(
                                                FFAppState().members.toList())
                                            ?.toList() ??
                                        [];

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: item.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 8.0),
                                      itemBuilder: (context, itemIndex) {
                                        final itemItem = item[itemIndex];
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            if (_model.kidId == itemItem.id)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.kidId = itemItem.id;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            999.0),
                                                    border: Border.all(
                                                      color: Color(0xFFB07A12),
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 9.0,
                                                                14.0, 9.0),
                                                    child: Text(
                                                      itemItem.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .nunito(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF2A1B4D),
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
                                                ),
                                              ),
                                            if (!(_model.kidId == itemItem.id))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.kidId = itemItem.id;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xF2FFFCF5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            999.0),
                                                    border: Border.all(
                                                      color: Color(0x99F2B53A),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 9.0,
                                                                14.0, 9.0),
                                                    child: Text(
                                                      itemItem.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .nunito(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF2A1B4D),
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
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    );
                                  },
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
                                    child: TextFormField(
                                      controller:
                                          _model.adjAmountTextController,
                                      focusNode: _model.adjAmountFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Amount (+/-)',
                                        hintText: '5 or -3',
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
                                      validator: _model
                                          .adjAmountTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      controller:
                                          _model.adjReasonTextController,
                                      focusNode: _model.adjReasonFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Reason',
                                        hintText: 'Act of kindness',
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
                                      validator: _model
                                          .adjReasonTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (functions.notEmpty(_model.kidId)!) {
                                    FFAppState().transactions = functions
                                        .addTx(
                                            FFAppState().transactions.toList(),
                                            _model.kidId,
                                            functions.parseIntOr(
                                                _model.adjAmountTextController
                                                    .text,
                                                0),
                                            functions.notEmpty(_model
                                                    .adjReasonTextController
                                                    .text)!
                                                ? _model.adjReasonTextController
                                                    .text
                                                : 'Royal decree')!
                                        .toList()
                                        .cast<BuckTransactionStruct>();
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.adjAmountTextController?.clear();
                                    });
                                    safeSetState(() {
                                      _model.adjReasonTextController?.clear();
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Recorded in the ledger',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pick a hero first',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  }
                                },
                                text: '📜 Add to ledger',
                                options: FFButtonOptions(
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: TextStyle(
                                    color: Color(0xFF2A1B4D),
                                  ),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
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
                                '📒 History',
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                            (FFMainAxisAlignment.start).flutterValue,
                        crossAxisAlignment:
                            (FFCrossAxisAlignment.center).flutterValue,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          if (_model.filterKid == '')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.filterKid = '';
                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
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
                                    'All heroes',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.nunito(
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
                          if (!(_model.filterKid == ''))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.filterKid = '';
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
                                    'All heroes',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.nunito(
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
                      Container(
                        height: 44.0,
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
                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                              itemBuilder: (context, itemIndex) {
                                final itemItem = item[itemIndex];
                                return Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    if (_model.filterKid == itemItem.id)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filterKid = itemItem.id;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color: Color(0xFFB07A12),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 9.0, 14.0, 9.0),
                                            child: Text(
                                              ((String? n, int? b) {
                                                return '$n · 🪙 $b';
                                              }(
                                                  itemItem.name,
                                                  functions.kidBalance(
                                                      FFAppState()
                                                          .transactions
                                                          .toList(),
                                                      itemItem.id)))!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.nunito(
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
                                                    color: Color(0xFF2A1B4D),
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
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!(_model.filterKid == itemItem.id))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filterKid = itemItem.id;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xF2FFFCF5),
                                            borderRadius:
                                                BorderRadius.circular(999.0),
                                            border: Border.all(
                                              color: Color(0x99F2B53A),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 9.0, 14.0, 9.0),
                                            child: Text(
                                              ((String? n, int? b) {
                                                return '$n · 🪙 $b';
                                              }(
                                                  itemItem.name,
                                                  functions.kidBalance(
                                                      FFAppState()
                                                          .transactions
                                                          .toList(),
                                                      itemItem.id)))!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.nunito(
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
                                                    color: Color(0xFF2A1B4D),
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
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if (functions
                              .txFor(FFAppState().transactions.toList(),
                                  _model.filterKid)
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
                              'No transactions yet.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.nunito(
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
                                      _model.filterKid)
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
                                                            GoogleFonts.nunito(
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
                                              functions.memberName(
                                                  FFAppState().members.toList(),
                                                  itemItem.kidId)!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.nunito(
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
                                            Text(
                                              dateTimeFormat("MMM d, h:mm a",
                                                  itemItem.timestamp!),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    font: GoogleFonts.nunito(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
