//
//  CALayer+CJGBorderColor.m
//  test
//
//  Created by LiuLogan on 15/6/17.
//  Copyright (c) 2015年 Xidibuy. All rights reserved.
//

#import "CALayer+CJGBorderColor.h"

@implementation CALayer (JKBorderColor)

-(void)setCjg_borderColor:(UIColor *)cjg_borderColor{
    self.borderColor = cjg_borderColor.CGColor;
}

- (UIColor*)cjg_borderColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
