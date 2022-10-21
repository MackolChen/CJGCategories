//
//  UIView+UIView_BlockGesture.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CJGGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (CJGBlockGesture)
/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)cjg_addTapActionWithBlock:(CJGGestureActionBlock)block;
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)cjg_addLongPressActionWithBlock:(CJGGestureActionBlock)block;
@end
