import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/theme/plant_colors.dart';
import 'package:hubx_case/core/theme/plant_dimens.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/utils/plant_assets.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';
import 'package:hubx_case/shared/widgets/plant_button.dart';
import 'package:hubx_case/shared/widgets/plant_image.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: PlantColors.primaryBackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const PlantImage(assetPath: PlantAssets.onboardingPot),
                  Positioned(
                    top: PlantDimens.x24,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: L.onboarding.welcomeTitlePrefix,
                                style: PlantTextStyles.headline28Regular,
                              ),
                              TextSpan(
                                text: L.onboarding.welcomeTitleHighlight,
                                style: PlantTextStyles.headline28SemiBold,
                              ),
                            ],
                          ),
                        ).paddingOnly(
                          start: PlantDimens.x20,
                          end: PlantDimens.x20,
                          bottom: PlantDimens.x8,
                        ),
                        PlantText(
                          L.onboarding.welcomeSubtitle,
                          style: PlantTextStyles.body16Regular.copyWith(
                            color: PlantColors.text2,
                          ),
                        ).paddingOnly(
                          start: PlantDimens.x20,
                          end: PlantDimens.x20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PlantButton(
                  label: L.onboarding.getStarted,
                  onPressed: () {
                    context.go('/onboarding');
                  },
                ).paddingOnly(bottom: PlantDimens.x16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: PlantTextStyles.body11Regular.copyWith(
                      color: PlantColors.text3,
                    ),
                    children: [
                      TextSpan(text: L.onboarding.termsPrefix),
                      TextSpan(
                        text: L.onboarding.termsOfUse,
                        style: PlantTextStyles.body11Regular.copyWith(
                          color: PlantColors.text3,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: L.onboarding.termsMiddle),
                      TextSpan(
                        text: L.onboarding.privacyPolicy,
                        style: PlantTextStyles.body11Regular.copyWith(
                          color: PlantColors.text3,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: L.onboarding.termsSuffix),
                    ],
                  ),
                ).paddingOnly(
                  bottom: PlantDimens.x28,
                  start: PlantDimens.x24,
                  end: PlantDimens.x24,
                ),
              ],
            ).paddingSymmetric(horizontal: PlantDimens.x20),
          ],
        ),
      ),
    );
  }
}
