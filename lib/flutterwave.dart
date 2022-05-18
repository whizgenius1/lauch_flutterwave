import 'flutterwave_platform_interface.dart';

class Flutterwave {
  Future<String?> getPlatformVersion() {
    return FlutterwavePlatform.instance.getPlatformVersion();
  }

  getFlutterWave({String? amount}) {
    return FlutterwavePlatform.instance
        .getFlutterwave(amount: amount ?? '2000');
  }
}
