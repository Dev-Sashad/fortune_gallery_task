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
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 3)
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: eqH(20), top: eqH(20)),
                    child: SpinKitFadingFour(
                      color: AppColors.primaryColor,
                      size: 40.sp,
                      duration: const Duration(milliseconds: 1200),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
