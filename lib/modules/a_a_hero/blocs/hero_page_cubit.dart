import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../a_home/blocs/home_page_cubit.dart';
import '../../a_home/blocs/home_page_scroll_cubit.dart';

class HeroPageCubitState extends Equatable {
  const HeroPageCubitState._();

  const HeroPageCubitState.initial();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class HeroPageCubit extends Cubit<HeroPageCubitState> {
  HeroPageCubit(
    super.initialState, {
    required HomePageScrollCubit homePageScrollCubit,
  }) : _homePageScrollCubit = homePageScrollCubit;

  final HomePageScrollCubit _homePageScrollCubit;

  void onAboutMeButtonPressed() => _homePageScrollCubit.scrollToProfilePage();

  Future<void> onEmailButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().setEmailToClipboard(context);

  Future<void> onContactButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().setContactToClipboard(context);

  Future<void> onGitHubButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().launchGithubUrl(context);

  Future<void> onFigmaButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().launchFigmaUrl(context);

  Future<void> onResumeButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().launchResumeUrl(context);
}
