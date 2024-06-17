import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_colors.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../blocs/hero_page_cubit.dart';

class HeroAboutMeButton extends StatelessWidget {
  const HeroAboutMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(AppSizes.s16)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r8),
        )),
        backgroundColor: const WidgetStatePropertyAll(AppColors.blue),
        foregroundColor: const WidgetStatePropertyAll(AppColors.white),
      ),
      onPressed: context.read<HeroPageCubit>().onAboutMeButtonPressed,
      child: AutoLayout.horizontal(
        mainAxisSize: MainAxisSize.min,
        mainAxisGap: AppSizes.horizontalGapSmall,
        children: [
          Text(
            AppLocalizations.of(context)["button_about_me"],
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.white,
            size: AppSizes.s20,
          ),
        ],
      ),
    );
  }
}
