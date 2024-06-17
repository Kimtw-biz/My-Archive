import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cores/blocs/careers/career_bloc.dart';
import '../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../cores/blocs/profiles/profile_bloc.dart';
import '../../cores/blocs/tech_skills/tech_stack_bloc.dart';
import '../../datas/repositories/career_data_repository.dart';
import '../../datas/repositories/profile_data_repository.dart';
import '../../datas/repositories/tech_stack_data_repository.dart';
import 'blocs/home_page_cubit.dart';
import 'blocs/home_page_scroll_cubit.dart';
import 'views/home_desktop_view.dart';
import 'views/home_mobile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ProfileBloc _profileBloc;
  late final CareerBloc _careerBloc;
  late final TechStackBloc _techStackBloc;

  late final HomePageCubit _homePageCubit;
  late final HomePageScrollCubit _homePageScrollCubit;

  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc(
      const ProfileStateInitial(null),
      profileDataRepository: context.read<ProfileDataRepository>(),
    );

    _careerBloc = CareerBloc(
      const CareerStateInitial(null),
      careerDataRepository: context.read<CareerDataRepository>(),
    );

    _techStackBloc = TechStackBloc(
      const TechStackStateInitial(null),
      techStackDataRepository: context.read<TechStackDataRepository>(),
    );

    _homePageScrollCubit = HomePageScrollCubit(
      HomePageScrollState.initial(),
    );

    _homePageCubit = HomePageCubit(
      const HomePageCubitState.initial(),
      homePageScrollCubit: _homePageScrollCubit,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _profileBloc.add(ProfileEventStarted());
    _careerBloc.add(CareerEventStarted());
    _techStackBloc.add(TechStackEventStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _profileBloc,
        ),
        BlocProvider(
          create: (context) => _careerBloc,
        ),
        BlocProvider(
          create: (context) => _techStackBloc,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => _homePageCubit,
          ),
          BlocProvider(
            create: (context) => _homePageScrollCubit,
          ),
        ],
        child: BlocBuilder<LayoutSizeBloc, LayoutSizeState>(
          buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
          builder: (context, state) => switch (state.runtimeType) {
            LayoutSizeStateInitial => const SizedBox.shrink(),
            LayoutSizeStateDesktop => const HomeDesktopView(),
            LayoutSizeStateMobile => const HomeMobileView(),
            _ => throw UnimplementedError(),
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (!mounted) {
      _homePageCubit.close();
      _homePageScrollCubit.close();

      _techStackBloc.close();
      _careerBloc.close();
      _profileBloc.close();
    }

    super.dispose();
  }
}
