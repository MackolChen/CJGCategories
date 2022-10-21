//
//  UIView+CJGFrame.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CJGFrame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint cjg_origin;
@property (nonatomic, assign) CGSize cjg_size;

// shortcuts for positions
@property (nonatomic) CGFloat cjg_centerX;
@property (nonatomic) CGFloat cjg_centerY;


@property (nonatomic) CGFloat cjg_top;
@property (nonatomic) CGFloat cjg_bottom;
@property (nonatomic) CGFloat cjg_right;
@property (nonatomic) CGFloat cjg_left;

@property (nonatomic) CGFloat cjg_width;
@property (nonatomic) CGFloat cjg_height;
@end
