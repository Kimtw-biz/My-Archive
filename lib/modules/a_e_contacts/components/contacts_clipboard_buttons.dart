import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../../cores/blocs/profiles/profile_bloc.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../blocs/contacts_page_cubit.dart';
import '../forms/contacts_clipboard_button_form.dart';

class ContactsClipboardButtons extends StatelessWidget {
  const ContactsClipboardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsPageCubit cubit = context.read<ContactsPageCubit>();

    final emailButton = ContactsClipboardButtonForm(
      icon: Icons.mail_outline,
      // buttonText: context.watch<ProfileBloc>().state.profile!.email,
      buttonText: context.watch<ProfileBloc>().state.profile?.email ?? "",
      onButtonPressed: () => cubit.onEmailButtonPressed(context),
    );

    final phoneButton = ContactsClipboardButtonForm(
      icon: Icons.call_outlined,
      buttonText: context.watch<ProfileBloc>().state.profile?.formattedContact ?? "",
      onButtonPressed: () => cubit.onContactButtonPressed(context),
    );

    return switch (context.watch<LayoutSizeBloc>().state.runtimeType) {
      LayoutSizeStateDesktop => AutoLayout.horizontal(
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: emailButton),
            Expanded(child: phoneButton),
          ],
        ),
      LayoutSizeStateMobile => AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [emailButton, phoneButton],
        ),
      _ => throw UnimplementedError(),
    };
  }
}
