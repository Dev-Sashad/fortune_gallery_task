import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? inactiveOnPressed;

  final double? radius;
  final double? width;
  final bool? active;
  final Color? textColor;
  final Color? borderColor;
  final Color? fillColor;
  final String? text;
  final double? height;
  final double? textSize;
  final double? contentPadding;
  final bool? useRow;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final EdgeInsetsGeometry? margin;

  const CustomButton(
      {super.key,
      this.onPressed,
      this.radius = 5,
      this.width,
      this.height,
      this.margin,
      this.textColor = AppColors.white,
      this.useRow = false,
      this.active = true,
      this.textSize,
      this.inactiveOnPressed,
      this.borderRadiusGeometry,
      this.borderColor = AppColors.primaryColor,
      this.fillColor = AppColors.primaryColor,
      @required this.text,
      this.contentPadding = 15});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: active!
            ? onPressed
            : inactiveOnPressed ??
                () {
                  showToast("complete pending actions");
                },
        child: Container(
            height: height,
            width: width ?? screenWidth,
            margin: margin,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: contentPadding!),
            decoration: BoxDecoration(
                borderRadius:
                    borderRadiusGeometry ?? BorderRadius.circular(radius!),
                color: fillColor,
                border: Border.all(color: borderColor!, width: 1.5)),
            child: useRow!
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text!,
                          color: textColor,
                          fontSize: textSize,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.chevron_left,
                          size: 15,
                          color: textColor,
                        )
                      ],
                    ),
                  )
                : Center(
                    child: CustomText(
                    text!,
                    color: textColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,
                  ))));
  }
}
