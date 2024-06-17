import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';

class CareersCompanyTitleText extends StatelessWidget {
  const CareersCompanyTitleText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoLayout.horizontal(
      mainAxisGap: AppSizes.horizontalGapSmall,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox.square(
        //   dimension: AppSizes.s16,
        //   child: Image.asset(AppIconPath.project),
        // ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
