#import "HashPasswordPlugin.h"
#if __has_include(<hash_password/hash_password-Swift.h>)
#import <hash_password/hash_password-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "hash_password-Swift.h"
#endif

@implementation HashPasswordPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHashPasswordPlugin registerWithRegistrar:registrar];
}
@end
