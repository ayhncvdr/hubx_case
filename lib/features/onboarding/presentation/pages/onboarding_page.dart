import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/theme/plant_colors.dart';
import 'package:hubx_case/core/theme/plant_durations.dart';
import 'package:hubx_case/core/theme/plant_spacing.dart';
import 'package:hubx_case/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/utils/plant_assets.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';
import 'package:hubx_case/shared/widgets/plant_button.dart';
import 'package:hubx_case/shared/widgets/plant_image.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';

abstract class _Constants {
  static const int pageCount = 2;
  static const int indicatorCount = 3;
  static const double activeIndicatorSize = 10.0;
  static const double inactiveIndicatorSize = 6.0;
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: PlantScaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                PlantColors.backgroundSoft,
                PlantColors.white,
              ],
            ),
          ),
          child: BlocConsumer<OnboardingBloc, OnboardingState>(
            listenWhen: (prev, next) => prev.currentPage != next.currentPage,
            listener: (context, state) {
              if (_pageController.hasClients && _pageController.page?.round() != state.currentPage) {
                _pageController.animateToPage(
                  state.currentPage,
                  duration: PlantDurations.medium,
                  curve: Curves.easeInOut,
                );
              }
            },
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildPager(context, _pageController)),
                _buildContinueButton(context, _pageController).paddingOnly(bottom: PlantSpacing.x16),
                _buildIndicator(state.currentPage).paddingOnly(bottom: PlantSpacing.x48),
              ],
            ).paddingSymmetric(horizontal: PlantSpacing.x20),
          ),
        ),
      ),
    );
  }
}

Widget _buildPager(BuildContext context, PageController pageController) {
  return PageView(
    controller: pageController,
    onPageChanged: (index) => context.read<OnboardingBloc>().add(OnboardingEventChangePage(index)),
    children: [
      _buildSlide(
        titlePrefix: L.onboarding.slide1TitlePrefix,
        titleHighlight: L.onboarding.slide1TitleHighlight,
        titleSuffix: L.onboarding.slide1TitleSuffix,
        imagePath: PlantAssets.onboardingPhonePhoto,
        context: context,
        pageController: pageController,
      ),
      _buildSlide(
        titlePrefix: L.onboarding.slide2TitlePrefix,
        titleHighlight: L.onboarding.slide2TitleHighlight,
        imagePath: PlantAssets.onboardingPhoneGuides,
        context: context,
        pageController: pageController,
      ),
    ],
  );
}

Widget _buildSlide({
  required String titlePrefix,
  required String titleHighlight,
  required String imagePath,
  required BuildContext context,
  required PageController pageController,
  String? titleSuffix,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      PlantImage(
        assetPath: imagePath,
        fit: BoxFit.cover,
      ),
      Positioned(
        top: PlantSpacing.x24,
        left: 0,
        right: 0,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: titlePrefix,
                style: PlantTextStyles.headline28Medium,
              ),
              TextSpan(
                text: titleHighlight,
                style: PlantTextStyles.headline28ExtraBold,
              ),
              if (titleSuffix != null)
                TextSpan(
                  text: titleSuffix,
                  style: PlantTextStyles.headline28Medium,
                ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildIndicator(int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      _Constants.indicatorCount,
      (index) {
        final isActive = currentPage == index;
        return AnimatedContainer(
          duration: PlantDurations.medium,
          margin: const EdgeInsets.symmetric(horizontal: PlantSpacing.x8),
          width: isActive ? _Constants.activeIndicatorSize : _Constants.inactiveIndicatorSize,
          height: isActive ? _Constants.activeIndicatorSize : _Constants.inactiveIndicatorSize,
          decoration: BoxDecoration(
            color: isActive ? PlantColors.primaryText : PlantColors.carousel,
            shape: BoxShape.circle,
          ),
        );
      },
    ),
  );
}

Widget _buildContinueButton(BuildContext context, PageController pageController) {
  final current = context.read<OnboardingBloc>().state.currentPage;
  return PlantButton(
    label: L.onboarding.continueLabel,
    onPressed: () {
      if (current < _Constants.pageCount - 1) {
        final next = current + 1;
        context.read<OnboardingBloc>().add(OnboardingEventChangePage(next));
      } else {
        context.go('/paywall');
      }
    },
  );
}
