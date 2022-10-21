//
//  UITableViewCell+NIB.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/11/19.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import "UITableViewCell+CJGNIB.h"

@implementation UITableViewCell (JKNIB)
/**
 *  @brief  加载同类名的nib
 *
 *  @return nib
 */
+(UINib*)cjg_nib{
   return  [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end