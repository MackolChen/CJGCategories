//
//  UIImageView+BetterFace.h
//  bf
//
//  Created by croath on 13-10-22.
//  Copyright (c) 2013年 Croath. All rights reserved.
//
// https://github.com/croath/UIImageView-BetterFace
//  a UIImageView category to let the picture-cutting with faces showing better

#import <UIKit/UIKit.h>

@interface UIImageView (CJGBetterFace)

@property (nonatomic) BOOL cjg_needsBetterFace;
@property (nonatomic) BOOL cjg_fast;

void cjg_hack_uiimageview_bf();
- (void)cjg_setBetterFaceImage:(UIImage *)image;

@end
