import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutterwave_platform_interface.dart';

/// An implementation of [FlutterwavePlatform] that uses method channels.
class MethodChannelFlutterwave extends FlutterwavePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutterwave');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  getFlutterwave({required String amount}) async {
    final version = await methodChannel.invokeMethod('flutterwave2',[amount]);
    return version;
  }
}
