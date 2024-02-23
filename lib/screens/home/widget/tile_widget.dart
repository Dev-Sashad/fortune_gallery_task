import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:fortune_gallery/utils/helpers/time_utils.dart';
import 'package:get/get.dart';

class HomeTileWidget extends StatelessWidget {
  final Color? color;
  final VoidCallback? onLongPress;
  final FortuneModel data;
  const HomeTileWidget({
    super.key,
    required this.data,
    this.color,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        slideShow(
            widget: ViewFortuneScreen(
              data: data,
              color: color,
            ),
            cont: context);
      },
      onLongPress: onLongPress,
      child: Container(
        height: eqH(250),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: eqW(20), vertical: eqH(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              (data.message ?? "").capitalizeFirst ?? "",
              maxLines: 3,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            VerticalSpace(eqH(20)),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.white.withOpacity(0.4)),
                  child: CustomText(
                    formatMonthYear(data.dateCreated),
                    fontSize: 10.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
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
