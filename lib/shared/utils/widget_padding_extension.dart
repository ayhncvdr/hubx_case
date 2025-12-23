import 'package:flutter/widgets.dart';

/// Convenience extension to apply padding with EdgeInsetsDirectional.
extension WidgetExtensions on Widget {
  Widget padding(EdgeInsetsDirectional padding) => _withPadding(padding);

  Widget paddingAll(double value) => _withPadding(EdgeInsetsDirectional.all(value));

  Widget paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      _withPadding(EdgeInsetsDirectional.symmetric(vertical: vertical, horizontal: horizontal));

  Widget paddingOnly({double start = 0.0, double top = 0.0, double end = 0.0, double bottom = 0.0}) =>
      _withPadding(EdgeInsetsDirectional.only(start: start, top: top, end: end, bottom: bottom));

  Widget paddingSTEB(double start, double top, double end, double bottom) =>
      _withPadding(EdgeInsetsDirectional.fromSTEB(start, top, end, bottom));

  Widget _withPadding(EdgeInsetsGeometry padding) =>
      padding == EdgeInsets.zero ? this : Padding(padding: padding, child: this);
}
