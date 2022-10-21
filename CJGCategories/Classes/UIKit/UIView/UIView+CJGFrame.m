//
//  UIView+CJGFrame.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+CJGFrame.h"

@implementation UIView (JKFrame)
#pragma mark - Shortcuts for the coords

- (CGFloat)cjg_top
{
    return self.frame.origin.y;
}

- (void)setCjg_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)cjg_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setCjg_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)cjg_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setCjg_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)cjg_left
{
    return self.frame.origin.x;
}

- (void)setCjg_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)cjg_width
{
    return self.frame.size.width;
}

- (void)setCjg_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)cjg_height
{
    return self.frame.size.height;
}

- (void)setCjg_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)cjg_origin {
    return self.frame.origin;
}

- (void)setCjg_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)cjg_size {
    return self.frame.size;
}

- (void)setCjg_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)cjg_centerX {
    return self.center.x;
}

- (void)setCjg_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)cjg_centerY {
    return self.center.y;
}

- (void)setCjg_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

@end
