import 'dart:io';
import 'package:flutter/material.dart';

class AssetsImage extends StatelessWidget {
  final String imgUrl;
  final BoxFit fit;
  final BoxShape shape;
  final double height;
  final double width;
  final double opacity;
  final Color? color;

  const AssetsImage(
      {super.key,
      required this.imgUrl,
      this.fit = BoxFit.scaleDown,
      this.shape = BoxShape.rectangle,
      this.height = 24,
      this.color,
      this.width = 24,
      this.opacity = 1.0});
  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          color: color ?? Colors.transparent,
          image: DecorationImage(
            image: AssetImage(imgUrl),
            fit: fit,
            opacity: opacity,
          ),
        ),
      );
}

class FilesImage extends StatelessWidget {
  final File file;
  final BoxFit fit;
  final BoxShape shape;
  final double height;
  final double width;
  const FilesImage({
    super.key,
    required this.file,
    this.fit = BoxFit.contain,
    this.shape = BoxShape.rectangle,
    this.height = 24,
    this.width = 24,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
        ),
        child: Image.file(
          file,
          height: height,
          width: width,
          fit: fit,
        ),
      );
}
