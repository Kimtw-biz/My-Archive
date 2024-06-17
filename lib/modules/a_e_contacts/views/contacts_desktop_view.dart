part of '../contacts_page.dart';

class ContactsDesktopView extends StatelessWidget {
  const ContactsDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxContentWidth = context.watch<LayoutSizeBloc>().maxContentWidth;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppSizes.s100),
      color: AppColors.contactsViewBackground,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor().copyWith(
          maxWidth: maxContentWidth,
        ),
        child: const AutoLayout.vertical(
          mainAxisGap: AppSizes.h100,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContactsTitleText(),
            ContactsClipboardButtons(),
            ContactsExternalLinkButtons(),
            ContactsCopyrightText(),
          ],
        ),
      ),
    );
  }
}
