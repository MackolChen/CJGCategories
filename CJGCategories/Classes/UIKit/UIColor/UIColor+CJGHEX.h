//
//  UIColor+HEX.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CJGHEX)
+ (UIColor *)cjg_colorWithHex:(UInt32)hex;
+ (UIColor *)cjg_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)cjg_colorWithHexString:(NSString *)hexString;
- (NSString *)cjg_HEXString;

+ (UIColor *)cjg_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

+ (UIColor *)cjg_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;
@end
