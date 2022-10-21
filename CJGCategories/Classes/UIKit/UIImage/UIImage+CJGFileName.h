//
//  UIImage+FileName.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CJGFileName)
/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)cjg_imageWithFileName:(NSString *)name;
/**
 *  @author CJGCategories
 *
 *  根据指定bundle中的文件名读取图片
 *
 *  @param name   图片名
 *  @param bundle bundle
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)cjg_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;
@end
