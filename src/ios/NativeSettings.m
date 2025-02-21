#import "NativeSettings.h"

@implementation NativeSettings

- (void)do_open:(NSString *)pref completion:(void(^)(BOOL success))completion {
    NSURL *url = [NSURL URLWithString:pref];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url
                                           options:@{}
                                 completionHandler:^(BOOL success) {
            NSLog(@"URL open success: %d", success);
            if (completion) {
                completion(success);
            }
        }];
    } else {
        BOOL result = [[UIApplication sharedApplication] openURL:url];
        if (completion) {
            completion(result);
        }
    }
}

- (void)open:(CDVInvokedUrlCommand*)command {
    NSString* key = [command.arguments objectAtIndex:0];
    NSString* prefix = @"App-Prefs:";
    if (SYSTEM_VERSION_LESS_THAN(@"11.3")) {
        prefix = @"app-settings:";
    }
    
    NSString *urlString = nil;
    
    if ([key isEqualToString:@"application_details"]) {
        urlString = UIApplicationOpenSettingsURLString;
    }
    else if ([key isEqualToString:@"settings"]) {
        urlString = prefix;
    }
    else if ([key isEqualToString:@"about"]) {
        urlString = [prefix stringByAppendingString:@"General&path=About"];
    }
    else if ([key isEqualToString:@"accessibility"]) {
        urlString = [prefix stringByAppendingString:@"General&path=ACCESSIBILITY"];
    }
    else if ([key isEqualToString:@"account"]) {
        urlString = [prefix stringByAppendingString:@"ACCOUNT_SETTINGS"];
    }
    else if ([key isEqualToString:@"autolock"]) {
        urlString = [prefix stringByAppendingString:@"DISPLAY&path=AUTOLOCK"];
    }
    else if ([key isEqualToString:@"display"]) {
        urlString = [prefix stringByAppendingString:@"Brightness"];
    }
    else if ([key isEqualToString:@"bluetooth"]) {
        urlString = [prefix stringByAppendingString:@"Bluetooth"];
    }
    else if ([key isEqualToString:@"castle"]) {
        urlString = [prefix stringByAppendingString:@"CASTLE"];
    }
    else if ([key isEqualToString:@"cellular_usage"]) {
        urlString = [prefix stringByAppendingString:@"General&path=USAGE/CELLULAR_USAGE"];
    }
    else if ([key isEqualToString:@"configuration_list"]) {
        urlString = [prefix stringByAppendingString:@"General&path=ManagedConfigurationList"];
    }
    else if ([key isEqualToString:@"date"]) {
        urlString = [prefix stringByAppendingString:@"General&path=DATE_AND_TIME"];
    }
    else if ([key isEqualToString:@"facetime"]) {
        urlString = [prefix stringByAppendingString:@"FACETIME"];
    }
    else if ([key isEqualToString:@"tethering"]) {
        urlString = [prefix stringByAppendingString:@"INTERNET_TETHERING"];
    }
    else if ([key isEqualToString:@"music"]) {
        urlString = [prefix stringByAppendingString:@"MUSIC"];
    }
    else if ([key isEqualToString:@"music_equalizer"]) {
        urlString = [prefix stringByAppendingString:@"MUSIC&path=EQ"];
    }
    else if ([key isEqualToString:@"music_volume"]) {
        urlString = [prefix stringByAppendingString:@"MUSIC&path=VolumeLimit"];
    }
    else if ([key isEqualToString:@"keyboard"]) {
        urlString = [prefix stringByAppendingString:@"General&path=Keyboard"];
    }
    else if ([key isEqualToString:@"locale"]) {
        urlString = [prefix stringByAppendingString:@"General&path=INTERNATIONAL"];
    }
    else if ([key isEqualToString:@"location"]) {
        urlString = [prefix stringByAppendingString:@"LOCATION_SERVICES"];
    }
    else if ([key isEqualToString:@"locations"]) {
        urlString = [prefix stringByAppendingString:@"Privacy&path=LOCATION"];
    }
    else if ([key isEqualToString:@"tracking"]) {
        urlString = [prefix stringByAppendingString:@"Privacy&path=USER_TRACKING"];
    }
    else if ([key isEqualToString:@"network"]) {
        urlString = [prefix stringByAppendingString:@"General&path=Network"];
    }
    else if ([key isEqualToString:@"nike_ipod"]) {
        urlString = [prefix stringByAppendingString:@"NIKE_PLUS_IPOD"];
    }
    else if ([key isEqualToString:@"notes"]) {
        urlString = [prefix stringByAppendingString:@"NOTES"];
    }
    else if ([key isEqualToString:@"notification_id"]) {
        urlString = [prefix stringByAppendingString:@"NOTIFICATIONS_ID"];
    }
    else if ([key isEqualToString:@"passbook"]) {
        urlString = [prefix stringByAppendingString:@"PASSBOOK"];
    }
    else if ([key isEqualToString:@"phone"]) {
        urlString = [prefix stringByAppendingString:@"Phone"];
    }
    else if ([key isEqualToString:@"photos"]) {
        urlString = [prefix stringByAppendingString:@"Photos"];
    }
    else if ([key isEqualToString:@"reset"]) {
        urlString = [prefix stringByAppendingString:@"General&path=Reset"];
    }
    else if ([key isEqualToString:@"ringtone"]) {
        urlString = [prefix stringByAppendingString:@"Sounds&path=Ringtone"];
    }
    else if ([key isEqualToString:@"browser"]) {
        urlString = [prefix stringByAppendingString:@"Safari"];
    }
    else if ([key isEqualToString:@"search"]) {
        urlString = [prefix stringByAppendingString:@"SIRI"];
    }
    else if ([key isEqualToString:@"sound"]) {
        urlString = [prefix stringByAppendingString:@"Sounds"];
    }
    else if ([key isEqualToString:@"software_update"]) {
        urlString = [prefix stringByAppendingString:@"General&path=SOFTWARE_UPDATE_LINK"];
    }
    else if ([key isEqualToString:@"storage"]) {
        urlString = [prefix stringByAppendingString:@"CASTLE&path=STORAGE_AND_BACKUP"];
    }
    else if ([key isEqualToString:@"store"]) {
        urlString = [prefix stringByAppendingString:@"STORE"];
    }
    else if ([key isEqualToString:@"usage"]) {
        urlString = [prefix stringByAppendingString:@"General&path=USAGE"];
    }
    else if ([key isEqualToString:@"video"]) {
        urlString = [prefix stringByAppendingString:@"VIDEO"];
    }
    else if ([key isEqualToString:@"vpn"]) {
        urlString = [prefix stringByAppendingString:@"General&path=Network/VPN"];
    }
    else if ([key isEqualToString:@"wallpaper"]) {
        urlString = [prefix stringByAppendingString:@"Wallpaper"];
    }
    else if ([key isEqualToString:@"wifi"]) {
        urlString = [prefix stringByAppendingString:@"WIFI"];
    }
    else if ([key isEqualToString:@"touch"]) {
        urlString = [prefix stringByAppendingString:@"TOUCHID_PASSCODE"];
    }
    else if ([key isEqualToString:@"battery"]) {
        urlString = [prefix stringByAppendingString:@"BATTERY_USAGE"];
    }
    else if ([key isEqualToString:@"privacy"]) {
        urlString = [prefix stringByAppendingString:@"Privacy"];
    }
    else if ([key isEqualToString:@"do_not_disturb"]) {
        urlString = [prefix stringByAppendingString:@"General&path=DO_NOT_DISTURB"];
    }
    else if ([key isEqualToString:@"keyboards"]) {
        urlString = [prefix stringByAppendingString:@"General&path=Keyboard/KEYBOARDS"];
    }
    else if ([key isEqualToString:@"mobile_data"]) {
        urlString = [prefix stringByAppendingString:@"MOBILE_DATA_SETTINGS_ID"];
    }
    
    if (urlString) {
        [self do_open:urlString completion:^(BOOL success) {
            CDVPluginResult* pluginResult = nil;
            if (success) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Opened"];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Cannot open"];
            }
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    } else {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid Action"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

@end
