import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_colors.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../../../cores/values/app_icon_path.dart';

class ContactsClipboardButtonForm extends StatelessWidget {
  const ContactsClipboardButtonForm({
    super.key,
    required this.icon,
    required this.buttonText,
    required this.onButtonPressed,
  });

  final IconData icon;
  final String buttonText;
  final void Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onButtonPressed,
      child: AutoLayout.horizontal(
        children: [
          Container(
            width: AppSizes.w64,
            height: AppSizes.h64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.white,
              ),
            ),
            child: Icon(
              icon,
              color: AppColors.white,
              size: AppSizes.s16,
            ),
          ),
          Expanded(
            child: Container(
              height: AppSizes.h64,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: AppColors.white,
                  ),
                ),
                // border: Border.all(
                //
                //   color: AppColors.white,
                // ),
              ),
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          Container(
            width: AppSizes.w64,
            height: AppSizes.h64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.white,
              ),
            ),
            child: Image.asset(
              AppIconPath.copy,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
