import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../a_home/blocs/home_page_scroll_cubit.dart';
import 'blocs/hero_page_cubit.dart';
import 'views/hero_desktop_view.dart';
import 'views/hero_mobile_view.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HeroPageCubit(
            const HeroPageCubitState.initial(),
            homePageScrollCubit: context.read<HomePageScrollCubit>(),
          ),
        ),
      ],
      child: BlocBuilder<LayoutSizeBloc, LayoutSizeState>(
        buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
        builder: (context, state) => switch (state.runtimeType) {
          LayoutSizeStateDesktop => const HeroDesktopView(),
          LayoutSizeStateMobile => const HeroMobileView(),
          _ => throw UnimplementedError(),
        },
      ),
    );
  }
}
