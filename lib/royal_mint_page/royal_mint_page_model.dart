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
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'royal_mint_page_widget.dart' show RoyalMintPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RoyalMintPageModel extends FlutterFlowModel<RoyalMintPageWidget> {
  ///  Local state fields for this page.

  int? denomination = 5;

  String? kidName = '';

  String? theme = 'Classic';

  String? motto = '';

  String? emblem = 'squishie';

  int? perSheet = 6;

  String? border = 'solid';

  ///  State fields for stateful widgets in this page.

  // State field(s) for mintMottoLive widget.
  FocusNode? mintMottoLiveFocusNode;
  TextEditingController? mintMottoLiveTextController;
  String? Function(BuildContext, String?)? mintMottoLiveTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mintMottoLiveFocusNode?.dispose();
    mintMottoLiveTextController?.dispose();
  }
}
