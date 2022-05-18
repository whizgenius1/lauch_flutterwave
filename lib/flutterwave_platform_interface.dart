import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutterwave_method_channel.dart';

abstract class FlutterwavePlatform extends PlatformInterface {
  /// Constructs a FlutterwavePlatform.
  FlutterwavePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterwavePlatform _instance = MethodChannelFlutterwave();

  /// The default instance of [FlutterwavePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterwave].
  static FlutterwavePlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterwavePlatform] when
  /// they register themselves.
  static set instance(FlutterwavePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  getFlutterwave({ required String amount}){
    throw UnimplementedError('flutterwave() has not been implemented.');
  }

}
