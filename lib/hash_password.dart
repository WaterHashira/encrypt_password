
import 'dart:async';

import 'package:flutter/services.dart';

class HashPassword {
  static const MethodChannel _channel = MethodChannel('hash_password');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
