import 'package:flutter/material.dart';

import '../../../cores/tokens/app_colors.dart';

class ContactsExternalLinkButtonForm extends StatelessWidget {
  const ContactsExternalLinkButtonForm({
    super.key,
    required this.icon,
    required this.onButtonPressed,
  });

  final String icon;
  final void Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        icon,
        color: AppColors.white,
      ),
      onPressed: onButtonPressed,
    );
  }
}
