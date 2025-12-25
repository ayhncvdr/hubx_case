import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hubx_case/core/theme/color_schemes.dart';
import 'package:hubx_case/core/theme/plant_color_extension.dart';
import 'package:hubx_case/core/theme/plant_dimens.dart';
import 'package:hubx_case/core/theme/plant_radii.dart';
import 'package:hubx_case/core/theme/typography.dart';

class PlantTheme {
  static ThemeData get light => _buildTheme(lightColorScheme);

  static ThemeData _buildTheme(ColorScheme scheme) {
    final base = ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      scaffoldBackgroundColor: scheme.surface,
      extensions: const <ThemeExtension<dynamic>>[
        PlantColorExtension.light,
      ],
    );

    final textTheme = GoogleFonts.robotoTextTheme(base.textTheme);

    return base.copyWith(
      textTheme: buildTextTheme(textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: PlantDimens.x20,
            vertical: PlantDimens.x12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PlantRadii.x12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PlantRadii.x12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(PlantRadii.x12),
        ),
      ),
    );
  }
}
