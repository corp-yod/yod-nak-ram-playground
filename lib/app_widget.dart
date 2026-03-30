import 'package:flutter/material.dart';
import 'package:yod/yod.dart';
import 'package:yod_nak_ram_app/route.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class LoginManager extends YodManager {
  var counter = 0.yor;

  void incrementCounter() {
    counter.value++;
  }
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Yod.resolve<ThemeManager>();
    return YodBuilder(
      builder: () {
        return MaterialApp(
          scrollBehavior: CustomScrollBehavior(),
          // title: 'Flutter Demo',
          theme: YodThemeApp.lightTheme(),
          darkTheme: YodThemeApp.darkTheme(),
          themeMode: themeManager.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          debugShowCheckedModeBanner: false,

          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          initialRoute: '/',
          navigatorKey: navigatorKey,

          builder: (context, child) {
            return child ?? const SizedBox.shrink();
          },

          onGenerateRoute: (settings) {
            final mfafRoute = MainRoute().generateRoute(settings);
            if (mfafRoute != null) return mfafRoute;

            return MainRoute().generateRoute(settings);
          },
          navigatorObservers: [YodNavigator()],
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final manager = Yod.register(LoginManager());

  @override
  Widget build(BuildContext context) {
    final themeManager = Yod.resolve<ThemeManager>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.yodTheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            YodBuilder(
              builder: () {
                return Text('${manager.counter.value}');
              },
            ),

            ElevatedButton(
              onPressed: () {
                themeManager.isDarkMode.value = !themeManager.isDarkMode.value;
              },
              child: Text('Change Theme'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: manager.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
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
  MainRoute().init();
}
