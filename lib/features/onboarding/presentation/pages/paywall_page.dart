import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/di/injection_container.dart';
import 'package:hubx_case/core/theme/plant_color_extension.dart';
import 'package:hubx_case/core/theme/plant_dimens.dart';
import 'package:hubx_case/core/theme/plant_radii.dart';
import 'package:hubx_case/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/utils/plant_assets.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';
import 'package:hubx_case/shared/widgets/plant_button.dart';
import 'package:hubx_case/shared/widgets/plant_image.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

abstract class _Constants {
  static const double benefitCardBackgroundOpacity = 0.08;
  static const double benefitCardBorderOpacity = 0.08;
  static const double benefitCardIconBackgroundOpacity = 0.12;
  static const double benefitCardWidth = 150.0;
  static const double planTileBorderOpacity = 0.2;
  static const double planTileBackgroundOpacity = 0.1;
  static const double borderWidth = 1.5;
}

class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  bool _isClosing = false;

  Future<void> _handleClose(BuildContext blocContext, bool isCompleted) async {
    if (!blocContext.mounted) {
      return;
    }

    if (isCompleted) {
      if (blocContext.canPop()) {
        blocContext.pop();
      } else {
        blocContext.go('/home');
      }
    } else {
      // Not completed yet - mark as completed and navigate
      if (!blocContext.mounted) {
        return;
      }
      _isClosing = true;
      blocContext.read<OnboardingBloc>().add(const OnboardingEventClosePaywall());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingBloc>()..add(const OnboardingEventLoadStatus()),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listenWhen: (previous, current) => _isClosing && previous.completed != current.completed && current.completed,
        listener: (context, state) {
          // Navigate when onboarding is completed during this session
          if (!mounted) {
            return;
          }
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/home');
          }
        },
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (!didPop) {
                await _handleClose(context, state.completed);
              }
            },
            child: PlantScaffold(
              body: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.plantColors.paywallBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildHero(context, state.completed),
                            _buildBenefits()
                                .paddingSymmetric(
                                  horizontal: PlantDimens.x20,
                                )
                                .paddingOnly(bottom: PlantDimens.x24),
                            _buildPlanOptions(context, state)
                                .paddingSymmetric(
                                  horizontal: PlantDimens.x20,
                                )
                                .paddingOnly(bottom: PlantDimens.x24),
                            _buildCTA(context)
                                .paddingSymmetric(
                                  horizontal: PlantDimens.x20,
                                )
                                .paddingOnly(bottom: PlantDimens.x20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHero(BuildContext context, bool completed) {
    return Stack(
      children: [
        const PlantImage(
          assetPath: PlantAssets.onboardingPaywallFlowers,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: PlantDimens.x48,
          right: PlantDimens.x20,
          child: InkWell(
            borderRadius: BorderRadius.circular(PlantRadii.x16),
            onTap: () {
              _handleClose(context, completed);
            },
            child: Builder(
              builder: (ctx) {
                final colorScheme = Theme.of(ctx).colorScheme;
                final plantColors = ctx.plantColors;
                return Container(
                  padding: const EdgeInsets.all(PlantDimens.x8),
                  decoration: BoxDecoration(
                    color: plantColors.paywallCloseButtonBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: colorScheme.surface),
                );
              },
            ),
          ),
        ),
        Positioned(
          left: PlantDimens.x20,
          right: PlantDimens.x20,
          bottom: PlantDimens.x24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (ctx) {
                  final colorScheme = Theme.of(ctx).colorScheme;
                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: L.onboarding.paywallPremiumTitle,
                          style: PlantTextStyles.headline28SemiBold(ctx).copyWith(color: colorScheme.surface),
                        ),
                        TextSpan(
                          text: L.onboarding.paywallPremiumSubtitle,
                          style: PlantTextStyles.headline28Regular(ctx).copyWith(color: colorScheme.surface),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Builder(
                builder: (ctx) {
                  final colorScheme = Theme.of(ctx).colorScheme;
                  return PlantText(
                    L.onboarding.paywallAccessFeatures,
                    style: PlantTextStyles.title18Medium(ctx).copyWith(color: colorScheme.surface),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBenefits() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _benefitCard(
            icon: Icons.all_inclusive,
            title: L.onboarding.paywallBenefitUnlimitedTitle,
            subtitle: L.onboarding.paywallBenefitUnlimitedSubtitle,
          ),
          _benefitCard(
            icon: Icons.flash_on,
            title: L.onboarding.paywallBenefitFasterTitle,
            subtitle: L.onboarding.paywallBenefitFasterSubtitle,
          ).paddingOnly(start: PlantDimens.x12),
          _benefitCard(
            icon: Icons.flash_on,
            title: L.onboarding.paywallBenefitFasterTitle,
            subtitle: L.onboarding.paywallBenefitFasterSubtitle,
          ).paddingOnly(start: PlantDimens.x12),
        ],
      ),
    );
  }

  Widget _benefitCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return SizedBox(
          width: _Constants.benefitCardWidth,
          child: Container(
            padding: const EdgeInsets.all(PlantDimens.x16),
            decoration: BoxDecoration(
              color: colorScheme.surface.withOpacity(_Constants.benefitCardBackgroundOpacity),
              borderRadius: BorderRadius.circular(PlantRadii.x12),
              border: Border.all(
                color: colorScheme.surface.withOpacity(_Constants.benefitCardBorderOpacity),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(PlantDimens.x8),
                  decoration: BoxDecoration(
                    color: colorScheme.surface.withOpacity(_Constants.benefitCardIconBackgroundOpacity),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: colorScheme.surface),
                ),
                PlantText(
                  title,
                  style: PlantTextStyles.title18Medium(context).copyWith(color: colorScheme.surface),
                ).paddingOnly(top: PlantDimens.x12),
                PlantText(
                  subtitle,
                  style: PlantTextStyles.body14Regular(context).copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlanOptions(BuildContext context, OnboardingState state) {
    return Column(
      children: [
        _planTile(
          title: L.onboarding.paywallPlanMonthTitle,
          subtitle: L.onboarding.paywallPlanMonthSubtitle,
          selected: state.selectedPlanIndex == 0,
          onTap: () => context.read<OnboardingBloc>().add(const OnboardingEventSelectPlan(0)),
        ),
        _planTile(
          title: L.onboarding.paywallPlanYearTitle,
          subtitle: L.onboarding.paywallPlanYearSubtitle,
          selected: state.selectedPlanIndex == 1,
          badgeText: L.onboarding.paywallPlanYearBadge,
          onTap: () => context.read<OnboardingBloc>().add(const OnboardingEventSelectPlan(1)),
        ).paddingOnly(top: PlantDimens.x12),
      ],
    );
  }

  Widget _planTile({
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
    String? badgeText,
  }) {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        final borderColor =
            selected ? colorScheme.primary : colorScheme.surface.withOpacity(_Constants.planTileBorderOpacity);
        final bgColor =
            selected ? colorScheme.primary.withOpacity(_Constants.planTileBackgroundOpacity) : Colors.transparent;
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(PlantRadii.x12),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(PlantDimens.x16),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(PlantRadii.x12),
                  border: Border.all(
                    color: borderColor,
                    width: _Constants.borderWidth,
                  ),
                ),
                child: Row(
                  children: [
                    _buildRadioButton(context, selected),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PlantText(
                            title,
                            style: PlantTextStyles.title18Medium(context).copyWith(color: colorScheme.surface),
                          ),
                          PlantText(
                            subtitle,
                            style: PlantTextStyles.body14Regular(context).copyWith(color: Colors.white70),
                          ),
                        ],
                      ).paddingOnly(start: PlantDimens.x12),
                    ),
                  ],
                ),
              ),
              if (badgeText != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PlantDimens.x12,
                      vertical: PlantDimens.x8,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(PlantRadii.x16),
                        bottomLeft: Radius.circular(PlantRadii.x16),
                      ),
                    ),
                    child: PlantText(
                      badgeText,
                      style: PlantTextStyles.body12Regular(context).copyWith(color: colorScheme.surface),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRadioButton(BuildContext context, bool selected) {
    final colorScheme = Theme.of(context).colorScheme;
    if (selected) {
      return Container(
        width: PlantDimens.x24,
        height: PlantDimens.x24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.primary,
        ),
        child: Center(
          child: Container(
            width: PlantDimens.x8,
            height: PlantDimens.x8,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: PlantDimens.x24,
        height: PlantDimens.x24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.surface.withOpacity(0.08),
        ),
      );
    }
  }

  Widget _buildCTA(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PlantButton(
          label: L.onboarding.paywallCtaButton,
          onPressed: () {
            /* No action */
          },
        ).paddingOnly(bottom: PlantDimens.x8),
        PlantText(
          L.onboarding.paywallCtaDisclaimer,
          style: PlantTextStyles.body11Regular(context).copyWith(color: Colors.white70),
          textAlign: TextAlign.center,
        ).paddingOnly(bottom: PlantDimens.x8),
        PlantText(
          L.onboarding.paywallFooter,
          style: PlantTextStyles.body12Regular(context).copyWith(color: Colors.white70),
          textAlign: TextAlign.center,
        ).paddingOnly(bottom: PlantDimens.x12),
      ],
    );
  }
}
