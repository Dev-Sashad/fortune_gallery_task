import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:fortune_gallery/utils/helpers/time_utils.dart';

class ViewFortuneScreen extends StatelessWidget with UIToolMixin {
  final Color? color;

  final FortuneModel data;
  ViewFortuneScreen({
    super.key,
    required this.data,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationService.pushScreen(const AddFortuneScreen());
          Navigator.pop(context);
        },
        backgroundColor: AppColors.black,
        child: Icon(
          Icons.edit_outlined,
          size: 30.sp,
          color: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Container(
        height: screenHeight * 0.75,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: eqW(20), vertical: eqH(20)),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight * 0.55,
              child: CustomScrollWidget(
                child: Center(
                  child: CustomText(
                    data.message ?? "",
                    textType: TextType.mediumText,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            VerticalSpace(eqH(20)),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: color!.withOpacity(0.15)),
                  child: CustomText(
                    formatMonthYear(data.dateCreated),
                    fontSize: 10.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
