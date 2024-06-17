import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/values/app_icon_path.dart';
import '../blocs/hero_page_cubit.dart';

class HeroExternalLinkButtons extends StatelessWidget {
  const HeroExternalLinkButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoLayout.horizontal(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset(AppIconPath.figma),
          onPressed: () => context.read<HeroPageCubit>().onFigmaButtonPressed(context),
        ),
        IconButton(
          icon: Image.asset(AppIconPath.github),
          onPressed: () => context.read<HeroPageCubit>().onGitHubButtonPressed(context),
        ),
        IconButton(
          icon: Image.asset(AppIconPath.phone),
          onPressed: () => context.read<HeroPageCubit>().onContactButtonPressed(context),
        ),
        IconButton(
          icon: Image.asset(AppIconPath.mail),
          onPressed: () => context.read<HeroPageCubit>().onEmailButtonPressed(context),
        ),
      ],
    );
  }
}
