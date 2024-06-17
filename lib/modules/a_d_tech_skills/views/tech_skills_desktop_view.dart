part of "../tech_skills_page.dart";

class TechSkillsDesktopView extends StatelessWidget {
  const TechSkillsDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxContentWidth = context.watch<LayoutSizeBloc>().maxContentWidth;
    final TechSkillsPageCubitState currentState = context.watch<TechSkillsPageCubit>().state;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(100.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor().copyWith(
          minWidth: maxContentWidth,
          maxWidth: maxContentWidth,
        ),
        child: AutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          mainAxisGap: AppSizes.verticalGapLarge,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageTitleText(AppLocalizations.of(context)["label_skills"]),
            AutoLayout.vertical(
              mainAxisGap: AppSizes.verticalGapExtra * 2,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                (currentState.techStacks.length / 2).ceil(),
                (i) => AutoLayout.horizontal(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    2,
                    (j) {
                      return Expanded(
                        child: (index) {
                          if (index >= currentState.techStacks.length) {
                            return const SizedBox();
                          } else {
                            return TechSkillsStackItem(
                              currentState.techStacks[index],
                            );
                          }
                        }(i * 2 + j),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
