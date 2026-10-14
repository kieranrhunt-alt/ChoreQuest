import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'found_kingdom_page_widget.dart' show FoundKingdomPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoundKingdomPageModel extends FlutterFlowModel<FoundKingdomPageWidget> {
  ///  Local state fields for this page.

  String? parentId = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for familyNameField widget.
  FocusNode? familyNameFieldFocusNode;
  TextEditingController? familyNameFieldTextController;
  String? Function(BuildContext, String?)?
      familyNameFieldTextControllerValidator;
  // State field(s) for parentNameField widget.
  FocusNode? parentNameFieldFocusNode;
  TextEditingController? parentNameFieldTextController;
  String? Function(BuildContext, String?)?
      parentNameFieldTextControllerValidator;
  // State field(s) for parentPinField widget.
  FocusNode? parentPinFieldFocusNode;
  TextEditingController? parentPinFieldTextController;
  late bool parentPinFieldVisibility;
  String? Function(BuildContext, String?)?
      parentPinFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    parentPinFieldVisibility = false;
  }

  @override
  void dispose() {
    familyNameFieldFocusNode?.dispose();
    familyNameFieldTextController?.dispose();

    parentNameFieldFocusNode?.dispose();
    parentNameFieldTextController?.dispose();

    parentPinFieldFocusNode?.dispose();
    parentPinFieldTextController?.dispose();
  }
}
