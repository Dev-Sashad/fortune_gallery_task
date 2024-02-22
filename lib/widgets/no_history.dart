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
            Icon(
              Icons.hourglass_empty_outlined,
              size: 80.sp,
            ),
            const VerticalSpace(10),
            SizedBox(
              width: eqW(280),
              child: CustomText(
                text ?? "No Record Found",
                textAlign: TextAlign.center,
              ),
            ),
            const VerticalSpace(20),
          ],
        ));
  }
}
