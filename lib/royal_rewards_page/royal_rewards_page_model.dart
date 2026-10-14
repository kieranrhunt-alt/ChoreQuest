import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'royal_rewards_page_widget.dart' show RoyalRewardsPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RoyalRewardsPageModel extends FlutterFlowModel<RoyalRewardsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Toggle widget.
  bool? toggleValue;
  // State field(s) for rewardTitle widget.
  FocusNode? rewardTitleFocusNode;
  TextEditingController? rewardTitleTextController;
  String? Function(BuildContext, String?)? rewardTitleTextControllerValidator;
  // State field(s) for rewardDesc widget.
  FocusNode? rewardDescFocusNode;
  TextEditingController? rewardDescTextController;
  String? Function(BuildContext, String?)? rewardDescTextControllerValidator;
  // State field(s) for rewardCost widget.
  FocusNode? rewardCostFocusNode;
  TextEditingController? rewardCostTextController;
  String? Function(BuildContext, String?)? rewardCostTextControllerValidator;
  // State field(s) for rewardIcon widget.
  FocusNode? rewardIconFocusNode;
  TextEditingController? rewardIconTextController;
  String? Function(BuildContext, String?)? rewardIconTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    rewardTitleFocusNode?.dispose();
    rewardTitleTextController?.dispose();

    rewardDescFocusNode?.dispose();
    rewardDescTextController?.dispose();

    rewardCostFocusNode?.dispose();
    rewardCostTextController?.dispose();

    rewardIconFocusNode?.dispose();
    rewardIconTextController?.dispose();
  }
}
