import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../../../cores/values/app_icon_path.dart';
import '../blocs/profile_page_cubit.dart';
import '../forms/profile_status_info_item_form.dart';

class ProfilePersonalStatus extends StatelessWidget {
  const ProfilePersonalStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageCubitState>(
      buildWhen: (previous, current) {
        var a = previous.profile.updatedAt != current.profile.updatedAt;
        var b = previous.profile.currentState != current.profile.currentState;
        var c = previous.profile.workingArea != current.profile.workingArea;
        var d = previous.profile.email != current.profile.email;
        var e = previous.profile.contact != current.profile.contact;

        return a || b || c || d || e;
      },
      builder: (context, state) => AutoLayout.vertical(
        mainAxisGap: AppSizes.verticalGapMedium,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileStatusInfoItemForm(
            label: AppLocalizations.of(context)["label_updates"],
            contents: state.profile.formattedUpdatedAt,
          ),
          ProfileStatusInfoItemForm(
            label: AppLocalizations.of(context)["label_working_state"],
            contents: state.profile.currentState.displayTitle(context),
            contentsColor: state.profile.currentState.displayColor,
          ),
          const Divider(),
          ProfileStatusInfoItemForm(
            contents: state.profile.formattedWorkingArea,
            iconPath: AppIconPath.location,
          ),
          ProfileStatusInfoItemForm(
            contents: state.profile.email,
            iconPath: AppIconPath.mail,
          ),
          ProfileStatusInfoItemForm(
            contents: state.profile.formattedContact,
            iconPath: AppIconPath.contact,
          ),
        ],
      ),
    );
  }
}
