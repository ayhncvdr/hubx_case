import 'package:flutter/widgets.dart';
import 'package:hubx_case/shared/styles/breakpoints.dart';

extension MediaQueryValues on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  double get statusBarHeight => padding.top;

  bool get isXs => screenWidth <= Breakpoints.xs;

  bool get isSm => screenWidth > Breakpoints.xs && screenWidth <= Breakpoints.sm;

  bool get isMd => screenWidth > Breakpoints.sm && screenWidth <= Breakpoints.md;

  bool get isLg => screenWidth > Breakpoints.md && screenWidth <= Breakpoints.lg;

  bool get isXl => screenWidth > Breakpoints.lg;
}
