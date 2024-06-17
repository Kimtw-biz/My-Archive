import 'package:flutter/widgets.dart';

import '../../cores/localizations/app_localizations.dart';

enum ProjectCategory {
  internal("enum_project_category_internal"),
  cooperative("enum_project_category_cooperative"),
  outsourcing("enum_project_category_outsourcing"),
  other("enum_project_category_other");

  final String _transKey;

  const ProjectCategory(this._transKey);

  static ProjectCategory parse(int index) => ProjectCategory.values[index];

  String displayTitle(BuildContext context) => AppLocalizations.of(context)[_transKey];
}
