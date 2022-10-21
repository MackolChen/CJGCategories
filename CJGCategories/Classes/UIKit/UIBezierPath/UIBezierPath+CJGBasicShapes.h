//
//  UIBezierPath+CJGBasicShapes.h
//  Example
//
//  Created by Pierre Dulac on 26/02/13.
//  Copyright (c) 2013 Pierre Dulac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (CJGBasicShapes)

+ (UIBezierPath *)cjg_heartShape:(CGRect)originalFrame;
+ (UIBezierPath *)cjg_userShape:(CGRect)originalFrame;
+ (UIBezierPath *)cjg_martiniShape:(CGRect)originalFrame;
+ (UIBezierPath *)cjg_beakerShape:(CGRect)originalFrame;
+ (UIBezierPath *)cjg_starShape:(CGRect)originalFrame;
+ (UIBezierPath *)cjg_stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

@end
