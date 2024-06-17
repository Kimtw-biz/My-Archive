import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../blocs/profile_page_cubit.dart';
import '../forms/profile_record_info_item_form.dart';

class ProfileRecordInfo extends StatelessWidget {
  const ProfileRecordInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageCubitState>(
      buildWhen: (previous, current) {
        var a = previous.profile.educations != current.profile.educations;
        var b = previous.profile.certificates != current.profile.certificates;
        var c = previous.profile.interests != current.profile.interests;
        var d = previous.profile.activities != current.profile.activities;

        return a || b || c || d;
      },
      builder: (context, state) {
        final List<Widget> items = [
          ProfileRecordInfoItemForm(
            lable: AppLocalizations.of(context)["label_educations"],
            contents: state.profile.educations,
          ),
          ProfileRecordInfoItemForm(
            lable: AppLocalizations.of(context)["label_certificates"],
            contents: state.profile.certificates,
          ),
          ProfileRecordInfoItemForm(
            lable: AppLocalizations.of(context)["label_interests"],
            contents: state.profile.interests,
          ),
          ProfileRecordInfoItemForm(
            lable: AppLocalizations.of(context)["label_activities"],
            contents: state.profile.activities,
          ),
        ];

        return AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: switch (context.watch<LayoutSizeBloc>().state.runtimeType) {
            LayoutSizeStateDesktop => [
                AutoLayout.horizontal(
                  mainAxisGap: AppSizes.horizontalGapMedium,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: items[0]),
                    Expanded(child: items[1]),
                  ],
                ),
                AutoLayout.horizontal(
                  mainAxisGap: AppSizes.horizontalGapMedium,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: items[2]),
                    Expanded(child: items[3]),
                  ],
                ),
              ],
            LayoutSizeStateMobile => items,
            _ => throw UnimplementedError(),
          },
        );
      },
    );
  }
}
