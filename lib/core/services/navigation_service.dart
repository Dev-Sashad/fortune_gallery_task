import 'package:flutter/material.dart';
import 'package:get/get.dart';

BuildContext context = Get.context!;

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  pop() {
    return _navigationKey.currentState!.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacementTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacement(Widget widget) {
    return _navigationKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (c) => widget),
    );
  }

  Future<Object?> pushAndRemoveUntil<T extends Object>(String newRoute) {
    return _navigationKey.currentState!
        .pushNamedAndRemoveUntil(newRoute, (Route<dynamic> route) => false);
  }

  Future<dynamic> popUntil(String routeName) async {
    return _navigationKey.currentState!
        .popUntil(ModalRoute.withName(routeName));
  }

  replaceCurrent(
    Widget widget,
  ) {
    // final currentContext = _navigationKey.currentContext;
    // if (currentContext != null) {
    //   final anchor = ModalRoute.of(currentContext);
    //   if (anchor != null) {
    //     final page = MaterialPageRoute(builder: (context) => widget);
    //     anchor.navigator!.replace(oldRoute: anchor, newRoute: page);
    //   } else {
    //     pop();
    //     pushScreen(widget);
    //   }
    // } else {
    pop();
    pushScreen(widget);
    // }
  }

  Future<dynamic> pushScreen(Widget widget) async {
    return _navigationKey.currentState!.push(
      MaterialPageRoute(builder: (c) => widget),
    );
  }
}
