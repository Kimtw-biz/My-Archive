import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_colors.dart';

class ContactsCopyrightText extends StatelessWidget {
  const ContactsCopyrightText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      [
        AppLocalizations.of(context)["footer_copyright_01"],
        AppLocalizations.of(context)["footer_copyright_02"],
        AppLocalizations.of(context)["footer_copyright_03"],
      ].join(switch (context.watch<LayoutSizeBloc>().state.runtimeType) {
        LayoutSizeStateDesktop => " ",
        LayoutSizeStateMobile => "\n",
        _ => throw UnimplementedError(),
      }),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontFamily: "NanumSquare",
            color: AppColors.white,
          ),
    );
  }
}
