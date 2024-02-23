import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class NoHistoryWidget extends StatelessWidget {
  final String? text;

  const NoHistoryWidget({
    super.key,
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
            Container(
              padding: EdgeInsets.all(30.sp),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.15),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                size: 80.sp,
              ),
            ),
            const VerticalSpace(10),
            SizedBox(
              width: eqW(280),
              child: CustomText(
                text ?? "No Record Found",
                textAlign: TextAlign.center,
                fontSize: 22.sp,
                textType: TextType.mediumText,
              ),
            ),
            const VerticalSpace(20),
          ],
        ));
  }
}
