import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/core/theme/plant_color_extension.dart';
import 'package:hubx_case/core/theme/plant_dimens.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';
import 'package:hubx_case/shared/widgets/plant_button.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class HomeErrorView extends StatelessWidget {
  const HomeErrorView({required this.error, super.key});

  final String error;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PlantDimens.x32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: PlantDimens.x72,
                  color: plantColors.text3,
                ),
                PlantText(
                  L.home.errorMessage,
                  style: PlantTextStyles.title18Medium(context).copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ).paddingOnly(top: PlantDimens.x24),
                PlantButton(
                  label: L.home.retry,
                  onPressed: () {
                    context.read<HomeBloc>().add(const HomeEventLoadData());
                  },
                ).paddingOnly(top: PlantDimens.x32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
