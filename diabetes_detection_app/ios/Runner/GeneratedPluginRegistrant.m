//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_statusbar_manager/FlutterStatusbarManagerPlugin.h>)
#import <flutter_statusbar_manager/FlutterStatusbarManagerPlugin.h>
#else
@import flutter_statusbar_manager;
#endif

#if __has_include(<flutter_statusbarcolor/FlutterStatusbarcolorPlugin.h>)
#import <flutter_statusbarcolor/FlutterStatusbarcolorPlugin.h>
#else
@import flutter_statusbarcolor;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterStatusbarManagerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterStatusbarManagerPlugin"]];
  [FlutterStatusbarcolorPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterStatusbarcolorPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
