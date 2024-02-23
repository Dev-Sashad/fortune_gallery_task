import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fortune_gallery/_lib.dart';

class WaitDialog extends StatelessWidget {
  const WaitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 3)
                ],
              ),
              child: SpinKitWaveSpinner(
                color: AppColors.primaryColor,
                size: 100.sp,
                duration: const Duration(milliseconds: 1200),
              ),
            ),
          ],
        ));
  }
}
