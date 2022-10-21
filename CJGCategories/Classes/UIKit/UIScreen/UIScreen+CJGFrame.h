//
//  UIScreen+CJGFrame.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (CJGFrame)
+ (CGSize)cjg_size;
+ (CGFloat)cjg_width;
+ (CGFloat)cjg_height;

+ (CGSize)cjg_orientationSize;
+ (CGFloat)cjg_orientationWidth;
+ (CGFloat)cjg_orientationHeight;
+ (CGSize)cjg_DPISize;

@end
