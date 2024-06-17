import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/values/app_icon_path.dart';
import '../blocs/home_page_cubit.dart';

class HomeAppBarActions extends StatelessWidget {
  const HomeAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoLayout.horizontal(children: [
      IconButton(
        onPressed: () => context.read<HomePageCubit>().launchResumeUrl(context),
        icon: Image.asset(AppIconPath.download),
      ),
      IconButton(
        onPressed: () => context.read<HomePageCubit>().onAppBarDrawerButtonPressed(context),
        icon: Image.asset(AppIconPath.menu),
      ),
    ]);
  }
}
