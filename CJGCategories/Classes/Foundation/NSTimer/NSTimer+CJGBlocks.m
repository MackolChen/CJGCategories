//
//  NSTimer+CJGBlocks.m
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "NSTimer+CJGBlocks.h"

@implementation NSTimer (CJGBlocks)

+(id)cjg_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(cjg_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+(id)cjg_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(cjg_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+(void)cjg_jdExecuteSimpleBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo])
    {
        void (^block)() = (void (^)(void))[inTimer userInfo];
        block();
    }
}

@end
