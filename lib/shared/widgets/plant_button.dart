import 'package:flutter/material.dart';
import 'package:hubx_case/core/theme/plant_colors.dart';
import 'package:hubx_case/core/theme/plant_radii.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class PlantButton extends StatelessWidget {
  const PlantButton({
    required this.label,
    super.key,
    this.onPressed,
    this.backgroundColor = PlantColors.primary,
    this.foregroundColor = PlantColors.white,
    this.padding = PlantButton.defaultPadding,
    this.borderRadius = PlantRadii.x12,
    this.textStyle,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final TextStyle? textStyle;

  static const EdgeInsetsDirectional defaultPadding = EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: PlantText(
        label,
        style: (textStyle ?? PlantTextStyles.body16SemiBold).copyWith(color: foregroundColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
