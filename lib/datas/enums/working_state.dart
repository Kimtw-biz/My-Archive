import 'package:flutter/widgets.dart';

import '../../cores/localizations/app_localizations.dart';
import '../../cores/tokens/app_colors.dart';

enum WorkingState {
  active(
    "enum_working_state_active",
    AppColors.activeGreen,
  ),
  inactive(
    "enum_working_state_inactive",
    AppColors.inactiveRed,
  ),
  available(
    "enum_working_state_available",
    AppColors.availableBlue,
  );

  const WorkingState(
    this._transKey,
    this.displayColor,
  );
  final String _transKey;

  final Color displayColor;

  static WorkingState parse(int index) => WorkingState.values[index];

  String displayTitle(BuildContext context) => AppLocalizations.of(context)[_transKey];
}
