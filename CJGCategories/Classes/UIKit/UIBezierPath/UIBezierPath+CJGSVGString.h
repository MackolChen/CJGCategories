//
//  UIBezierPath+CJGSVGString.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (CJGSVGString)
/**
 *  @brief  UIBezierPath转成SVG
 *
 *  @return SVG
 */
- (NSString*)cjg_SVGString;
@end
