import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../a_home/blocs/home_page_cubit.dart';

class ContactsPageCubitState extends Equatable {
  const ContactsPageCubitState._();

  const ContactsPageCubitState.initial() : this._();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ContactsPageCubit extends Cubit<ContactsPageCubitState> {
  ContactsPageCubit(super.initialState);

  Future<void> onEmailButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().setEmailToClipboard(context);

  Future<void> onContactButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().setContactToClipboard(context);

  Future<void> onGitHubButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().launchGithubUrl(context);

  Future<void> onFigmaButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().launchFigmaUrl(context);

  Future<void> onResumeButtonPressed(BuildContext context) async => await context.read<HomePageCubit>().launchResumeUrl(context);
}
