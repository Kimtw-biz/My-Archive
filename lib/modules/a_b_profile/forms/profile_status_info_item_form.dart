import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';

class ProfileStatusInfoItemForm extends StatelessWidget {
  const ProfileStatusInfoItemForm({
    super.key,
    required this.contents,
    this.label,
    this.iconPath,
    this.contentsColor,
  }) : assert(label != null || iconPath != null);

  final String? label;
  final String contents;

  final String? iconPath;
  final Color? contentsColor;

  @override
  Widget build(BuildContext context) {
    return AutoLayout.horizontal(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoLayout.horizontal(
          mainAxisGap: AppSizes.horizontalGapSmall,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconPath != null)
              Image.asset(
                iconPath!,
                width: AppSizes.s16,
              ),
            if (label != null)
              Text(
                label!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
        Text(
          contents,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: contentsColor,
              ),
        ),
      ],
    );
  }
}
