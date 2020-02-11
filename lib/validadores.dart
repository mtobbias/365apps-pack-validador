import 'dart:async';

import 'package:flutter/services.dart';

class Validadores {
  static const MethodChannel _channel =
      const MethodChannel('validadores');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
