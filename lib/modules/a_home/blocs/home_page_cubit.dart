import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../cores/blocs/profiles/profile_bloc.dart';
import '../../../widgets/components/app_clipboard_message.dart';
import 'home_page_scroll_cubit.dart';

class HomePageCubitState extends Equatable {
  const HomePageCubitState._();

  const HomePageCubitState.initial() : this._();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomePageCubit extends Cubit<HomePageCubitState> {
  HomePageCubit(
    super.initialState, {
    required HomePageScrollCubit homePageScrollCubit,
  }) : _homePageScrollCubit = homePageScrollCubit;

  final HomePageScrollCubit _homePageScrollCubit;

  Future<void> launchFigmaUrl(BuildContext context) async {
    final String? url = context.read<ProfileBloc>().state.profile?.figmaUrl;

    if (url != null && url.isNotEmpty) await _launchUrl(context, url);
  }

  Future<void> launchGithubUrl(BuildContext context) async {
    final String? url = context.read<ProfileBloc>().state.profile?.githubUrl;

    if (url != null && url.isNotEmpty) await _launchUrl(context, url);
  }

  Future<void> launchResumeUrl(BuildContext context) async {
    final String? url = context.read<ProfileBloc>().state.profile?.resumeUrl;

    if (url != null && url.isNotEmpty) await _launchUrl(context, url);
  }

  Future<void> setEmailToClipboard(BuildContext context) async {
    final String? email = context.read<ProfileBloc>().state.profile?.email;

    if (email != null) await _setTextToClipboard(context, email);
  }

  Future<void> setContactToClipboard(BuildContext context) async {
    final String? contact = context.read<ProfileBloc>().state.profile?.contact;

    if (contact != null) await _setTextToClipboard(context, contact);
  }

  void onAppBarLeadingButtonPressed() => _homePageScrollCubit.scrollToHeroPage();

  void onAppBarProfileMenuButtonPressed() => _homePageScrollCubit.scrollToProfilePage();

  void onAppBarCareersMenuButtonPressed() => _homePageScrollCubit.scrollToCareersPage();

  void onAppBarTechSkillsMenuButtonPressed() => _homePageScrollCubit.scrollToTechSkillsPage();

  void onAppBarContactsMenuButtonPressed() => _homePageScrollCubit.scrollToContactsPage();

  void onAppBarDrawerButtonPressed(BuildContext context) => Scaffold.of(context).openDrawer();

  void onAppBarDrawerHomeMenuButtonPressed(BuildContext context) {
    Scaffold.of(context).closeDrawer();

    onAppBarLeadingButtonPressed();
  }

  void onAppBarDrawerProfileMenuButtonPressed(BuildContext context) {
    Scaffold.of(context).closeDrawer();

    onAppBarProfileMenuButtonPressed();
  }

  void onAppBarDrawerCareersMenuButtonPressed(BuildContext context) {
    Scaffold.of(context).closeDrawer();

    onAppBarCareersMenuButtonPressed();
  }

  void onAppBarDrawerTechSkillsMenuButtonPressed(BuildContext context) {
    Scaffold.of(context).closeDrawer();

    onAppBarTechSkillsMenuButtonPressed();
  }

  void onAppBarDrawerContactsMenuButtonPressed(BuildContext context) {
    Scaffold.of(context).closeDrawer();

    onAppBarContactsMenuButtonPressed();
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        // webOnlyWindowName: "_self",
        mode: LaunchMode.externalApplication,
      );
    } else {
      // Show snackbar
    }
  }

  Future<void> _setTextToClipboard(BuildContext context, String text) async {
    late final Widget content;

    await Clipboard.setData(ClipboardData(text: text)).then((_) {
      content = const AppClipboardMessage.success();
    }).onError((error, stackTrace) {
      content = const AppClipboardMessage.failure();
    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: content),
      );
    });
  }
}
