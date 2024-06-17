import 'package:flutter/material.dart';

import '../../cores/localizations/app_localizations.dart';

enum TechCategory {
  language("enum_tech_category_language"),
  mobile("enum_tech_category_mobile"),
  frontend("enum_tech_category_frontend"),
  backend("enum_tech_category_backend"),
  database("enum_tech_category_database"),
  devops("enum_tech_category_devops"),
  graphic("enum_tech_category_graphic"),
  design("enum_tech_category_design"),
  tools("enum_tech_category_tools");

  final String _transKey;

  const TechCategory(this._transKey);

  static TechCategory parse(int index) => TechCategory.values[index];

  String displayTitle(BuildContext context) => AppLocalizations.of(context)[_transKey];
}
