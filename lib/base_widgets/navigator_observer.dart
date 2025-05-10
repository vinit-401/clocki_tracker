import 'package:flutter/material.dart';

import '../constants/logs.dart';
import '../constants/routes/routes_list.dart';
import '../providers/drawer_provider.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  final DrawerStateProvider drawerStateProvider;

  CustomNavigatorObserver({required this.drawerStateProvider});

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    /// Update the drawer state after popping a screen
    if (previousRoute != null) {
      final String routeName =
          previousRoute.settings.name ?? RouteList.homeScreenRoute;

      /// Update the selected screen and index based on the previous screen
      switch (routeName) {
        case RouteList.homeScreenRoute:
          drawerStateProvider.changeSelectedIndex(0);
          break;
        default:
          drawerStateProvider.changeSelectedIndex(0);
      }
    }
  }

  /// Understanding...
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    PRINT_LOGS("ROUTE NAME PUSHED", '${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? oldRoute, Route<dynamic>? newRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    PRINT_LOGS("ROUTE NAME REPLACED ",
        '${oldRoute?.settings.name} ---->>>> ${newRoute?.settings.name}');
  }
}
