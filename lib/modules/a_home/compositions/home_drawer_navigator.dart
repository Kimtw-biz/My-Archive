import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../../../cores/values/app_icon_path.dart';
import '../blocs/home_page_cubit.dart';
import '../forms/home_drawer_menu_button.dart';

class HomeDrawerMenu extends StatelessWidget {
  const HomeDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: AutoLayout.vertical(
        mainAxisGap: AppSizes.verticalGapMedium,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalGapLarge,
        ),
        children: [
          HomeDrawerMenuButton(
            label: AppLocalizations.of(context)["button_nav_home"],
            iconPath: AppIconPath.home,
            onButtonPressed: () => context.read<HomePageCubit>().onAppBarDrawerHomeMenuButtonPressed(context),
          ),
          HomeDrawerMenuButton(
            label: AppLocalizations.of(context)["button_nav_profile"],
            iconPath: AppIconPath.profile,
            onButtonPressed: () => context.read<HomePageCubit>().onAppBarDrawerProfileMenuButtonPressed(context),
          ),
          HomeDrawerMenuButton(
            label: AppLocalizations.of(context)["button_nav_careers"],
            iconPath: AppIconPath.project,
            onButtonPressed: () => context.read<HomePageCubit>().onAppBarDrawerCareersMenuButtonPressed(context),
          ),
          HomeDrawerMenuButton(
            label: AppLocalizations.of(context)["button_nav_skills"],
            iconPath: AppIconPath.skills,
            onButtonPressed: () => context.read<HomePageCubit>().onAppBarDrawerTechSkillsMenuButtonPressed(context),
          ),
          HomeDrawerMenuButton(
            label: AppLocalizations.of(context)["button_nav_contacts"],
            iconPath: AppIconPath.contact,
            onButtonPressed: () => context.read<HomePageCubit>().onAppBarDrawerContactsMenuButtonPressed(context),
          ),
        ],
      ),
    );
  }
}
