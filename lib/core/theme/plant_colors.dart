import 'package:flutter/material.dart';

/// Centralized light palette for PlantApp.
/// Add dark counterparts here when introducing dark theme support.
class PlantColors {
  static const Color primaryBackground = Color(0xFFFBFAFA);
  static const Color primary = Color(0xFF28AF6E);
  static const Color primaryText = Color(0xFF13231B);
  static const Color text2 = Color(0xB213231B); // 70% alpha over 13231B
  static const Color text3 = Color(0xB3597165); // 70% alpha over 597165
  static const Color carousel = Color(0x4013231B); // 25% alpha over 13231B
  static const Color white = Color(0xFFFFFFFF);
  static const Color searchBorder = Color(0x40414143); // ~25% alpha over 3C3C43
  static const Color bannerBackground = Color(0xFF24201A);
  static const Color bannerTextGradient1 = Color(0xFFE5C990);
  static const Color bannerTextGradient2 = Color(0xFFE4B046);
  static const Color inactiveText = Color(0xFF979798);
  static const Color searchHint = Color(0xFFAFB0AF);
  static const Color bottomNavBorder = Color(0x1A13231B); // rgba(19, 35, 27, 0.1)
  static const Color fabGradientStart = Color(0xFF28AF6E); // rgba(40, 175, 110, 1)
  static const Color fabGradientEnd = Color(0xFF2CCC80); // rgba(44, 204, 128, 1)
  static const Color fabBorder = Color(0x3DFFFFFF); // rgba(255, 255, 255, 0.24)
  static const Color paywallBackground = Color(0xFF101E17); // rgba(19, 29, 24, 1)
  static const Color paywallCloseButtonBackground = Color(0x73000000); // Colors.black45
  static const Color questionCardOverlay = Color(0x26000000); // rgba(0, 0, 0, 0.15)
  static const Color questionTitleBackground = Color(0x33000000); // rgba(0, 0, 0, 0.2)
  static const Color questionTitleBorder = Color(0x1AFFFFFF); // rgba(255, 255, 255, 0.1)
  static const Color categoryCardBorder = Color(0x1A3C3C43); // rgba(60, 60, 67, 0.1)
}
