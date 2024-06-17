import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../cores/blocs/tech_skills/tech_stack_bloc.dart';
import '../../cores/localizations/app_localizations.dart';
import '../../cores/tokens/app_sizes.dart';
import '../../widgets/components/app_page_title_text.dart';
import 'blocs/tech_skills_page_cubit.dart';
import 'compositions/tech_skills_stack_item.dart';

part 'views/tech_skills_desktop_view.dart';
part 'views/tech_skills_mobile_view.dart';

class TechSkillsPage extends StatefulWidget {
  const TechSkillsPage({super.key});

  @override
  State<TechSkillsPage> createState() => _TechSkillsPageState();
}

class _TechSkillsPageState extends State<TechSkillsPage> {
  late final TechSkillsPageCubit _techSkillsPageCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TechStackBloc, TechStackState>(
      listenWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      listener: (context, state) {
        if (state is TechStackStateFailure && state.techStacks != null) {
          //* Retry few times and pop up snack bar

          debugPrint("Failure with previous data");
        }
      },
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) => switch (state.runtimeType) {
        TechStackStateInitial => const SizedBox.shrink(),
        TechStackStateSuccess || TechStackStateFailure when state.techStacks != null => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  _techSkillsPageCubit = TechSkillsPageCubit(
                    TechSkillsPageCubitState(state.techStacks!),
                    context.read<TechStackBloc>(),
                  );

                  return _techSkillsPageCubit;
                },
              )
            ],
            child: BlocBuilder<LayoutSizeBloc, LayoutSizeState>(
              buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
              builder: (context, state) => switch (state.runtimeType) {
                LayoutSizeStateDesktop => const TechSkillsDesktopView(),
                LayoutSizeStateMobile => const TechSkillsMobileView(),
                _ => throw UnimplementedError(),
              },
            ),
          ),
        // Show Error Page.
        TechStackStateFailure => const SizedBox.shrink(),
        _ => throw UnimplementedError(),
      },
    );
  }
}
