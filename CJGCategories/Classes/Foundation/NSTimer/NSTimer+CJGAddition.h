//
//  NSTimer+CJGAddition.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (CJGAddition)
/**
 *  @brief  暂停NSTimer
 */
- (void)cjg_pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)cjg_resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)cjg_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
