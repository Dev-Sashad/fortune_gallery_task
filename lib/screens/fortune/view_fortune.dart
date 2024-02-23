import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:fortune_gallery/utils/helpers/time_utils.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20.sp),
        child: FloatingActionButton(
          onPressed: () {
            navigationService.pushScreen(AddFortuneScreen(
              data: data,
            ));
            Navigator.pop(context);
          },
          shape: const CircleBorder(),
          backgroundColor: AppColors.black,
          child: Icon(
            Icons.edit_outlined,
            size: 30.sp,
            color: AppColors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < -4) {
            Navigator.pop(context);
          }
        },
        child: Container(
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
                child: SafeArea(
                  bottom: false,
                  child: Center(
                    child: CustomScrollWidget(
                      child: CustomText(
                        (data.message ?? "").capitalizeFirst ?? "",
                        textType: TextType.mediumText,
                        textAlign: TextAlign.center,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              VerticalSpace(eqH(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white.withOpacity(0.4)),
                    child: CustomText(
                      formatMonthYear(data.dateCreated),
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
