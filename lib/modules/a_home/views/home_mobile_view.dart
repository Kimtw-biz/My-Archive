import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_library/stable/widgets/auto_layout.dart';

import '../../../cores/blocs/layout_size/layout_size_bloc.dart';
import '../../../cores/tokens/app_sizes.dart';
import '../../a_a_hero/hero_page.dart';
import '../../a_b_profile/profile_page.dart';
import '../../a_c_careers/careers_page.dart';
import '../../a_d_tech_skills/tech_skills_page.dart';
import '../../a_e_contacts/contacts_page.dart';
import '../blocs/home_page_scroll_cubit.dart';
import '../components/home_app_bar_actions.dart';
import '../components/home_app_bar_leading.dart';
import '../components/home_page_scroll_indicator.dart';
import '../compositions/home_drawer_navigator.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawerMenu(),
      body: CustomScrollView(
        cacheExtent: double.infinity,
        controller: context.select<HomePageScrollCubit, ScrollController>(
          (value) => value.state.scrollControllerPrimary,
        ),
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: context.watch<LayoutSizeBloc>().maxMobileContentHeight,
            flexibleSpace: const FlexibleSpaceBar(
              background: HeroPage(),
            ),
            title: Container(
              alignment: Alignment.center,
              child: const AutoLayout.horizontal(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeAppBarLeading(),
                  AutoLayout.horizontal(
                    mainAxisGap: AppSizes.horizontalGapSmall,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [HomeAppBarActions()],
                  ),
                ],
              ),
            ),
            bottom: const HomePageScrollIndicator(),
            automaticallyImplyLeading: false,
            actions: const [SizedBox.shrink()],
          ),
          SliverList.list(
            children: [
              ProfilePage(
                key: context.select<HomePageScrollCubit, GlobalKey>(
                  (value) => value.state.pageKeyProfile,
                ),
              ),
              CareersPage(
                key: context.select<HomePageScrollCubit, GlobalKey>(
                  (value) => value.state.pageKeyCareers,
                ),
              ),
              TechSkillsPage(
                key: context.select<HomePageScrollCubit, GlobalKey>(
                  (value) => value.state.pageKeyTechSkills,
                ),
              ),
              ContactsPage(
                key: context.select<HomePageScrollCubit, GlobalKey>(
                  (value) => value.state.pageKeyContacts,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
