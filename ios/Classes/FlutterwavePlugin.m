#import "FlutterwavePlugin.h"
#if __has_include(<flutterwave/flutterwave-Swift.h>)
#import <flutterwave/flutterwave-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutterwave-Swift.h"
#endif

@implementation FlutterwavePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterwavePlugin registerWithRegistrar:registrar];
}
@end
