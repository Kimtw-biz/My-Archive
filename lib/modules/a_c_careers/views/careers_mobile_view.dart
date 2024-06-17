import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/localizations/app_localizations.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../../../widgets/components/app_page_title_text.dart';
import '../blocs/careers_page_cubit.dart';
import '../compositions/careers_company_item.dart';

class CareersMobileView extends StatelessWidget {
  const CareersMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final CareersPageCubitState state = context.watch<CareersPageCubit>().state;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.h100,
        horizontal: AppSizes.w40,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(),
        child: AutoLayout.vertical(
          mainAxisGap: AppSizes.verticalGapMedium,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppPageTitleText(AppLocalizations.of(context)["label_careers"]),
            AutoLayout.vertical(
              mainAxisGap: AppSizes.verticalGapLarge,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                state.careers.length,
                (index) => CareersCompanyItem(
                  career: state.careers[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
