//
//  NSObject+CJGBlocks.h
//  PSFoundation
//
//  Created by Peter Steinberger on 24.10.10.
//  Copyright 2010 Peter Steinberger. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSObject (CJGBlocks)
+ (id)cjg_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
+ (id)cjg_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
- (id)cjg_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (id)cjg_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
+ (void)cjg_cancelBlock:(id)block;
+ (void)cjg_cancelPreviousPerformBlock:(id)aWrappingBlockHandle __attribute__ ((deprecated));

@end
