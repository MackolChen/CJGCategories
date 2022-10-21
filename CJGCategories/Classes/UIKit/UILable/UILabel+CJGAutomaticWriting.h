//
//  UILabel+AutomaticWriting.h
//  UILabel-AutomaticWriting
//
//  Created by alexruperez on 10/3/15.
//  Copyright (c) 2015 alexruperez. All rights reserved.
//  https://github.com/alexruperez/UILabel-AutomaticWriting

#import <UIKit/UIKit.h>

//! Project version number for UILabel-AutomaticWriting.
FOUNDATION_EXPORT double UILabelAutomaticWritingVersionNumber;

//! Project version string for UILabel-AutomaticWriting.
FOUNDATION_EXPORT const unsigned char UILabelAutomaticWritingVersionString[];

extern NSTimeInterval const UILabelAWDefaultDuration;

extern unichar const UILabelAWDefaultCharacter;

typedef NS_ENUM(NSInteger, UILabelCJGlinkingMode)
{
    UILabelCJGlinkingModeNone,
    UILabelCJGlinkingModeUntilFinish,
    UILabelCJGlinkingModeUntilFinishKeeping,
    UILabelCJGlinkingModeWhenFinish,
    UILabelCJGlinkingModeWhenFinishShowing,
    UILabelCJGlinkingModeAlways
};

@interface UILabel (CJGAutomaticWriting)

@property (strong, nonatomic) NSOperationQueue *cjg_automaticWritingOperationQueue;
@property (assign, nonatomic) UIEdgeInsets cjg_edgeInsets;

- (void)cjg_setTextWithAutomaticWritingAnimation:(NSString *)text;

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelCJGlinkingMode)blinkingMode;

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration;

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelCJGlinkingMode)blinkingMode;

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelCJGlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter;

- (void)cjg_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelCJGlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(void (^)(void))completion;

@end
