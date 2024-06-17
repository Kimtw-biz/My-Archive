import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScrollState extends Equatable {
  const HomePageScrollState._(
    this.scrollControllerPrimary,
    this.pageKeyProfile,
    this.pageKeyCareers,
    this.pageKeyTechSkills,
    this.pageKeyContacts,
  );

  HomePageScrollState.initial()
      : this._(
          ScrollController(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
          GlobalKey(),
        );

  final ScrollController scrollControllerPrimary;

  final GlobalKey pageKeyProfile;
  final GlobalKey pageKeyCareers;
  final GlobalKey pageKeyTechSkills;
  final GlobalKey pageKeyContacts;

  @override
  List<Object?> get props => [
        scrollControllerPrimary,
        pageKeyProfile,
        pageKeyCareers,
        pageKeyTechSkills,
        pageKeyContacts,
      ];
}

class HomePageScrollCubit extends Cubit<HomePageScrollState> {
  HomePageScrollCubit(super.initialState);

  void _ensurePageVisible(GlobalKey pageKey) => WidgetsBinding.instance.addPostFrameCallback(
        (_) => Scrollable.ensureVisible(
          pageKey.currentContext!,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        ),
      );

  void scrollToHeroPage() => WidgetsBinding.instance.addPostFrameCallback(
        (_) => state.scrollControllerPrimary.animateTo(
          0.0,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        ),
      );

  void scrollToProfilePage() => _ensurePageVisible(state.pageKeyProfile);

  void scrollToCareersPage() => _ensurePageVisible(state.pageKeyCareers);

  void scrollToTechSkillsPage() => _ensurePageVisible(state.pageKeyTechSkills);

  void scrollToContactsPage() => _ensurePageVisible(state.pageKeyContacts);

  @override
  Future<void> close() {
    state.scrollControllerPrimary.dispose();

    return super.close();
  }
}
