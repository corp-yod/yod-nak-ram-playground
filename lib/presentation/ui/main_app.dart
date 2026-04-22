import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/core/overlay/assistive_touch_service.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/fake_store.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/menu_item.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/seek_golden.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/travel_to_gether.dart';
import 'package:yod_nak_ram_app/route.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<MenuItem> listMenu = [TravelToGether(), FakeStore(), SeekGolden()];

  @override
  void initState() {
    super.initState();
    print('#->>> MainApp initState ${rootNavigatorKey.currentWidget}');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AssistiveTouchService().init(rootNavigatorKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
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
        leading: const Icon(Icons.home),
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
