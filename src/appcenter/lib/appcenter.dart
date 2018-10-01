import 'dart:async';

import 'package:flutter/services.dart';

class AppCenter {
  static const MethodChannel _channel = const MethodChannel(
      'aloisdeniel.github.com/flutter_plugin_appcenter/appcenter');

  /// Starts App Center services
  static Future<String> configure(String app_secret) async {
    Future<String> result =
        await _channel.invokeMethod('configure', <String, dynamic>{
      'app_secret': app_secret,
    });
    return result;
  }

  static Future<String> start(String app_secret, List<String> services) async {
    Future<String> result = await _channel.invokeMethod('start',
        <String, dynamic>{'app_secret': app_secret, 'services': services});
    return result;
  }

  static Future<String> get installId async {
    Future<String> result = await _channel.invokeMethod('installId');
    return result;
  }

  static Future<bool> get isEnabled async {
    Future<bool> result = await _channel.invokeMethod('isEnabled');
    return result;
  }

  static Future setEnabled(bool isEnabled) =>
      _channel.invokeMethod('setEnabled', <String, bool>{
        'isEnabled': isEnabled,
      });
}
