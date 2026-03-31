import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/menu_item.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/travel_to_gether.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<MenuItem> listMenu = [TravelToGether()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.ramTheme.primary,
        title: RamTitleText(
          text: 'Home',
          colorText: context.ramTheme.onPrimary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding7),
        child: RamGridview(
          itemCount: listMenu.length,
          itemBuilder: (context, index) {
            return listMenu[index].buildWidget(context);
          },
        ),
      ),
      // bottomNavigationBar: RamBottomBarNavigation(controller: controller),
    );
  }
}
