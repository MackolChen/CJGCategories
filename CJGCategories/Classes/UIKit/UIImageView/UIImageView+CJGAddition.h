//
//  UIImageView+Addition.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CJGAddition)
/**
 *  @brief  根据bundle中的图片名创建imageview
 *
 *  @param imageName bundle中的图片名
 *
 *  @return imageview
 */
+ (id)cjg_imageViewWithImageNamed:(NSString*)imageName;
/**
 *  @brief  根据frame创建imageview
 *
 *  @param frame imageview frame
 *
 *  @return imageview
 */
+ (id)cjg_imageViewWithFrame:(CGRect)frame;

+ (id)cjg_imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame;
/**
 *  @brief  创建imageview动画
 *
 *  @param imageArray 图片名称数组
 *  @param duration   动画时间
 *
 *  @return imageview
 */
+ (id)cjg_imageViewWithImageArray:(NSArray*)imageArray duration:(NSTimeInterval)duration;
- (void)cjg_setImageWithStretchableImage:(NSString*)imageName;


// 画水印
// 图片水印
- (void)cjg_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
- (void)cjg_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void)cjg_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;
@end
