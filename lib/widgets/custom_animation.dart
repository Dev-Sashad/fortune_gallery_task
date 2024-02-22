import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class CustomAnimation extends StatelessWidget {
  final Widget child;
  final int position;
  final double? verticalOffset;
  final double? horizontalOffset;
  final int mili;
  const CustomAnimation(
      {super.key,
      required this.child,
      required this.position,
      this.mili = 1000,
      this.horizontalOffset,
      this.verticalOffset});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: AnimationConfiguration.staggeredList(
            duration: Duration(milliseconds: mili),
            position: position,
            child: SlideAnimation(
                verticalOffset: verticalOffset,
                horizontalOffset: horizontalOffset,
                child: FadeInAnimation(
                    duration: Duration(milliseconds: mili), child: child))));
  }
}
