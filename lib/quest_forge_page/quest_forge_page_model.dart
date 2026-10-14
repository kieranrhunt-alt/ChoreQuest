import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'quest_forge_page_widget.dart' show QuestForgePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestForgePageModel extends FlutterFlowModel<QuestForgePageWidget> {
  ///  Local state fields for this page.

  int? buckValue = 2;

  String? assigneeId = '';

  String? recurrence = 'none';

  bool? requiresPhoto = false;

  DateTime? dueDate;

  bool? isEdit = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for questTitle widget.
  FocusNode? questTitleFocusNode;
  TextEditingController? questTitleTextController;
  String? Function(BuildContext, String?)? questTitleTextControllerValidator;
  // State field(s) for questDesc widget.
  FocusNode? questDescFocusNode;
  TextEditingController? questDescTextController;
  String? Function(BuildContext, String?)? questDescTextControllerValidator;
  // State field(s) for customValue widget.
  FocusNode? customValueFocusNode;
  TextEditingController? customValueTextController;
  String? Function(BuildContext, String?)? customValueTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Toggle widget.
  bool? toggleValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questTitleFocusNode?.dispose();
    questTitleTextController?.dispose();

    questDescFocusNode?.dispose();
    questDescTextController?.dispose();

    customValueFocusNode?.dispose();
    customValueTextController?.dispose();
  }
}
