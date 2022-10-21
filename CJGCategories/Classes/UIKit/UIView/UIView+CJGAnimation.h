//
//  UIView+Animation.h
//  CoolUIViewAnimations
//
//  Created by Peter de Tagyos on 12/10/11.
//  Copyright (c) 2011 PT Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

float cjg_radiansForDegrees(int degrees);

@interface UIView (CJGAnimation)

// Moves
- (void)cjg_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
- (void)cjg_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
- (void)cjg_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)cjg_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

// Transforms
- (void)cjg_rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;
- (void)cjg_scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;
- (void)cjg_spinClockwise:(float)secs;
- (void)cjg_spinCounterClockwise:(float)secs;

// Transitions
- (void)cjg_curlDown:(float)secs;
- (void)cjg_curlUpAndAway:(float)secs;
- (void)cjg_drainAway:(float)secs;

// Effects
- (void)cjg_changeAlpha:(float)newAlpha secs:(float)secs;
- (void)cjg_pulse:(float)secs continuously:(BOOL)continuously;

//add subview
- (void)cjg_addSubviewWithFadeAnimation:(UIView *)subview;

@end
