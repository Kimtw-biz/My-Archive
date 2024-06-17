import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';
import '../../../cores/values/app_icon_path.dart';

class ProfileRecordInfoItemForm extends StatelessWidget {
  const ProfileRecordInfoItemForm({
    super.key,
    required this.lable,
    required this.contents,
  });

  final String lable;
  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return AutoLayout.vertical(
      mainAxisGap: AppSizes.verticalGapMedium,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.h40,
      ),
      children: [
        Text(
          lable,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Divider(),
        AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            contents.length,
            (index) => AutoLayout.horizontal(
              mainAxisGap: AppSizes.horizontalGapSmall,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: AppSizes.s12,
                  child: Image.asset(AppIconPath.item),
                ),
                Flexible(
                  child: Text(
                    contents[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
