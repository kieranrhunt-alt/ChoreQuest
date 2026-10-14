import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'quest_photo_sheet_widget.dart' show QuestPhotoSheetWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestPhotoSheetModel extends FlutterFlowModel<QuestPhotoSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for questPhotoUrl widget.
  FocusNode? questPhotoUrlFocusNode;
  TextEditingController? questPhotoUrlTextController;
  String? Function(BuildContext, String?)? questPhotoUrlTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questPhotoUrlFocusNode?.dispose();
    questPhotoUrlTextController?.dispose();
  }
}
