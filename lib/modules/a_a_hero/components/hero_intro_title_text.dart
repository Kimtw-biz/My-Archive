import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';

class HeroIntroTitleText extends StatelessWidget {
  const HeroIntroTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutSizeState layoutSizeState = context.watch<LayoutSizeBloc>().state;

    return AutoLayout.vertical(
      mainAxisSize: MainAxisSize.min,
      mainAxisGap: AppSizes.verticalGapMedium,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          [
            AppLocalizations.of(context)["hero_intro_title_01"],
            AppLocalizations.of(context)["hero_intro_title_02"],
          ].join(switch (layoutSizeState.runtimeType) {
            LayoutSizeStateDesktop => " ",
            LayoutSizeStateMobile => "\n",
            _ => throw UnimplementedError(),
          }),
          style: switch (layoutSizeState.runtimeType) {
            LayoutSizeStateDesktop => Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            LayoutSizeStateMobile => Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            _ => throw UnimplementedError(),
          },
        ),
        Text(
          AppLocalizations.of(context)["hero_intro_subtitle"],
          style: switch (layoutSizeState.runtimeType) {
            LayoutSizeStateDesktop => Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            LayoutSizeStateMobile => Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            _ => throw UnimplementedError(),
          },
        ),
      ],
    );
  }
}
