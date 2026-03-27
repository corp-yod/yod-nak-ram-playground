import 'package:yod/yod.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

Future<void> injection() async {
  Yod.register(ThemeManager());
}
