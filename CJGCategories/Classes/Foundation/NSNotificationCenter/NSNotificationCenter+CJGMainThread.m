//
//  NSNotificationCenter+MainThread.m
//  Elly
//
//  Created by Milot Shala on 1/12/15.
//  Copyright (c) 2015 Milot Shala. All rights reserved.
//

#import "NSNotificationCenter+CJGMainThread.h"

@implementation NSNotificationCenter (CJGMainThread)
/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param notification 一条通知
 */
- (void)cjg_postNotificationOnMainThread:(NSNotification *)notification
{
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}
/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param aName    用来生成新通知的通知名称
 *  @param anObject 通知携带的对象
 */
- (void)cjg_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject];
    [self cjg_postNotificationOnMainThread:notification];
}
/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param aName     用来生成新通知的通知名称
 *  @param anObject  通知携带的对象
 *  @param aUserInfo 通知携带的用户信息
 */
- (void)cjg_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self cjg_postNotificationOnMainThread:notification];
}

@end
