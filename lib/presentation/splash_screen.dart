import 'package:flutter/material.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      YodNavigator().go(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            ClipOval(
              child: RamImageAssets(
                name: 'assets/icons/app_icon_text.png',
                size: Size(258, 258),
              ),
            ),
            Spacer(),
            RamLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
