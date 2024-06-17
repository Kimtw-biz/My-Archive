import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import 'cores/blocs/layout_size/layout_size_bloc.dart';
import 'cores/localizations/app_localizations.dart';
import 'cores/navigations/route_configs.dart';
import 'cores/tokens/app_themes.dart';
import 'datas/repositories/career_data_repository.dart';
import 'datas/repositories/profile_data_repository.dart';
import 'datas/repositories/tech_stack_data_repository.dart';

class Bootstrap extends StatefulWidget {
  const Bootstrap({super.key});

  @override
  State<Bootstrap> createState() => _BootstrapState();
}

class _BootstrapState extends State<Bootstrap> {
  late final LayoutSizeBloc _layoutSizeBloc;

  late final ProfileDataRepository _profileDataRepository;
  late final CareerDataRepository _careerDataRepository;
  late final TechStackDataRepository _techStacksDataRepository;

  @override
  void initState() {
    super.initState();

    _onInitializeBlocs();
    _onInitializeDataRepositories();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _onAppChangeDependenciesBlocs();
  }

  @override
  void dispose() {
    _onDisposeBlocs();
    _onDisposeDataRepositories();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayoutSizeBloc>(
          create: (context) => _layoutSizeBloc,
        ),
        RepositoryProvider(
          create: (context) => _profileDataRepository,
        ),
        RepositoryProvider(
          create: (context) => _careerDataRepository,
        ),
        RepositoryProvider(
          create: (context) => _techStacksDataRepository,
        ),
      ],
      child: MaterialApp.router(
        theme: AppThemes.themeData,
        themeMode: ThemeMode.light,
        routerConfig: RouteConfigs.configs,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  FutureOr<void> _onInitializeBlocs() {
    _layoutSizeBloc = LayoutSizeBloc(
      initialState: const LayoutSizeStateInitial(),
    );
  }

  FutureOr<void> _onDisposeBlocs() {
    _layoutSizeBloc.close();
  }

  FutureOr<void> _onAppChangeDependenciesBlocs() {
    _layoutSizeBloc.add(LayoutSizeEventChanged(
      size: MediaQuery.sizeOf(context),
    ));
  }

  FutureOr<void> _onInitializeDataRepositories() {
    _careerDataRepository = const CareerDataRepository();
    _profileDataRepository = const ProfileDataRepository();
    _techStacksDataRepository = const TechStackDataRepository();
  }

  FutureOr<void> _onDisposeDataRepositories() {
    _profileDataRepository.onDispose();
    _careerDataRepository.onDispose();
  }
}
