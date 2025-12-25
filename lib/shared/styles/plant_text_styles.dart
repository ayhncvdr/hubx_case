import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class PlantTextStyles {
  static const String fontFamily = 'Roboto';

  static double _height(int lineHeight, int fontSize) => lineHeight / fontSize;

  static TextStyle _base(BuildContext context) => GoogleFonts.roboto(
        color: Theme.of(context).colorScheme.onSurface,
        letterSpacing: 0,
      );

  // Headlines 28px
  static TextStyle headline28Regular(BuildContext context) => _base(context).copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.0,
      );

  static TextStyle headline28Medium(BuildContext context) => _base(context).copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        height: 1.0,
      );

  static TextStyle headline28SemiBold(BuildContext context) => _base(context).copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.0,
      );

  static TextStyle headline28ExtraBold(BuildContext context) => _base(context).copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        height: 1.0,
      );

  // Headlines 24px
  static TextStyle headline24Medium(BuildContext context) => _base(context).copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.0,
      );

  // Headlines
  static TextStyle headline1Bold(BuildContext context) => _base(context).copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: _height(44, 36),
      );

  static TextStyle headline2Semi(BuildContext context) => _base(context).copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: _height(40, 32),
      );

  static TextStyle headline3Semi(BuildContext context) => _base(context).copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: _height(32, 24),
      );

  // Titles
  static TextStyle title20Semi(BuildContext context) => _base(context).copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: _height(28, 20),
      );

  static TextStyle title18Medium(BuildContext context) => _base(context).copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: _height(24, 18),
      );

  static TextStyle title16Medium(BuildContext context) => _base(context).copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: _height(22, 16),
      );

  // Body
  static TextStyle body16SemiBold(BuildContext context) => _base(context).copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: _height(24, 16),
      );

  static TextStyle body16Regular(BuildContext context) => _base(context).copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: _height(22, 16),
      );

  static TextStyle body14Regular(BuildContext context) => _base(context).copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: _height(20, 14),
      );

  static TextStyle body12Regular(BuildContext context) => _base(context).copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: _height(16, 12),
      );

  static TextStyle body11Regular(BuildContext context) => _base(context).copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: _height(15, 11),
      );
}
