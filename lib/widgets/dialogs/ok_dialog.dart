import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class OkDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final String? buttonMsg;
  final void Function()? onpressed;
  const OkDialog(
      {Key? key,
      this.message,
      this.onpressed,
      this.buttonMsg = "Okay",
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: eqW(40)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              title ?? '',
              textType: TextType.largeText,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: title!.trim().toLowerCase().contains("error") ||
                      title!.trim().toLowerCase().contains("fail")
                  ? AppColors.red
                  : AppColors.darkGrey,
            ),
            const VerticalSpace(10),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: message,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.black, fontSize: 16.sp),
                )),
            const VerticalSpace(10),
            InkWell(
              onTap: onpressed ?? () => Navigator.of(context).pop(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: eqW(30), vertical: 8),
                    margin: const EdgeInsets.only(top: 20.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Theme.of(context).colorScheme.primary),
                    child: CustomText(
                      buttonMsg!,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
