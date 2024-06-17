import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';
import 'package:flutter_my_library/stable/widgets/fade_box.dart';

import '../../../cores/tokens/app_sizes.dart';
import '../../../cores/values/app_image_path.dart';
import '../blocs/hero_page_cubit.dart';
import '../components/hero_external_link_buttons.dart';
import '../components/hero_intro_body_text.dart';
import '../components/hero_intro_title_text.dart';

class HeroMobileView extends StatelessWidget {
  const HeroMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeBox(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerRight,
            image: AssetImage(
              AppImagePath.selfIllustrationAlternative,
            ),
          ),
        ),
        padding: const EdgeInsets.all(AppSizes.s20),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor().copyWith(
              // maxWidth: context.watch<LayoutSizeBloc>().maxMobileContentWidth,
              ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              AutoLayout.horizontal(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                padding: const EdgeInsets.all(AppSizes.s20),
                children: [
                  const AutoLayout.vertical(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisGap: AppSizes.verticalGapMedium,
                    children: [HeroExternalLinkButtons()],
                  ),
                  IconButton(
                    onPressed: context.read<HeroPageCubit>().onAboutMeButtonPressed,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  )
                ],
              ),
              const SafeArea(
                child: AutoLayout.horizontal(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  padding: EdgeInsets.all(AppSizes.s40),
                  children: [
                    Flexible(
                      child: AutoLayout.vertical(
                        mainAxisGap: AppSizes.verticalGapMedium,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeroIntroTitleText(),
                          HeroIntroBodyText(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
