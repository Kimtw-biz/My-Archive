import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';

class ProfilePersonalDescriptionForm extends StatelessWidget {
  const ProfilePersonalDescriptionForm({
    super.key,
    required this.lable,
    required this.content,
  });

  final String lable;
  final String content;

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
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
