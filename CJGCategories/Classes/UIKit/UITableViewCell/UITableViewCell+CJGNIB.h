//
//  UITableViewCell+NIB.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/11/19.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (CJGNIB)
/**
 *  @brief  加载同类名的nib
 *
 *  @return nib
 */
+(UINib*)cjg_nib;
@end
