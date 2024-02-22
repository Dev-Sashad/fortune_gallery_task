import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class CallToActionDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? declineText;
  final String? acceptText;
  final VoidCallback? route;
  final VoidCallback? declineroute;
  final Color? acceptColor;
  const CallToActionDialog(
      {this.message,
      this.acceptText = "Yes",
      this.declineText = "No",
      this.declineroute,
      this.acceptColor,
      this.title,
      this.route,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 25.sp),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title ?? '',
              textType: TextType.largeText,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            const VerticalSpace(5),
            RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: message,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.black),
                )),
            VerticalSpace(eqH(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    if (declineroute != null) {
                      declineroute!();
                    }
                  },
                  child: Container(
                    constraints:
                        BoxConstraints(minWidth: eqW(100), maxHeight: 40),
                    padding: EdgeInsets.symmetric(
                      horizontal: eqW(20),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: AppColors.darkGrey)),
                    child: CustomText(
                      declineText!,
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                HorizontalSpace(eqW(10)),
                InkWell(
                  onTap: () {
                    if (route != null) {
                      Navigator.of(context).pop();
                      route!();
                    }
                  },
                  child: Container(
                    constraints:
                        BoxConstraints(minWidth: eqW(100), maxHeight: 40),
                    padding: EdgeInsets.symmetric(
                      horizontal: eqW(20),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: acceptColor ??
                            Theme.of(context).colorScheme.primary),
                    child: CustomText(
                      acceptText!,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
