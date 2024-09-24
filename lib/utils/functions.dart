import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

Future<void> delay([int? val]) async {
  await Future.delayed(Duration(seconds: val ?? 1));
}

appPrint(value) {
  if (kDebugMode) {
    log(value.toString());
  }
}

showToast(message) {
  return showToastWidget(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.r), right: Radius.circular(10.r))),
        child: CustomText(
          message,
          color: AppColors.white,
          fontSize: 12.sp,
        ),
      ),
      context: context);
}

hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

Future<bool> getPermissionStatus() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    var res = await Permission.storage.request();
    if (!res.isGranted) {
      return false;
    } else {
      return true;
    }
  }
  return true;
}

Future<void> showOkayDialog(
    {String title = "Error",
    String buttonMsg = "Okay",
    String message = "",
    VoidCallback? onPressed,
    BuildContext? cont}) {
  return showDialog(
      barrierDismissible: true,
      context: cont ?? context,
      builder: (context) {
        return AnimatedOpacity(
          opacity: 1.0,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),
          child: OkDialog(
            message: message,
            title: title,
            onpressed: onPressed,
            buttonMsg: buttonMsg,
          ),
        );
      });
}

Future<void> showCallToActionDialog(
    {String title = "",
    String message = "",
    String declineText = "No",
    String acceptText = "Yes",
    Color? acceptColor,
    VoidCallback? declineCallback,
    VoidCallback? callback,
    BuildContext? cont}) {
  return showDialog(
      barrierDismissible: true,
      context: cont ?? context,
      builder: (context) {
        return AnimatedOpacity(
          opacity: 1.0,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),
          child: CallToActionDialog(
            acceptText: acceptText,
            declineText: declineText,
            declineroute: declineCallback,
            message: message,
            title: title,
            route: callback,
            acceptColor: acceptColor,
          ),
        );
      });
}

slideUpModal(Widget widget,
    {BuildContext? con,
    bool isScrollControlled = true,
    bool showDragHandle = true,
    Color? backgroundColor}) {
  return showModalBottomSheet(
      enableDrag: true,
      context: con ?? Get.context!,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.85,
      ),
      sheetAnimationStyle: AnimationStyle(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 200),
          reverseCurve: Curves.easeOut),
      showDragHandle: showDragHandle,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      builder: (context) => widget);
}
