import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../../../datas/models/project.dart';
import '../components/careers_project_content_text.dart';
import '../components/careers_project_platform_image.dart';
import '../components/careers_project_title_text.dart';

class CareersProjectItem extends StatelessWidget {
  const CareersProjectItem({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    final List<Widget> headers = [
      CareersProjectTitleText(project.name),
      AutoLayout.horizontal(
        mainAxisSize: MainAxisSize.min,
        mainAxisGap: AppSizes.horizontalGapTiny,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          project.platforms.length,
          (index) => CareersProjectPlatformImage(project.platforms[index]),
        ),
      ),
    ];

    return AutoLayout.vertical(
      mainAxisGap: AppSizes.verticalGapMedium,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        switch (context.watch<LayoutSizeBloc>().state.runtimeType) {
          LayoutSizeStateDesktop => AutoLayout.horizontal(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: headers,
            ),
          LayoutSizeStateMobile => AutoLayout.vertical(
              mainAxisGap: AppSizes.verticalGapSmall,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: headers.reversed.toList(),
            ),
          _ => throw UnimplementedError(),
        },
        AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            project.roles.length,
            (index) => CareersProjectContentText(switch (index) {
              0 => "${project.roles[index]} ${project.formattedProjectWorkPeriod}",
              _ => project.roles[index],
            }),
          ),
        ),
      ],
    );
  }
}
