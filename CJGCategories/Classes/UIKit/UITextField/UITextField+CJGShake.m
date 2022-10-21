//
//  UITextField+Shake.m
//  UITextField+Shake
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "UITextField+CJGShake.h"

@implementation UITextField (CJGShake)

- (void)cjg_shake {
    [self cjg_shake:10 withDelta:5 completion:nil];
}

- (void)cjg_shake:(int)times withDelta:(CGFloat)delta {
    [self cjg_shake:times withDelta:delta completion:nil];
}

- (void)cjg_shake:(int)times withDelta:(CGFloat)delta completion:(void(^)(void))handler {
    [self _cjg_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:CJGShakedDirectionHorizontal completion:handler];
}

- (void)cjg_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self cjg_shake:times withDelta:delta speed:interval completion:nil];
}

- (void)cjg_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void(^)(void))handler {
    [self _cjg_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:CJGShakedDirectionHorizontal completion:handler];
}

- (void)cjg_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CJGShakedDirection)shakeDirection {
    [self cjg_shake:times withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)cjg_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CJGShakedDirection)shakeDirection completion:(void(^)(void))handler {
    [self _cjg_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:handler];
}

- (void)_cjg_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(CJGShakedDirection)shakeDirection completion:(void(^)(void))handler {
    [UIView animateWithDuration:interval animations:^{
        self.transform = (shakeDirection == CJGShakedDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                if (handler) {
                    handler();
                }
            }];
            return;
        }
        [self _cjg_shake:(times - 1)
           direction:direction * -1
        currentTimes:current + 1
           withDelta:delta
               speed:interval
      shakeDirection:shakeDirection
          completion:handler];
    }];
}

@end
