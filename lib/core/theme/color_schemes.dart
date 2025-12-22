import 'package:flutter/material.dart';
import 'package:hubx_case/core/theme/plant_colors.dart';

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: PlantColors.primary,
  onPrimary: PlantColors.white,
  primaryContainer: Color(0xFFD9F3E6),
  onPrimaryContainer: PlantColors.primaryText,
  secondary: PlantColors.bannerBackground,
  onSecondary: PlantColors.white,
  secondaryContainer: PlantColors.bannerTextGradient1,
  onSecondaryContainer: PlantColors.bannerBackground,
  tertiary: PlantColors.bannerTextGradient2,
  onTertiary: PlantColors.bannerBackground,
  tertiaryContainer: PlantColors.bannerTextGradient1,
  onTertiaryContainer: PlantColors.bannerBackground,
  error: Color(0xFFB00020),
  onError: PlantColors.white,
  errorContainer: Color(0xFFFCD8DF),
  onErrorContainer: Color(0xFF37000B),
  surface: PlantColors.white,
  onSurface: PlantColors.primaryText,
  surfaceContainerHighest: Color(0xFFF4F5F6),
  onSurfaceVariant: PlantColors.text2,
  outline: PlantColors.searchBorder,
  outlineVariant: PlantColors.carousel,
  shadow: Colors.black26,
  scrim: Colors.black54,
  inverseSurface: PlantColors.primaryText,
  onInverseSurface: PlantColors.white,
  inversePrimary: PlantColors.primary,
  surfaceTint: PlantColors.primary,
);

// Placeholder dark scheme; add real values when dark mode is introduced.
const ColorScheme darkColorScheme = lightColorScheme;
