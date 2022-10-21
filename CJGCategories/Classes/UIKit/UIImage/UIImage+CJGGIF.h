//
//  UIImage+GIF.h
//  LBGIFImage
//
//  Created by Laurin Brandner on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JKGIF)

+ (UIImage *)cjg_animatedGIFNamed:(NSString *)name;

+ (UIImage *)cjg_animatedGIFWithData:(NSData *)data;

- (UIImage *)cjg_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
