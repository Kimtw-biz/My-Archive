part of "../tech_skills_page.dart";

class TechSkillsMobileView extends StatelessWidget {
  const TechSkillsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final TechSkillsPageCubitState state = context.watch<TechSkillsPageCubit>().state;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.h100,
        horizontal: AppSizes.w40,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(),
        child: AutoLayout.vertical(
          mainAxisSize: MainAxisSize.min,
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageTitleText(AppLocalizations.of(context)["label_skills"]),
            AutoLayout.vertical(
              mainAxisGap: AppSizes.verticalGapExtra * 2,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                state.techStacks.length,
                (index) => TechSkillsStackItem(
                  state.techStacks[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
