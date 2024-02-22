import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class HeaderWidget extends StatelessWidget with UIToolMixin {
  final String? title;
  final bool showIcon;
  final VoidCallback? arrowBackCallBack;
  HeaderWidget(
      {super.key, this.showIcon = true, this.arrowBackCallBack, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: showIcon,
            child: GestureDetector(
              onTap: arrowBackCallBack ?? () => navigationService.pop(),
              child: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                size: 25.sp,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          HorizontalSpace(showIcon && title != null ? eqW(15) : 0),
          title != null
              ? CustomText(
                  title!,
                  textType: TextType.mediumText,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                )
              : const HorizontalSpace(0)
        ],
      ),
    );
  }
}
