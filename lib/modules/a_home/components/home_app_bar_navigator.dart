import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../blocs/home_page_cubit.dart';
import '../forms/home_app_bar_menu_button_form.dart';

class HomeAppBarNavigator extends StatelessWidget {
  const HomeAppBarNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoLayout.horizontal(
      mainAxisSize: MainAxisSize.min,
      mainAxisGap: AppSizes.horizontalGapSmall,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeAppBarMenuButtonForm(
          label: AppLocalizations.of(context)["button_nav_profile"],
          onButtonPressed: context.read<HomePageCubit>().onAppBarProfileMenuButtonPressed,
        ),
        HomeAppBarMenuButtonForm(
          label: AppLocalizations.of(context)["button_nav_careers"],
          onButtonPressed: context.read<HomePageCubit>().onAppBarCareersMenuButtonPressed,
        ),
        HomeAppBarMenuButtonForm(
          label: AppLocalizations.of(context)["button_nav_skills"],
          onButtonPressed: context.read<HomePageCubit>().onAppBarTechSkillsMenuButtonPressed,
        ),
        HomeAppBarMenuButtonForm(
          label: AppLocalizations.of(context)["button_nav_contacts"],
          onButtonPressed: context.read<HomePageCubit>().onAppBarContactsMenuButtonPressed,
        ),
      ],
    );
  }
}
