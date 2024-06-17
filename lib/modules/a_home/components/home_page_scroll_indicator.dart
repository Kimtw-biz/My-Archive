import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/scroll_progress_bar.dart';

import '../blocs/home_page_scroll_cubit.dart';

class HomePageScrollIndicator extends StatelessWidget implements PreferredSizeWidget {
  const HomePageScrollIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollProgressBar(
      controller: context.select<HomePageScrollCubit, ScrollController>(
        (value) => value.state.scrollControllerPrimary,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(4.0);
}
