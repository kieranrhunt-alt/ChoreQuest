import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'knights_page_widget.dart' show KnightsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KnightsPageModel extends FlutterFlowModel<KnightsPageWidget> {
  ///  Local state fields for this page.

  String? newSpecies = 'bunny';

  String? newColor = '#F8B6C8';

  String? newClass = 'knight';

  ///  State fields for stateful widgets in this page.

  // State field(s) for kidName widget.
  FocusNode? kidNameFocusNode;
  TextEditingController? kidNameTextController;
  String? Function(BuildContext, String?)? kidNameTextControllerValidator;
  // State field(s) for kidAge widget.
  FocusNode? kidAgeFocusNode;
  TextEditingController? kidAgeTextController;
  String? Function(BuildContext, String?)? kidAgeTextControllerValidator;
  // State field(s) for kidPin widget.
  FocusNode? kidPinFocusNode;
  TextEditingController? kidPinTextController;
  late bool kidPinVisibility;
  String? Function(BuildContext, String?)? kidPinTextControllerValidator;

  @override
  void initState(BuildContext context) {
    kidPinVisibility = false;
  }

  @override
  void dispose() {
    kidNameFocusNode?.dispose();
    kidNameTextController?.dispose();

    kidAgeFocusNode?.dispose();
    kidAgeTextController?.dispose();

    kidPinFocusNode?.dispose();
    kidPinTextController?.dispose();
  }
}
