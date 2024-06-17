import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';
import '../../../cores/values/app_icon_path.dart';

class CareersProjectContentText extends StatelessWidget {
  const CareersProjectContentText(
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
        SizedBox.square(
          dimension: AppSizes.s16,
          child: Image.asset(AppIconPath.item2),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
