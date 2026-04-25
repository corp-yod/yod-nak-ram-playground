import 'package:yod_nak_ram_app/presentation/splash_screen.dart';
import 'package:yod_nak_ram_app/presentation/ui/main_app.dart';
import 'package:yod_nak_ram_app/route/main_route_name.dart';
import 'package:yod_navigator/yod_navigator.dart';
// import 'package:yod_presentation_fake_store/presentations/main_app_fake_store.dart';
// import 'package:yod_presentation_travel_to_gether/presentation/main_app_travel_together.dart';

class YodRoutor extends YodRouterModule {
  @override
  void init() {}

  @override
  List<YodRouterBase> routes() {
    return [
      YodRouterBase(
        path: RouteNameYod.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      YodRouterBase(
        path: RouteNameYod.main,
        builder: (context, state) => const MainApp(),
      ),
      // YodRouterBase(
      //   path: RouteNameYod.fakeStore,
      //   builder: (context, state) => MainAppFakeStore(),
      // ),
      // YodRouterBase(
      //   path: RouteNameYod.travelMainApp,
      //   builder: (context, state) => const MainAppTravelToGether(),
      // ),
    ];
  }
}

// import 'package:flutter/material.dart';
// import 'package:yod_nak_ram_app/presentation/splash_screen.dart';
// import 'package:yod_nak_ram_app/presentation/ui/main_app.dart';
// import 'package:yod_nak_ram_app/route/main_route_name.dart';
// import 'package:yod_navigator/yod_navigator.dart';
// import 'package:yod_presentation_fake_store/yod_presentation_fake_store.dart';
// import 'package:yod_presentation_travel_to_gether/presentation/main_app_travel_together.dart';

// class YodRoutor extends YodRouterModule {
//   @override
//   void init() {}

//   @override
//   Set<String> routes() {
//     return {
//       RouteNameYod.splash,
//       RouteNameYod.main,
//       RouteNameYod.fakeStore,
//       RouteNameYod.travelMainApp,
//     };
//   }

//   @override
//   Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteNameYod.splash:
//         return MaterialPageRoute(builder: (context) => const SplashScreen());
//       // case '/':
//       //   return PageRouteBuilder(
//       //     settings: settings,
//       //     pageBuilder: (context, animation, secondaryAnimation) {
//       //       return const MainApp();
//       //     },
//       //   );
//       case RouteNameYod.main:
//         return _buildPageRoute(settings, const MainApp());
//       case RouteNameYod.fakeStore:
//         return _buildPageRoute(settings, MainAppFakeStore());
//       case RouteNameYod.travelMainApp:
//         return _buildPageRoute(settings, const MainAppTravelToGether());
//     }
//     return null;
//   }

//   PageRoute _buildPageRoute(RouteSettings settings, Widget page) {
//     return PageRouteBuilder(
//       settings: settings,
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       // แก้เอาตามใจเด้อ บ่รู้จะเอาแบบไหน
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return ScaleTransition(
//           scale: animation,
//           alignment: Alignment.center,
//           child: child,
//         );
//       },
//     );
//   }
// }
