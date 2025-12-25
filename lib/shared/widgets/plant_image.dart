import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubx_case/shared/utils/widget_padding_extension.dart';

class PlantImage extends StatelessWidget {
  const PlantImage({
    required this.assetPath,
    super.key,
    this.fit = BoxFit.contain,
    this.padding = EdgeInsetsDirectional.zero,
    this.width,
    this.height,
  });

  final String assetPath;
  final BoxFit fit;
  final EdgeInsetsDirectional padding;
  final double? width;
  final double? height;

  bool get _isSvg => assetPath.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final image = _isSvg
        ? SvgPicture.asset(
            assetPath,
            fit: fit,
            width: width,
            height: height,
          )
        : Image.asset(
            assetPath,
            fit: fit,
            width: width,
            height: height,
          );

    return image.padding(padding);
  }
}
