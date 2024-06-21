import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'get_it.config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Flame.device.fullScreen();
  }
  GetIt.I.init();
  await Flame.device.setOrientation(DeviceOrientation.portraitUp);

  runApp(const App());
}
