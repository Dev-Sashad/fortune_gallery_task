import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class ToastText extends StatelessWidget {
  final String? text;
  const ToastText({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 64.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: CustomText(text ?? "",
          textType: TextType.smallestText, color: Colors.white),
    );
  }
}
