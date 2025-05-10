import 'package:clocki_tracker/constants/routes/routes_list.dart';
import 'package:flutter/material.dart';

import '../../ui/splash_screen.dart';

class RoutesHelper {
  /// Create all the routes for navigation...///
  static final Map<String, Widget Function(BuildContext, dynamic)>
      routeBuilders = {
    RouteList.splashRoute: (context, _) => SplashScreen(),
  };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final routeBuilder = routeBuilders[settings.name];
    // its will only if the arguments passed
    if (routeBuilder != null) {
      return PageRouteBuilder(
        settings: RouteSettings(name: settings.name),
        pageBuilder: (context, animation, secondaryAnimation) =>
            routeBuilder(context, settings.arguments),
      );
      // return MaterialPageRoute(builder: (context) => routeBuilder(context, settings.arguments));
    } else {
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text("No route defined for ${settings.name}"),
          ),
        ),
      );
    }
  }
}
