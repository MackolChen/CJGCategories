//
//  UINavigationItem+CJGLock.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (CJGLock)
/**
 *  @brief  锁定RightItem
 *
 *  @param lock 是否锁定
 */
- (void)cjg_lockRightItem:(BOOL)lock;
/**
 *  @brief  锁定LeftItem
 *
 *  @param lock 是否锁定
 */
- (void)cjg_lockLeftItem:(BOOL)lock;
@end
