import 'package:flutter/material.dart';
import 'package:hubx_case/core/theme/plant_color_extension.dart';
import 'package:hubx_case/core/theme/plant_dimens.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final plantColors = context.plantColors;
    return PlantScaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: plantColors.primaryBackground,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                strokeWidth: 3,
              ),
              PlantText(
                L.home.loading,
                style: PlantTextStyles.body16Regular(context).copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ).paddingOnly(top: PlantDimens.x24),
            ],
          ),
        ),
      ),
    );
  }
}
