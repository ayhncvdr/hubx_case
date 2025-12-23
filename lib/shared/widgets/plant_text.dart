import 'package:flutter/material.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';

class PlantText extends StatelessWidget {
  const PlantText(
    this.data, {
    super.key,
    this.style,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.padding = EdgeInsetsDirectional.zero,
  });

  final String data;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final EdgeInsetsDirectional padding;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = color == null ? style : style?.copyWith(color: color);
    return Text(
      data,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    ).padding(padding);
  }
}
