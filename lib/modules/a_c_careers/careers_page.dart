import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../cores/blocs/careers/career_bloc.dart';
import '../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../cores/localizations/app_localizations.dart';
import '../../cores/tokens/app_sizes.dart';
import '../../widgets/components/app_page_title_text.dart';
import 'blocs/careers_page_cubit.dart';
import 'compositions/careers_company_item.dart';
import 'views/careers_mobile_view.dart';

part 'views/careers_desktop_view.dart';

class CareersPage extends StatefulWidget {
  const CareersPage({super.key});

  @override
  State<CareersPage> createState() => _CareersPageState();
}

class _CareersPageState extends State<CareersPage> {
  late final CareersPageCubit _careersCubit;

  @override
  void dispose() {
    if (!mounted) {
      _careersCubit.close();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CareerBloc, CareerState>(
      listenWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      listener: (context, state) {
        if (state is CareerStateFailure && state.careers != null) {
          //* Retry few times and pop up snack bar

          debugPrint("Failure with previous data");
        }
      },
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) => switch (state.runtimeType) {
        CareerStateInitial => const SizedBox.shrink(),
        CareerStateSuccess || CareerStateFailure when state.careers != null => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  _careersCubit = CareersPageCubit(
                    CareersPageCubitState(state.careers!),
                    context.read<CareerBloc>(),
                  );

                  return _careersCubit;
                },
              )
            ],
            child: BlocBuilder<LayoutSizeBloc, LayoutSizeState>(
              buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
              builder: (context, state) => switch (state.runtimeType) {
                LayoutSizeStateDesktop => const CareersDesktopView(),
                LayoutSizeStateMobile => const CareersMobileView(),
                _ => throw UnimplementedError(),
              },
            ),
          ),
        CareerStateFailure => const SizedBox.shrink(),
        _ => throw UnimplementedError(),
      },
    );
  }
}
