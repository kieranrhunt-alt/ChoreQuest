import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'royal_submit_sheet_widget.dart' show RoyalSubmitSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RoyalSubmitSheetModel extends FlutterFlowModel<RoyalSubmitSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for photoUrlField widget.
  FocusNode? photoUrlFieldFocusNode;
  TextEditingController? photoUrlFieldTextController;
  String? Function(BuildContext, String?)? photoUrlFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    photoUrlFieldFocusNode?.dispose();
    photoUrlFieldTextController?.dispose();
  }
}
