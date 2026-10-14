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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'found_kingdom_page_model.dart';
export 'found_kingdom_page_model.dart';

/// First-run setup: name your kingdom (family) and crown the ruler (parent
/// admin).
class FoundKingdomPageWidget extends StatefulWidget {
  const FoundKingdomPageWidget({super.key});

  static String routeName = 'FoundKingdomPage';
  static String routePath = '/found-kingdom';

  @override
  State<FoundKingdomPageWidget> createState() => _FoundKingdomPageWidgetState();
}

class _FoundKingdomPageWidgetState extends State<FoundKingdomPageWidget> {
  late FoundKingdomPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoundKingdomPageModel());

    _model.familyNameFieldTextController ??= TextEditingController();
    _model.familyNameFieldFocusNode ??= FocusNode();

    _model.parentNameFieldTextController ??= TextEditingController();
    _model.parentNameFieldFocusNode ??= FocusNode();

    _model.parentPinFieldTextController ??= TextEditingController();
    _model.parentPinFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    scene: 'castle',
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
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 170.0,
                          height: 170.0,
                          child: Container(
                            child: custom_widgets.SquishyAvatar(
                              animate: true,
                              look:
                                  'species:bear|color:#8E6CEF|hat:crown|gear:cape|fx:sparkles',
                              showBackground: false,
                            ),
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
                                'Found your kingdom',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.cinzel(
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
                                    ),
                              ),
                              Text(
                                'Build family habits. Make chores a quest.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.nunito(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                              TextFormField(
                                controller:
                                    _model.familyNameFieldTextController,
                                focusNode: _model.familyNameFieldFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Kingdom (family) name',
                                  hintText: 'House Rivera',
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
                                    .familyNameFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller:
                                    _model.parentNameFieldTextController,
                                focusNode: _model.parentNameFieldFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Your royal name (parent)',
                                  hintText: 'Queen Mom, King Dad...',
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
                                    .parentNameFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller: _model.parentPinFieldTextController,
                                focusNode: _model.parentPinFieldFocusNode,
                                obscureText: !_model.parentPinFieldVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Ruler PIN (optional)',
                                  hintText: 'Protects approvals',
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
                                          _model.parentPinFieldVisibility =
                                              !_model.parentPinFieldVisibility);
                                    },
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.parentPinFieldVisibility
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
                                    .parentPinFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (functions.isBlank(_model
                                      .familyNameFieldTextController.text)!) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please name your kingdom',
                                          style: TextStyle(),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                      ),
                                    );
                                  } else {
                                    if (functions.isBlank(_model
                                        .parentNameFieldTextController.text)!) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Please enter your royal name',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                        ),
                                      );
                                    } else {
                                      _model.parentId = functions.newId('m');
                                      safeSetState(() {});
                                      FFAppState().family = FamilyStruct(
                                        id: functions.newId('fam'),
                                        name: _model
                                            .familyNameFieldTextController.text,
                                      );
                                      safeSetState(() {});
                                      FFAppState().addToMembers(MemberStruct(
                                        id: _model.parentId,
                                        role: 'parent',
                                        name: _model
                                            .parentNameFieldTextController.text,
                                        age: 0,
                                        baseAvatar:
                                            'species:bear|color:#8E6CEF|hat:crown',
                                        pin: _model
                                            .parentPinFieldTextController.text,
                                      ));
                                      safeSetState(() {});
                                      FFAppState().currentMemberId =
                                          _model.parentId!;
                                      safeSetState(() {});
                                      FFAppState().rewards = functions
                                          .defaultRewards()!
                                          .toList()
                                          .cast<RewardStruct>();
                                      safeSetState(() {});
                                      FFAppState().avatarItems = functions
                                          .starterAvatarCatalog()!
                                          .toList()
                                          .cast<AvatarItemStruct>();
                                      safeSetState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Your kingdom is founded! Now add your heroes.',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                        ),
                                      );
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                          KnightsPageWidget.routeName);
                                    }
                                  }
                                },
                                text: '👑 Found our kingdom',
                                options: FFButtonOptions(
                                  height: 54.0,
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
                            ].divide(SizedBox(height: 14.0)),
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
