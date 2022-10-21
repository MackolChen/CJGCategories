//
//  UIView+CustomBorder.h
//  Categories
//
//  Created by luomeng on 15/11/3.
//  Copyright © 2015年 luomeng. All rights reserved.
//
/**
 * 视图添加边框
 */

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, JKExcludePoint) {
    JKExcludeStartPoint = 1 << 0,
    JKExcludeEndPoint = 1 << 1,
    JKExcludeAllPoint = ~0UL
};


@interface UIView (JKCustomBorder)

- (void)cjg_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)cjg_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth;
- (void)cjg_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)cjg_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;

- (void)cjg_removeTopBorder;
- (void)cjg_removeLeftBorder;
- (void)cjg_removeBottomBorder;
- (void)cjg_removeRightBorder;


- (void)cjg_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
- (void)cjg_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
- (void)cjg_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
- (void)cjg_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(JKExcludePoint)edge;
@end
