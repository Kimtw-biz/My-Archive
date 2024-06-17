import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../blocs/home_page_cubit.dart';

class HomeAppBarLeading extends StatelessWidget {
  const HomeAppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<HomePageCubit>().onAppBarLeadingButtonPressed,
      child: Text(
        AppLocalizations.of(context)["button_leading"],
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w200,
              fontFamily: "Lobster",
            ),
      ),
    );
  }
}
