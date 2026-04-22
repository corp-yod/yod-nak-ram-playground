import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yod/yod.dart';
import 'package:yod_nak_ram_app/core/overlay/assistive_touch_service.dart';
import 'package:yod_nak_ram_app/injection.dart';
import 'package:yod_nak_ram_app/route.dart';
import 'package:yod_nak_ram_app/route/main_route.dart';
import 'package:yod_nak_ram_app/route/main_route_name.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/route.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final GoRouter _goRouterConfig = MainRoute.goRouterConfig;

  @override
  void dispose() {
    super.dispose();
    AssistiveTouchService().dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Yod.resolve<ThemeManager>();
    print('#->>> AppWidget build');
    return YodBuilder(
      builder: () {
        return MaterialApp.router(
          scrollBehavior: CustomScrollBehavior(),
          // title: 'Flutter Demo',
          theme: RamThemeApp.lightTheme(),
          darkTheme: RamThemeApp.darkTheme(),
          themeMode: themeManager.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: _goRouterConfig,
          // builder: (context, child) {
          //   return child ?? const SizedBox.shrink();
          // },
        );
        // return MaterialApp(
        //   scrollBehavior: CustomScrollBehavior(),
        //   // title: 'Flutter Demo',
        //   theme: RamThemeApp.lightTheme(),
        //   darkTheme: RamThemeApp.darkTheme(),
        //   themeMode: themeManager.isDarkMode.value
        //       ? ThemeMode.dark
        //       : ThemeMode.light,
        //   debugShowCheckedModeBanner: false,

        //   // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        //   initialRoute: '/splash',
        //   navigatorKey: navigatorKey,

        //   builder: (context, child) {
        //     return child ?? const SizedBox.shrink();
        //   },
        //   onGenerateRoute: (settings) {
        //     print('#->>> AppWidget onGenerateRoute ${settings.name}');
        //     final mfafRoute = MainRoute().generateRoute(settings);
        //     if (mfafRoute != null) return mfafRoute;

        //     return MainRoute().generateRoute(settings);
        //   },
        //   navigatorObservers: [YodNavigator()],
        // );
      },
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    if (details.direction == AxisDirection.left ||
        details.direction == AxisDirection.right) {
      return child; // Disable the overscroll indicator for horizontal scrolling
    }
    return super.buildOverscrollIndicator(context, child, details);
  }
}

Future<void> initialApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injection();
  MainRoute().init();
  await YodData().init();
  await YodNetworkHttp().init(HttpInitialValue(channel: 'yod_nak_ram_app_v1'));
}
