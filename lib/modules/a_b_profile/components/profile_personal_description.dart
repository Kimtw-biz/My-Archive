import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../blocs/profile_page_cubit.dart';
import '../forms/profile_personal_description_form.dart';

class ProfilePersonalDescription extends StatelessWidget {
  const ProfilePersonalDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageCubitState>(
      buildWhen: (previous, current) {
        var a = previous.profile.introduction != current.profile.introduction;
        var b = previous.profile.philosophy != current.profile.philosophy;

        return a || b;
      },
      builder: (context, state) => AutoLayout.vertical(
        mainAxisGap: AppSizes.verticalGapMedium,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePersonalDescriptionForm(
            lable: AppLocalizations.of(context)["label_introduction"],
            content: state.profile.formattedIntroduction,
          ),
          ProfilePersonalDescriptionForm(
            lable: AppLocalizations.of(context)["label_philosophy"],
            content: state.profile.philosophy,
          ),
        ],
      ),
    );
  }
}
