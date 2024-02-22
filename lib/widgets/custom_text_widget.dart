import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {Key? key,
      this.color,
      this.textAlign,
      this.textStyle,
      this.maxLines = 50,
      this.textType = TextType.smallText,
      this.decorationColor,
      this.fontWeight,
      this.fontSize,
      this.fontStyle,
      this.textDecoration})
      : super(key: key);

  final TextStyle? textStyle;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextType? textType;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          setTextStyle.copyWith(
              fontSize: fontSize,
              color: color,
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              decoration: textDecoration,
              decorationColor: decorationColor),
    );
  }

  TextStyle get setTextStyle {
    switch (textType) {
      case TextType.headerText:
        return Theme.of(context).textTheme.headlineLarge!;

      case TextType.largeText:
        return Theme.of(context).textTheme.titleLarge!;

      case TextType.mediumText:
        return Theme.of(context).textTheme.bodyLarge!;

      case TextType.smallText:
        return Theme.of(context).textTheme.bodyMedium!;

      case TextType.smallestText:
        return Theme.of(context).textTheme.bodySmall!;

      default:
        return Theme.of(context).textTheme.bodySmall!;
    }
  }
}
