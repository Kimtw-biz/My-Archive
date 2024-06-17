part of '../contacts_page.dart';

class ContactsMobileView extends StatelessWidget {
  const ContactsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.h100,
        horizontal: AppSizes.h20,
      ),
      color: AppColors.contactsViewBackground,
      child: const AutoLayout.vertical(
        mainAxisGap: AppSizes.verticalGapLarge,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactsTitleText(),
          ContactsClipboardButtons(),
          ContactsExternalLinkButtons(),
          ContactsCopyrightText(),
        ],
      ),
    );
  }
}
