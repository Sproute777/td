import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_dev.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Flame.device.fullScreen();
  }
  await Flame.device.setOrientation(DeviceOrientation.portraitUp);

  runApp(const DevApp());
}
