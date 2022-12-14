//
//  NSObject+CJGAppInfo.m
//  CJGCategories
//
//  Created by nidom on 15/9/29.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "NSObject+CJGAppInfo.h"
#import <sys/utsname.h>
@implementation NSObject (CJGAppInfo)

-(NSString *)cjg_version{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}
-(NSInteger)cjg_build{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [app_build integerValue];
}
-(NSString *)cjg_identifier{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}
-(NSString *)cjg_currentLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages firstObject];
    return [NSString stringWithString:currentLanguage];
}
-(NSString *)cjg_deviceModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return [NSString stringWithString:deviceString];
}


@end
