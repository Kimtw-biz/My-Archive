import 'package:flutter/material.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_colors.dart';

class ContactsTitleText extends StatelessWidget {
  const ContactsTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)["label_contacts"],
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontWeight: FontWeight.normal,
            color: AppColors.white,
          ),
    );
  }
}
