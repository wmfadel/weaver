import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PoImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final Color? color;

  const PoImage(
      this.image, {
        Key? key,
        this.width,
        this.height,
        this.color,
        this.fit = BoxFit.contain,
        this.alignment = Alignment.center,
      }) : super(key: key);

  bool get _isNetworkImage =>
      image.startsWith('http://') || image.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    return image.endsWith('.svg')
        ? _isNetworkImage
        ? SvgPicture.network(
      image,
      width: width,
      height: height,
      alignment: alignment,
      fit: fit,
      color: color,
    )
        : SvgPicture.asset(
      image,
      width: width,
      height: height,
      alignment: alignment,
      fit: fit,
      color: color,
    )
        : _isNetworkImage
        ? CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    )
        : Image.asset(
      image,
      width: width,
      height: height,
      alignment: alignment,
      fit: fit,
    );
  }
}