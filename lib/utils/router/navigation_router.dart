import 'package:flutter/material.dart';
import 'package:fortune_gallery/utils/router/navigation_route_names.dart';

Route<dynamic> generateRoute(RouteSettings? settings) {
  switch (settings!.name) {
    case splashScreenViewRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: Container(),
      );

    // case welcomeBackViewRoute:
    //   Map<String, dynamic> args = settings.arguments! as Map<String, dynamic>;
    //   String _fName = args['firstName'];
    //   String _username = args['email'];
    //   return _getPageRoute(
    //     routeName: settings.name!,
    //     viewToShow: WelcomeBack(_fName, _username),
    //   );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow!);
}
