import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';
import 'package:flutter_my_library/stable/widgets/ex_spacer.dart';

import '../../../cores/tokens/app_colors.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../blocs/profile_page_cubit.dart';

class ProfilePersonalInfo extends StatelessWidget {
  const ProfilePersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageCubitState>(
      buildWhen: (previous, current) {
        var a = previous.profile.imageUrl != current.profile.imageUrl;
        var b = previous.profile.name != current.profile.name;
        var c = previous.profile.nameEn != current.profile.nameEn;
        var d = previous.profile.dateOfBirth != current.profile.dateOfBirth;

        return a || b || c || d;
      },
      builder: (context, state) => AutoLayout.vertical(
        mainAxisSize: MainAxisSize.min,
        mainAxisGap: AppSizes.verticalGapLarge,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(state.profile.imageUrl),
            backgroundColor: AppColors.white,
            radius: AppSizes.s100,
          ),
          AutoLayout.vertical(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                state.profile.name,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                state.profile.nameEn,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const ExSpacer.vertical(AppSizes.h16),
              Text(
                "${state.profile.formattedDateOfBirth} ${state.profile.formattedDateOfBirthAge}",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
