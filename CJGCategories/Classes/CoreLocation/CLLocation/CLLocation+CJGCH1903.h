//
//  CLLocation+CH1903.h
//  g7
//
//  Created by Jonas Schnelli on 22.04.10.
//  Copyright 2010 include7 AG. All rights reserved.
//
// check: http://github.com/jonasschnelli/CLLocation-CH1903
// 瑞士坐标系转换

//This small extension allows you to easly manage CH1903 (swiss coordinate system) within the CLLocation object.
//All the calculation are based on the official swiss federal informations:
//http://www.swisstopo.admin.ch/internet/swisstopo/de/home/products/software/products/skripts.html

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CLLocation (CJGCH1903)

/*!
 @method     initWithCH1903x
 @abstract   initialize a CLLocation-Instance with CH1903 x/y coorinates
 */
- (id)initWithCH1903x:(double)x y:(double)y;


/*!
 @method     CH1903Y
 @abstract   returns the CH1903 y value of the location
 */
- (double)cjg_CH1903Y;

/*!
 @method     CH1903X
 @abstract   returns the CH1903 x value of the location
 */
- (double)cjg_CH1903X;


#pragma mark -
#pragma mark static methodes

+ (double)cjg_CHtoWGSlatWithX:(double)x y:(double)y;
+ (double)cjg_CHtoWGSlongWithX:(double)x y:(double)y;
+ (double)cjg_WGStoCHyWithLatitude:(double)lat longitude:(double)lng;
+ (double)cjg_WGStoCHxWithLatitude:(double)lat longitude:(double)lng;

+ (double)cjg_decToSex:(double)angle;
+ (double)cjg_degToSec:(double)angle;
+ (double)cjg_sexToDec:(double)angle;


@end
