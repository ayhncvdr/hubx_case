import 'package:flutter/material.dart';
import 'package:hubx_case/core/theme/plant_radii.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class PlantButton extends StatelessWidget {
  const PlantButton({
    required this.label,
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding = PlantButton.defaultPadding,
    this.borderRadius = PlantRadii.x12,
    this.textStyle,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final TextStyle? textStyle;

  static const EdgeInsetsDirectional defaultPadding = EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveForegroundColor = foregroundColor ?? colorScheme.onPrimary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: PlantText(
        label,
        style: (textStyle ?? PlantTextStyles.body16SemiBold(context)).copyWith(color: effectiveForegroundColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
