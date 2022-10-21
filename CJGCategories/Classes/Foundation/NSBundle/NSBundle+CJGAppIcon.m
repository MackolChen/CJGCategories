//
//  NSBundle+CJGAppIcon.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSBundle+CJGAppIcon.h"

@implementation NSBundle (CJGAppIcon)
- (NSString*)cjg_appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage*)cjg_appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self cjg_appIconPath]] ;
    return appIcon;
}
@end
