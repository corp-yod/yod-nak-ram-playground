import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yod/yod.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

import 'injection.dart';

class LoginManager extends YodManager {
  var counter = 0.yor;

  void incrementCounter() {
    counter.value++;
  }
}

Future<void> main() async {
  await injection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Yod.resolve<ThemeManager>();
    return YodBuilder(
      builder: () {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: YodThemeApp.lightTheme(),
          darkTheme: YodThemeApp.darkTheme(),
          themeMode: themeManager.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
