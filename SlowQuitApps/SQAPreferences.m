#import "SQAPreferences.h"

@implementation SQAPreferences


+ (NSUserDefaults *)defaults {
    static BOOL defaultsRegistered;
    if (!defaultsRegistered) {
        [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"delay": @1000, @"whitelist": @[], @"disabledByDefault": @NO}];
        defaultsRegistered = YES;
    }
    return [NSUserDefaults standardUserDefaults];
}

+ (NSInteger)delay {
    static NSInteger delay;
    if (delay == 0) {
        delay = [[self defaults] integerForKey:@"delay"];
        if (delay <= 0) {
            delay = 1000;
        }
    }
    return delay;
}

+ (NSArray<NSString *> *)whitelist {
    static NSArray<NSString *> *whitelist;
    if (whitelist == NULL) {
        whitelist = [[self defaults] stringArrayForKey:@"whitelist"];
    }
    return whitelist;
}

+ (BOOL)disabledByDefault {
    static BOOL disabledByDefault;
    if (!disabledByDefault) {
        disabledByDefault = [[self defaults] boolForKey:@"disabledByDefault"];
    }
    return disabledByDefault;
}

@end
