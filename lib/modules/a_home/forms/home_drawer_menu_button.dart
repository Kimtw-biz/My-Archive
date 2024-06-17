import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';

class HomeDrawerMenuButton extends StatelessWidget {
  const HomeDrawerMenuButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onButtonPressed,
  });

  final String label;
  final String iconPath;
  final void Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      behavior: HitTestBehavior.opaque,
      child: AutoLayout.horizontal(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: AppSizes.s16,
            child: Image.asset(iconPath),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
