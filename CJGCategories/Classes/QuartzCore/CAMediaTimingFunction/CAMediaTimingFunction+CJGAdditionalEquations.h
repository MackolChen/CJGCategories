//
//  CAMediaTimingFunction+AdditionalEquations.h
//
//  Created by Heiko Dreyer on 02.04.12.
//  Copyright (c) 2012 boxedfolder.com. All rights reserved.
//  https://github.com/bfolder/UIView-Visuals

#import <QuartzCore/QuartzCore.h>

@interface CAMediaTimingFunction (CJGAdditionalEquations)


///---------------------------------------------------------------------------------------
/// @name Circ Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInCirc;
+(CAMediaTimingFunction *)cjg_easeOutCirc;
+(CAMediaTimingFunction *)cjg_easeInOutCirc;

///---------------------------------------------------------------------------------------
/// @name Cubic Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInCubic;
+(CAMediaTimingFunction *)cjg_easeOutCubic;
+(CAMediaTimingFunction *)cjg_easeInOutCubic;

///---------------------------------------------------------------------------------------
/// @name Expo Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInExpo;
+(CAMediaTimingFunction *)cjg_easeOutExpo;
+(CAMediaTimingFunction *)cjg_easeInOutExpo;

///---------------------------------------------------------------------------------------
/// @name Quad Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInQuad;
+(CAMediaTimingFunction *)cjg_easeOutQuad;
+(CAMediaTimingFunction *)cjg_easeInOutQuad;

///---------------------------------------------------------------------------------------
/// @name Quart Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInQuart;
+(CAMediaTimingFunction *)cjg_easeOutQuart;
+(CAMediaTimingFunction *)cjg_easeInOutQuart;

///---------------------------------------------------------------------------------------
/// @name Quint Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInQuint;
+(CAMediaTimingFunction *)cjg_easeOutQuint;
+(CAMediaTimingFunction *)cjg_easeInOutQuint;

///---------------------------------------------------------------------------------------
/// @name Sine Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInSine;
+(CAMediaTimingFunction *)cjg_easeOutSine;
+(CAMediaTimingFunction *)cjg_easeInOutSine;

///---------------------------------------------------------------------------------------
/// @name Back Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)cjg_easeInBack;
+(CAMediaTimingFunction *)cjg_easeOutBack;
+(CAMediaTimingFunction *)cjg_easeInOutBack;

@end
