import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class RefreshWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;

  const RefreshWidget({
    super.key,
    this.onPressed,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const VerticalSpace(20),
            Container(
                padding: EdgeInsets.all(30.sp),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.15),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.error_outline,
                  size: 60.sp,
                )),
            const VerticalSpace(20),
            CustomText(
              text ?? "Oops, something went wrong. Try again!!",
              textAlign: TextAlign.center,
            ),
            VerticalSpace(eqH(5)),
            TextButton(
                onPressed: onPressed,
                child: const CustomText(
                  "Refresh",
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  textType: TextType.largeText,
                ))
          ],
        ));
  }
}
