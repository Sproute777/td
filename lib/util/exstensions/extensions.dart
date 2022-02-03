import 'dart:async';
import 'package:flutter/widgets.dart' as widget;

extension NullableExt<T> on T? {
  FutureOr<void> let(FutureOr<void> Function(T i) call) => call(this!);
}
