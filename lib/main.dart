import 'package:flutter/material.dart';
import 'package:yod/yod.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

import 'injection.dart';

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
          theme: RamThemeApp.lightTheme(),
          darkTheme: RamThemeApp.darkTheme(),
          debugShowCheckedModeBanner: false,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.ramTheme.surface,
      appBar: AppBar(
        backgroundColor: context.ramTheme.primary,
        title: RamTitleText(
          text: widget.title,
          colorText: context.ramTheme.onPrimary,
        ),
      ),
      body: RamGridview(
        itemCount: 16,
        itemBuilder: (context, index) {
          return RamCardNetworkImage(
            imageUrl: mockImageUrl,
            title: 'Title $index',
            description: 'Description $index',
          );
        },
      ),
      extendBody: true,
      bottomNavigationBar: RamBottomBarNavigation(controller: controller),
    );
  }
}
