import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../cores/tokens/app_colors.dart';
import '../../cores/tokens/app_sizes.dart';
import 'blocs/contacts_page_cubit.dart';
import 'components/contacts_copyright_text.dart';
import 'components/contacts_title_text.dart';
import 'components/contacts_clipboard_buttons.dart';
import 'components/contacts_external_link_buttons.dart';

part 'views/contacts_desktop_view.dart';
part 'views/contacts_mobile_view.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactsPageCubit(
            const ContactsPageCubitState.initial(),
          ),
        )
      ],
      child: BlocBuilder<LayoutSizeBloc, LayoutSizeState>(
        buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
        builder: (context, state) => switch (state.runtimeType) {
          LayoutSizeStateDesktop => const ContactsDesktopView(),
          LayoutSizeStateMobile => const ContactsMobileView(),
          _ => throw UnimplementedError(),
        },
      ),
    );
  }
}
