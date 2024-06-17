part of "../careers_page.dart";

class CareersDesktopView extends StatelessWidget {
  const CareersDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxContentWidth = context.watch<LayoutSizeBloc>().maxContentWidth;
    final CareersPageCubitState currentState = context.watch<CareersPageCubit>().state;

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
            AppPageTitleText(AppLocalizations.of(context)["label_careers"]),
            AutoLayout.vertical(
              mainAxisGap: AppSizes.verticalGapLarge,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                currentState.careers.length,
                (index) => CareersCompanyItem(
                  career: currentState.careers[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
