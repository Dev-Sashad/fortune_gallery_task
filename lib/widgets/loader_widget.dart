import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:shimmer/shimmer.dart';

class LoaderWidget extends StatelessWidget {
  final double? height;
  final BoxShape? shape;
  final double? width;
  final Color? loaderColor;
  final EdgeInsetsGeometry? margin;
  const LoaderWidget(
      {super.key,
      this.height,
      this.shape = BoxShape.rectangle,
      this.width,
      this.margin,
      this.loaderColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: loaderColor ?? AppColors.primaryColor.withOpacity(0.4),
        direction: ShimmerDirection.ltr,
        period: const Duration(milliseconds: 1500),
        highlightColor: AppColors.lightGrey,
        child: Container(
          height: height ?? 100,
          width: width ?? 100,
          margin: margin ?? const EdgeInsets.all(1),
          //padding: pad(both: 15),
          decoration: BoxDecoration(
            shape: shape!,
            borderRadius:
                shape == BoxShape.circle ? null : BorderRadius.circular(15.r),
            color: AppColors.primaryColor.withOpacity(0.4),
          ),
        ));
  }
}

class Screenloader extends StatelessWidget {
  final int count;
  final Color? loaderColor;
  const Screenloader(this.count, {super.key, this.loaderColor});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            count,
            (index) => Shimmer.fromColors(
                baseColor:
                    loaderColor ?? AppColors.primaryColor.withOpacity(0.4),
                direction: ShimmerDirection.ltr,
                period: const Duration(milliseconds: 800),
                highlightColor: AppColors.lightGrey,
                child: Container(
                  height: eqH(80),
                  width: screenWidth,
                  margin: EdgeInsets.only(
                    bottom: eqH(15),
                  ),
                  //padding: pad(both: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor.withOpacity(0.4),
                  ),
                ))));
  }
}
