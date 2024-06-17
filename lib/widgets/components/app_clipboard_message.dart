import 'package:flutter/material.dart';

import '../../cores/localizations/app_localizations.dart';
import '../../cores/tokens/app_colors.dart';

class AppClipboardMessage extends StatelessWidget {
  const AppClipboardMessage._({
    super.key,
    required this.message,
  });

  const AppClipboardMessage.success({Key? key})
      : this._(
          key: key,
          message: "msg_clipboard_success",
        );

  const AppClipboardMessage.failure({Key? key})
      : this._(
          key: key,
          message: "msg_clipboard_failure",
        );

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)[message],
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: AppColors.white,
          ),
    );
  }
}
