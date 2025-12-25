import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/core/theme/plant_color_extension.dart';
import 'package:hubx_case/core/theme/plant_dimens.dart';
import 'package:hubx_case/features/diagnose/presentation/diagnose_page.dart';
import 'package:hubx_case/features/home/presentation/home_screen.dart';
import 'package:hubx_case/features/landing/presentation/bloc/plant_landing_bloc.dart';
import 'package:hubx_case/features/my_garden/presentation/my_garden_page.dart';
import 'package:hubx_case/features/profile/presentation/profile_page.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/utils/plant_assets.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';
import 'package:hubx_case/shared/widgets/plant_image.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

abstract class _Constants {
  static const double bottomNavigationBarHeight = 80;
  static const double bottomNavigationBarItemSpacing = 68;
  static const double floatingActionButtonRadius = 34;
}

class PlantLandingPage extends StatelessWidget {
  const PlantLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PlantLandingView();
  }
}

class _PlantLandingView extends StatelessWidget {
  const _PlantLandingView();

  static const _pages = [
    HomeScreen(),
    DiagnosePage(),
    MyGardenPage(),
    ProfilePage(),
  ];

  BoxDecoration _bottomNavDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: context.plantColors.bottomNavBorder,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantLandingBloc, PlantLandingState>(
      buildWhen: (previous, current) => previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: IndexedStack(
            index: state.currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context, state.currentIndex),
          floatingActionButton: _buildFloatingActionButton(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: _bottomNavDecoration(context),
      height: _Constants.bottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context: context,
            assetPath: PlantAssets.landingHome,
            label: L.landing.home,
            index: 0,
            currentIndex: currentIndex,
          ),
          _buildNavItem(
            context: context,
            assetPath: PlantAssets.landingDiagnose,
            label: L.landing.diagnose,
            index: 1,
            currentIndex: currentIndex,
          ),
          const SizedBox(width: _Constants.bottomNavigationBarItemSpacing),
          _buildNavItem(
            context: context,
            assetPath: PlantAssets.landingMyGarden,
            label: L.landing.myGarden,
            index: 2,
            currentIndex: currentIndex,
          ),
          _buildNavItem(
            context: context,
            assetPath: PlantAssets.landingProfile,
            label: L.landing.profile,
            index: 3,
            currentIndex: currentIndex,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String assetPath,
    required String label,
    required int index,
    required int currentIndex,
  }) {
    final isSelected = index == currentIndex;
    final colorScheme = Theme.of(context).colorScheme;
    final plantColors = context.plantColors;
    final color = isSelected ? colorScheme.primary : plantColors.inactiveText;

    return Expanded(
      child: InkWell(
        onTap: () {
          context.read<PlantLandingBloc>().add(PlantLandingEventChangeTab(index));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
              child: PlantImage(
                assetPath: assetPath,
                width: PlantDimens.x24,
                height: PlantDimens.x24,
              ),
            ),
            PlantText(
              label,
              style: PlantTextStyles.body11Regular(context).copyWith(color: color),
            ).paddingOnly(top: PlantDimens.x4),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    final plantColors = context.plantColors;
    return UnconstrainedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            /* No action */
          },
          borderRadius: BorderRadius.circular(_Constants.floatingActionButtonRadius),
          child: Container(
            padding: const EdgeInsets.all(PlantDimens.x20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  plantColors.fabGradientStart,
                  plantColors.fabGradientEnd,
                ],
              ),
              border: Border.all(
                color: plantColors.fabBorder,
                width: PlantDimens.x4,
              ),
            ),
            alignment: Alignment.center,
            child: const PlantImage(
              assetPath: PlantAssets.landingScan,
              width: PlantDimens.x28,
              height: PlantDimens.x28,
            ),
          ),
        ),
      ),
    );
  }
}
