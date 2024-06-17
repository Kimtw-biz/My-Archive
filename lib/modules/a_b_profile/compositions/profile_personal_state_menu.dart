import 'package:flutter/material.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/tokens/app_sizes.dart';
import '../components/profile_personal_info.dart';
import '../components/profile_personal_status.dart';

class ProfilePersonalStateMenu extends StatelessWidget {
  const ProfilePersonalStateMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoLayout.vertical(
      mainAxisGap: AppSizes.verticalGapLarge,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfilePersonalInfo(),
        Divider(),
        ProfilePersonalStatus(),
      ],
    );
  }
}
