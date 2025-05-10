import 'package:clocki_tracker/app_remote_network/dio/dio_client.dart';
import 'package:clocki_tracker/providers/drawer_provider.dart';
import 'package:clocki_tracker/providers/home_screen_provider.dart';
import 'package:clocki_tracker/ui/admin_dashboard/admin_dashboard.dart';
import 'package:clocki_tracker/ui/home/home_screen.dart';
import 'package:clocki_tracker/ui/splash_screen.dart';
import 'package:clocki_tracker/utils/app_string.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'base_widgets/navigator_observer.dart';
import 'constants/routes/routes_helper.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DrawerStateProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                UserProfileProvider(DioClient(Dio(), context))),
      ],
      child: ScreenUtilInit(
        designSize: const Size(340, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Builder(
          builder: (context) {
            final drawerStateProvider =
                Provider.of<DrawerStateProvider>(context);
            return MaterialApp(
              home: AdminDashboard(),

              /// For Smooth handling of the drawer
              navigatorObservers: [
                CustomNavigatorObserver(
                    drawerStateProvider: drawerStateProvider)
              ],
              onGenerateRoute: (settings) =>
                  RoutesHelper.generateRoute(settings),

              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              title: AppString.appName,
              theme: ThemeData(
                //colorScheme: ColorScheme.fromSeed(seedColor: kBlack),
                useMaterial3: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
