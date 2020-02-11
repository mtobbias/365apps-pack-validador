#import "ValidadoresPlugin.h"
#if __has_include(<validadores/validadores-Swift.h>)
#import <validadores/validadores-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "validadores-Swift.h"
#endif

@implementation ValidadoresPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftValidadoresPlugin registerWithRegistrar:registrar];
}
@end
