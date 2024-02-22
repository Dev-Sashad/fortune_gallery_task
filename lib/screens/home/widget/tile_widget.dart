import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:fortune_gallery/utils/helpers/time_utils.dart';

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
              data.message ?? "",
              maxLines: 3,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
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
