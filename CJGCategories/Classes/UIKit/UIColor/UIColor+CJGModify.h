//
//  UIColor+Modify.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JKModify)
- (UIColor *)cjg_invertedColor;
- (UIColor *)cjg_colorForTranslucency;
- (UIColor *)cjg_lightenColor:(CGFloat)lighten;
- (UIColor *)cjg_darkenColor:(CGFloat)darken;
@end
