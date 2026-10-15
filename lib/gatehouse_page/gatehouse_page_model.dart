import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_styled_border.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'gatehouse_page_widget.dart' show GatehousePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GatehousePageModel extends FlutterFlowModel<GatehousePageWidget> {
  ///  Local state fields for this page.

  String? selectedId = '';

  bool? showPin = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for pinField widget.
  FocusNode? pinFieldFocusNode;
  TextEditingController? pinFieldTextController;
  late bool pinFieldVisibility;
  String? Function(BuildContext, String?)? pinFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    pinFieldVisibility = false;
  }

  @override
  void dispose() {
    pinFieldFocusNode?.dispose();
    pinFieldTextController?.dispose();
  }
}
