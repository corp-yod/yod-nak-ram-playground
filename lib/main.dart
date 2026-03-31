import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/app_widget.dart';

import 'injection.dart';

Future<void> main() async {
  await injection();
  await initialApp();
  runApp(const AppWidget());
}
