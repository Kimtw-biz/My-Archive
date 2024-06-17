import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';
import '../components/home_download_cv_button.dart';
import '../components/home_app_bar_navigator.dart';

class HomeAppBarMenu extends StatelessWidget {
  const HomeAppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoLayout.horizontal(
      mainAxisSize: MainAxisSize.min,
      mainAxisGap: AppSizes.horizontalGapSmall,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeAppBarNavigator(),
        HomeDownloadCVButton(),
      ],
    );
  }
}
