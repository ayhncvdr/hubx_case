import 'package:flutter/material.dart';
import 'package:hubx_case/core/theme/plant_colors.dart';

class PlantColorExtension extends ThemeExtension<PlantColorExtension> {
  const PlantColorExtension({
    required this.primaryBackground,
    required this.text3,
    required this.inactiveText,
    required this.searchHint,
    required this.bottomNavBorder,
    required this.fabGradientStart,
    required this.fabGradientEnd,
    required this.fabBorder,
    required this.paywallBackground,
    required this.paywallCloseButtonBackground,
    required this.questionCardOverlay,
    required this.questionTitleBackground,
    required this.questionTitleBorder,
    required this.categoryCardBorder,
  });

  final Color primaryBackground;
  final Color text3;
  final Color inactiveText;
  final Color searchHint;
  final Color bottomNavBorder;
  final Color fabGradientStart;
  final Color fabGradientEnd;
  final Color fabBorder;
  final Color paywallBackground;
  final Color paywallCloseButtonBackground;
  final Color questionCardOverlay;
  final Color questionTitleBackground;
  final Color questionTitleBorder;
  final Color categoryCardBorder;

  static const PlantColorExtension light = PlantColorExtension(
    primaryBackground: PlantColors.primaryBackground,
    text3: PlantColors.text3,
    inactiveText: PlantColors.inactiveText,
    searchHint: PlantColors.searchHint,
    bottomNavBorder: PlantColors.bottomNavBorder,
    fabGradientStart: PlantColors.fabGradientStart,
    fabGradientEnd: PlantColors.fabGradientEnd,
    fabBorder: PlantColors.fabBorder,
    paywallBackground: PlantColors.paywallBackground,
    paywallCloseButtonBackground: PlantColors.paywallCloseButtonBackground,
    questionCardOverlay: PlantColors.questionCardOverlay,
    questionTitleBackground: PlantColors.questionTitleBackground,
    questionTitleBorder: PlantColors.questionTitleBorder,
    categoryCardBorder: PlantColors.categoryCardBorder,
  );

  @override
  ThemeExtension<PlantColorExtension> copyWith({
    Color? primaryBackground,
    Color? text3,
    Color? inactiveText,
    Color? searchHint,
    Color? bottomNavBorder,
    Color? fabGradientStart,
    Color? fabGradientEnd,
    Color? fabBorder,
    Color? paywallBackground,
    Color? paywallCloseButtonBackground,
    Color? questionCardOverlay,
    Color? questionTitleBackground,
    Color? questionTitleBorder,
    Color? categoryCardBorder,
  }) {
    return PlantColorExtension(
      primaryBackground: primaryBackground ?? this.primaryBackground,
      text3: text3 ?? this.text3,
      inactiveText: inactiveText ?? this.inactiveText,
      searchHint: searchHint ?? this.searchHint,
      bottomNavBorder: bottomNavBorder ?? this.bottomNavBorder,
      fabGradientStart: fabGradientStart ?? this.fabGradientStart,
      fabGradientEnd: fabGradientEnd ?? this.fabGradientEnd,
      fabBorder: fabBorder ?? this.fabBorder,
      paywallBackground: paywallBackground ?? this.paywallBackground,
      paywallCloseButtonBackground: paywallCloseButtonBackground ?? this.paywallCloseButtonBackground,
      questionCardOverlay: questionCardOverlay ?? this.questionCardOverlay,
      questionTitleBackground: questionTitleBackground ?? this.questionTitleBackground,
      questionTitleBorder: questionTitleBorder ?? this.questionTitleBorder,
      categoryCardBorder: categoryCardBorder ?? this.categoryCardBorder,
    );
  }

  @override
  ThemeExtension<PlantColorExtension> lerp(
    ThemeExtension<PlantColorExtension>? other,
    double t,
  ) {
    if (other is! PlantColorExtension) {
      return this;
    }

    return PlantColorExtension(
      primaryBackground: Color.lerp(primaryBackground, other.primaryBackground, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
      inactiveText: Color.lerp(inactiveText, other.inactiveText, t)!,
      searchHint: Color.lerp(searchHint, other.searchHint, t)!,
      bottomNavBorder: Color.lerp(bottomNavBorder, other.bottomNavBorder, t)!,
      fabGradientStart: Color.lerp(fabGradientStart, other.fabGradientStart, t)!,
      fabGradientEnd: Color.lerp(fabGradientEnd, other.fabGradientEnd, t)!,
      fabBorder: Color.lerp(fabBorder, other.fabBorder, t)!,
      paywallBackground: Color.lerp(paywallBackground, other.paywallBackground, t)!,
      paywallCloseButtonBackground: Color.lerp(paywallCloseButtonBackground, other.paywallCloseButtonBackground, t)!,
      questionCardOverlay: Color.lerp(questionCardOverlay, other.questionCardOverlay, t)!,
      questionTitleBackground: Color.lerp(questionTitleBackground, other.questionTitleBackground, t)!,
      questionTitleBorder: Color.lerp(questionTitleBorder, other.questionTitleBorder, t)!,
      categoryCardBorder: Color.lerp(categoryCardBorder, other.categoryCardBorder, t)!,
    );
  }
}

extension PlantColorExtensionExtension on BuildContext {
  PlantColorExtension get plantColors => Theme.of(this).extension<PlantColorExtension>()!;
}
