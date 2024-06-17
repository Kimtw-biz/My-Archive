import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../components/hero_about_me_button.dart';
import '../components/hero_external_link_buttons.dart';
import '../components/hero_intro_body_text.dart';
import '../components/hero_intro_image.dart';
import '../components/hero_intro_title_text.dart';

class HeroDesktopView extends StatelessWidget {
  const HeroDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(AppSizes.s100),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor().copyWith(
          maxWidth: context.watch<LayoutSizeBloc>().maxContentWidth,
        ),
        child: const AutoLayout.horizontal(
          mainAxisGap: AppSizes.w100,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: AutoLayout.vertical(
                mainAxisSize: MainAxisSize.min,
                mainAxisGap: AppSizes.verticalGapLarge,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: HeroIntroTitleText(),
                  ),
                  HeroIntroBodyText(),
                  AutoLayout.horizontal(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeroAboutMeButton(),
                      HeroExternalLinkButtons(),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: HeroIntroImage(),
            ),
          ],
        ),
      ),
    );
  }
}
