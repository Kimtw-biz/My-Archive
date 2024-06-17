import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../../../datas/models/tech_stack.dart';
import '../components/tech_skills_skill_image.dart';
import '../components/tech_skills_skill_label_text.dart';
import '../components/tech_skills_stack_count_text.dart';
import '../components/tech_skills_stack_title_text.dart';

class TechSkillsStackItem extends StatelessWidget {
  const TechSkillsStackItem(this.techStack, {super.key});

  final TechStack techStack;

  @override
  Widget build(BuildContext context) {
    return AutoLayout.vertical(
      mainAxisGap: AppSizes.verticalGapMedium,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.h20,
      ),
      children: [
        TechSkillsStackTitleText(techStack.category.displayTitle(context)),
        TechSkillsSkillCountText(
          AppLocalizations.of(context).format("format_tech_stack_skill_count", {
            "length": techStack.skills.length,
          }),
        ),
        AutoLayout.vertical(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalGapSmall,
          ),
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                techStack.skills.length,
                (index) => AutoLayout.vertical(
                  mainAxisGap: AppSizes.verticalGapMedium,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TechSkillsSkillImage(techStack.skills[index]),
                    TechSkillsSkillLabelText(techStack.skills[index].name),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
