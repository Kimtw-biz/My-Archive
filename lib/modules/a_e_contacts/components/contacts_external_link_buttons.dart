import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';
import '../../../cores/values/app_icon_path.dart';
import '../blocs/contacts_page_cubit.dart';
import '../forms/contacts_external_link_button_form.dart';

class ContactsExternalLinkButtons extends StatelessWidget {
  const ContactsExternalLinkButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsPageCubit cubit = context.read<ContactsPageCubit>();

    return AutoLayout.vertical(
      mainAxisSize: MainAxisSize.min,
      // mainAxisGap: AppSizes.verticalGapSmall,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(),
        AutoLayout.horizontal(
          mainAxisSize: MainAxisSize.min,
          mainAxisGap: AppSizes.horizontalGapMedium,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContactsExternalLinkButtonForm(
              icon: AppIconPath.figma,
              onButtonPressed: () => cubit.onFigmaButtonPressed(context),
            ),
            ContactsExternalLinkButtonForm(
              icon: AppIconPath.github,
              onButtonPressed: () => cubit.onGitHubButtonPressed(context),
            ),
            ContactsExternalLinkButtonForm(
              icon: AppIconPath.download,
              onButtonPressed: () => cubit.onResumeButtonPressed(context),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
