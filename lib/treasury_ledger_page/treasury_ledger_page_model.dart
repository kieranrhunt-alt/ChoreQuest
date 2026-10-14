import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'treasury_ledger_page_widget.dart' show TreasuryLedgerPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TreasuryLedgerPageModel
    extends FlutterFlowModel<TreasuryLedgerPageWidget> {
  ///  Local state fields for this page.

  String? kidId = '';

  String? filterKid = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for adjAmount widget.
  FocusNode? adjAmountFocusNode;
  TextEditingController? adjAmountTextController;
  String? Function(BuildContext, String?)? adjAmountTextControllerValidator;
  // State field(s) for adjReason widget.
  FocusNode? adjReasonFocusNode;
  TextEditingController? adjReasonTextController;
  String? Function(BuildContext, String?)? adjReasonTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    adjAmountFocusNode?.dispose();
    adjAmountTextController?.dispose();

    adjReasonFocusNode?.dispose();
    adjReasonTextController?.dispose();
  }
}
