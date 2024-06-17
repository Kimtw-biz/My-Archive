import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../cores/blocs/profiles/profile_bloc.dart';
import '../../cores/localizations/app_localizations.dart';
import '../../cores/tokens/app_sizes.dart';
import '../../widgets/components/app_page_title_text.dart';
import 'blocs/profile_page_cubit.dart';
import 'compositions/profile_personal_state_menu.dart';
import 'components/profile_personal_description.dart';
import 'components/profile_record_info.dart';

part 'views/profile_desktop_view.dart';
part 'views/profile_mobile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfilePageCubit _profileCubit;

  @override
  void dispose() {
    if (!mounted) {
      _profileCubit.close();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      listener: (BuildContext context, ProfileState state) {
        if (state is ProfileStateFailure && state.profile != null) {
          //* Retry few times and pop up snack bar

          debugPrint("Failure with previous data");
        }
      },
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) => switch (state.runtimeType) {
        ProfileStateInitial => const SizedBox.shrink(),
        ProfileStateSuccess || ProfileStateFailure when state.profile != null => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  _profileCubit = ProfilePageCubit(
                    ProfilePageCubitState(state.profile!),
                    context.read<ProfileBloc>(),
                  );

                  return _profileCubit;
                },
              ),
            ],
            child: BlocBuilder<LayoutSizeBloc, LayoutSizeState>(
              buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
              builder: (context, state) => switch (state.runtimeType) {
                LayoutSizeStateDesktop => const ProfileDesktopView(),
                LayoutSizeStateMobile => const ProfileMobileView(),
                _ => throw UnimplementedError(),
              },
            ),
          ),
        ProfileStateFailure => const SizedBox.shrink(),
        _ => throw UnimplementedError(),
      },
    );
  }
}
