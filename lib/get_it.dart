import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'get_it.config.dart';

const ios = Environment('ios');
const web = Environment('web');
const android = Environment('android');

@InjectableInit(initializerName: r'init')
FutureOr<void> configDependencies() async {
  GetIt.I.init();
}

String get environment {
  if (kIsWeb) {
    return web.name;
  }
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return ios.name;
  }
  if (defaultTargetPlatform == TargetPlatform.android) {
    return android.name;
  }
  return 'other';
}

@module
abstract class RegisterModule {}
