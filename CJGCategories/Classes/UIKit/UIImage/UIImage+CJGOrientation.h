//
//  UIImage+CJGOrientation.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/1/4.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
//CGFloat DegreesToRadiansForOrientation(CGFloat degrees) {return degrees * M_PI / 180;};
//CGFloat RadiansToDegreesForOrientation(CGFloat radians) {return radians * 180/M_PI;};
@interface UIImage (CJGOrientation)
/**
 *  @brief  修正图片的方向
 *
 *  @param srcImg 图片
 *
 *  @return 修正方向后的图片
 */
+ (UIImage *)cjg_fixOrientation:(UIImage *)srcImg;
/**
 *  @brief  旋转图片
 *
 *  @param degrees 角度
 *
 *  @return 旋转后图片
 */
- (UIImage *)cjg_imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  @brief  旋转图片
 *
 *  @param radians 弧度
 *
 *  @return 旋转后图片
 */
- (UIImage *)cjg_imageRotatedByRadians:(CGFloat)radians;

/**
 *  @brief  垂直翻转
 *
 *  @return  翻转后的图片
 */
- (UIImage *)cjg_flipVertical;
/**
 *  @brief  水平翻转
 *
 *  @return 翻转后的图片
 */
- (UIImage *)cjg_flipHorizontal;

/**
 *  @brief  角度转弧度
 *
 *  @param degrees 角度
 *
 *  @return 弧度
 */
+(CGFloat)cjg_degreesToRadians:(CGFloat)degrees;
/**
 *  @brief  弧度转角度
 *
 *  @param radians 弧度
 *
 *  @return 角度
 */
+(CGFloat)cjg_radiansToDegrees:(CGFloat)radians;

@end
