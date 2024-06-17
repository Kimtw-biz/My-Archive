import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../blocs/home_page_cubit.dart';

class HomeDownloadCVButton extends StatelessWidget {
  const HomeDownloadCVButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surfaceContainer),
        foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
        textStyle: WidgetStatePropertyAll(
          Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      onPressed: () => context.read<HomePageCubit>().launchResumeUrl(context),
      child: Text(AppLocalizations.of(context)["button_download_cv"]),
    );
  }
}
