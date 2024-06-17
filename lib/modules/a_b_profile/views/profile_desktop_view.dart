part of '../profile_page.dart';

class ProfileDesktopView extends StatelessWidget {
  const ProfileDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxContentWidth = context.watch<LayoutSizeBloc>().maxContentWidth;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppSizes.s100),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor().copyWith(
          minWidth: maxContentWidth,
          maxWidth: maxContentWidth,
        ),
        child: AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapLarge,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageTitleText(AppLocalizations.of(context)["label_profile"]),
            AutoLayout.horizontal(
              mainAxisGap: AppSizes.horizontalGapExtra,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: maxContentWidth * 0.25,
                    maxWidth: maxContentWidth * 0.25,
                  ),
                  child: const ProfilePersonalStateMenu(),
                ),
                const Expanded(
                  child: AutoLayout.vertical(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisGap: AppSizes.verticalGapMedium,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ProfilePersonalDescription(),
                      ),
                      Flexible(
                        child: ProfileRecordInfo(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
