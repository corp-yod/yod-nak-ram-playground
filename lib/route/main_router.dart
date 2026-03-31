import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/presentation/ui/main_app.dart';
import 'package:yod_navigator/yod_navigator.dart';

class YodRoutor extends YodRouterGenerator {
  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MainApp();
          },
        );
      case '/home':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MainApp();
          },
        );
    }
    return null;
  }

  @override
  Set<String> routes() {
    return {'/', '/home'};
  }
}
