import 'package:flutter/material.dart';
import 'package:fortune_gallery/_lib.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Widget? bottomNavigationBar;
  final bool showIcon;
  final double? topSpace;
  final double? initialSpace;
  final bool willPopValue;
  final VoidCallback? arrowBackCallBack;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const BaseScaffold(
      {super.key,
      this.showIcon = true,
      this.floatingActionButton,
      this.bottomNavigationBar,
      this.initialSpace,
      this.floatingActionButtonLocation,
      this.arrowBackCallBack,
      this.willPopValue = true,
      this.topSpace = 10,
      this.child,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: WillPopScope(
        onWillPop: () async {
          return willPopValue;
        },
        child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: eqW(20)),
              child: Column(
                children: [
                  VerticalSpace(topSpace),
                  HeaderWidget(
                    title: title,
                    showIcon: showIcon,
                    arrowBackCallBack: arrowBackCallBack,
                  ),
                  VerticalSpace(eqH(initialSpace ?? 24)),
                  Expanded(child: child!)
                ],
              ),
            )),
      ),
    );
  }
}
