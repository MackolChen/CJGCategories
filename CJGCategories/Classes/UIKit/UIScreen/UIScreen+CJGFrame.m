//
//  UIScreen+CJGFrame.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIScreen+CJGFrame.h"

@implementation UIScreen (CJGFrame)
+ (CGSize)cjg_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)cjg_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)cjg_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)cjg_orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? cjg_SizeSWAP([UIScreen cjg_size]) : [UIScreen cjg_size];
}

+ (CGFloat)cjg_orientationWidth
{
    return [UIScreen cjg_orientationSize].width;
}

+ (CGFloat)cjg_orientationHeight
{
    return [UIScreen cjg_orientationSize].height;
}

+ (CGSize)cjg_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize cjg_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}
@end
