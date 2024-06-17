part of '../profile_page.dart';

class ProfileMobileView extends StatelessWidget {
  const ProfileMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.w40,
        vertical: AppSizes.h20,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor().copyWith(
            // maxWidth: context.watch<LayoutSizeBloc>().maxMobileContentWidth,
            ),
        child: AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapLarge,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.s40,
          ),
          children: [
            AppPageTitleText(AppLocalizations.of(context)["label_profile"]),
            const ProfilePersonalStateMenu(),
            const ProfilePersonalDescription(),
            const ProfileRecordInfo(),
          ],
        ),
      ),
    );
  }
}
