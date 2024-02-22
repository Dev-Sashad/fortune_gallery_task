import 'package:flutter/material.dart';

class VerticalSpace extends SizedBox {
  const VerticalSpace(
    final double? height, {
    super.key,
  }) : super(height: height ?? 0);
}

class HorizontalSpace extends SizedBox {
  const HorizontalSpace(
    final double? width, {
    super.key,
  }) : super(width: width ?? 0);
}
