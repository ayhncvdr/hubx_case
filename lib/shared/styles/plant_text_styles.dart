import 'package:flutter/material.dart';
import 'package:hubx_case/core/theme/plant_colors.dart';

abstract class PlantTextStyles {
  static const String fontFamily = 'Roboto';

  static double _height(int lineHeight, int fontSize) => lineHeight / fontSize;

  static const TextStyle _base = TextStyle(
    fontFamily: fontFamily,
    color: PlantColors.primaryText,
    letterSpacing: 0,
  );

  // Headlines 28px
  static final TextStyle headline28Regular = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.0,
  );

  static final TextStyle headline28Medium = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.0,
  );

  static final TextStyle headline28SemiBold = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.0,
  );

  static final TextStyle headline28ExtraBold = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    height: 1.0,
  );

  // Headlines 24px
  static final TextStyle headline24Medium = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.0,
  );

  // Headlines
  static final TextStyle headline1Bold = _base.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: _height(44, 36),
  );

  static final TextStyle headline2Semi = _base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: _height(40, 32),
  );

  static final TextStyle headline3Semi = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: _height(32, 24),
  );

  // Titles
  static final TextStyle title20Semi = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: _height(28, 20),
  );

  static final TextStyle title18Medium = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: _height(24, 18),
  );

  static final TextStyle title16Medium = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: _height(22, 16),
  );

  // Body
  static final TextStyle body16SemiBold = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: _height(24, 16),
  );

  static final TextStyle body16Regular = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: _height(22, 16),
  );

  static final TextStyle body14Regular = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: _height(20, 14),
  );

  static final TextStyle body12Regular = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: _height(16, 12),
  );

  static final TextStyle body11Regular = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: _height(15, 11),
  );
}
