import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_styled_border.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'squishy_catalog_page_widget.dart' show SquishyCatalogPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SquishyCatalogPageModel
    extends FlutterFlowModel<SquishyCatalogPageWidget> {
  ///  Local state fields for this page.

  String? category = 'hat';

  String? art = 'crown';

  String? milestoneType = '';

  String? listCategory = 'all';

  ///  State fields for stateful widgets in this page.

  // State field(s) for itemName widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  // State field(s) for itemCost widget.
  FocusNode? itemCostFocusNode;
  TextEditingController? itemCostTextController;
  String? Function(BuildContext, String?)? itemCostTextControllerValidator;
  // State field(s) for itemThreshold widget.
  FocusNode? itemThresholdFocusNode;
  TextEditingController? itemThresholdTextController;
  String? Function(BuildContext, String?)? itemThresholdTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    itemNameFocusNode?.dispose();
    itemNameTextController?.dispose();

    itemCostFocusNode?.dispose();
    itemCostTextController?.dispose();

    itemThresholdFocusNode?.dispose();
    itemThresholdTextController?.dispose();
  }
}
