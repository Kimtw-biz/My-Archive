import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_archive/cores/blocs/layout_size/layout_size_bloc.dart';

import '../../../cores/localizations/app_localizations.dart';

class HeroIntroBodyText extends StatelessWidget {
  const HeroIntroBodyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      [
        AppLocalizations.of(context)["hero_intro_body_01"],
        AppLocalizations.of(context)["hero_intro_body_02"],
      ].join("\n"),
      style: switch (context.watch<LayoutSizeBloc>().state.runtimeType) {
        LayoutSizeStateDesktop => Theme.of(context).textTheme.titleMedium,
        LayoutSizeStateMobile => Theme.of(context).textTheme.bodyMedium,
        _ => throw UnimplementedError(),
      },
    );
  }
}
