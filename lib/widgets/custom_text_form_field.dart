import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortune_gallery/_lib.dart';

class CustomFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool? showMargin;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final bool? isMultiline;
  final bool? obscure;
  final bool? readOnly;
  final bool? enabled;
  final AutovalidateMode? autovalidateMode;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onEditCompleted;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? toggleShowPassword;
  final void Function()? onInfoPressed;
  final bool? showInfo;
  final IconData? topIcon;
  final bool useBoldLabel;
  final double boarderRadius;
  final double? topContentPad;
  final Color? labelColor;

  const CustomFormField(
    this.label, {
    super.key,
    this.useBoldLabel = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.hintText,
    this.onInfoPressed,
    this.showInfo = false,
    this.maxLines = 5,
    this.minLines = 2,
    this.boarderRadius = 5,
    this.controller,
    this.topContentPad = 0,
    this.showMargin = true,
    this.isMultiline = false,
    this.obscure = false,
    this.prefixIcon,
    this.maxLength,
    this.maxLengthEnforcement = MaxLengthEnforcement.none,
    this.readOnly = false,
    this.enabled = true,
    this.fontSize = 16,
    this.labelColor,
    this.focusNode,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.inputFormatters,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.topIcon = Icons.info,
    this.onChanged,
    this.onSaved,
    this.onEditCompleted,
    this.validator,
    this.suffixIcon,
    this.toggleShowPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  useBoldLabel
                      ? CustomText(
                          label!,
                          textType: TextType.smallText,
                          fontWeight: FontWeight.w600,
                          color: labelColor ?? Theme.of(context).primaryColor,
                        )
                      : CustomText(
                          label!,
                          textType: TextType.smallText,
                          color: labelColor,
                        ),
                  showInfo!
                      ? InkWell(
                          onTap: onInfoPressed,
                          child: Icon(topIcon,
                              size: 20, color: AppColors.primaryColor))
                      : const HorizontalSpace(0)
                ],
              )
            : const VerticalSpace(0),
        VerticalSpace(label != null ? 5 : 0),
        Container(
          margin: showMargin!
              ? EdgeInsets.only(bottom: eqH(25))
              : EdgeInsets.only(bottom: eqH(0)),
          child: TextFormField(
            autovalidateMode: autovalidateMode,
            onChanged: onChanged,
            inputFormatters: inputFormatters ?? [],
            onEditingComplete: onEditCompleted,
            onSaved: onSaved,
            onTap: onTap,
            controller: controller,
            obscureText: obscure!,
            readOnly: readOnly!,
            enabled: enabled,
            focusNode: focusNode,
            validator: validator,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor ?? AppColors.darkGrey, fontSize: fontSize),
            textInputAction: isMultiline! ? null : textInputAction,
            maxLength: maxLength,
            maxLengthEnforcement: maxLengthEnforcement,
            keyboardType: isMultiline! ? TextInputType.multiline : keyboardType,
            minLines: isMultiline! ? minLines : null,
            maxLines: isMultiline!
                ? maxLines
                : obscure!
                    ? 1
                    : null,
            decoration: InputDecoration(
                hintText: hintText,
                counterText: "",
                errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.red,
                      fontSize: 12,
                    ),
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.darkGrey, fontSize: 14.sp),
                contentPadding: EdgeInsets.only(left: 20, top: topContentPad!),
                fillColor: fillColor ?? AppColors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(boarderRadius),
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.mediumGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(boarderRadius),
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.mediumGrey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(boarderRadius),
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.mediumGrey,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(boarderRadius),
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.mediumGrey,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(boarderRadius),
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.mediumGrey,
                  ),
                ),
                suffixIconConstraints:
                    BoxConstraints(maxHeight: 60.sp, maxWidth: 50.sp),
                prefixIconConstraints:
                    BoxConstraints(maxHeight: 60.sp, maxWidth: 50.sp),
                prefixIcon: prefixIcon,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: toggleShowPassword != null
                      ? InkWell(
                          onTap: toggleShowPassword,
                          child: Icon(
                            obscure!
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: AppColors.mediumGrey,
                            size: 20.sp,
                          ),
                        )
                      : suffixIcon,
                )),
          ),
        ),
      ],
    );
  }
}
