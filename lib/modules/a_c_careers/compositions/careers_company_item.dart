import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';
import '../../../datas/models/career.dart';
import '../components/careers_company_content_text.dart';
import '../components/careers_company_title_text.dart';
import 'careers_project_item.dart';

class CareersCompanyItem extends StatelessWidget {
  const CareersCompanyItem({
    super.key,
    required this.career,
  });

  final Career career;

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
        CareersCompanyTitleText(career.name),
        AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            career.roles.length,
            (index) => CareersCompanyContentText(switch (index) {
              0 => "${career.roles[index]} ${career.formattedDayOfWork}",
              _ => career.roles[index],
            }),
          ),
        ),
        if (career.projects.isNotEmpty) const Divider(),
        AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapLarge,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            career.projects.length,
            (index) => CareersProjectItem(
              project: career.projects[index],
            ),
          ),
        ),
        //  Info
        // Projects
      ],
    );
  }
}
