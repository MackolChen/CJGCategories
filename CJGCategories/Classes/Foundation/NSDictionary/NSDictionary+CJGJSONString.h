//
//  NSDictionary+CJGJSONString.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CJGJSONString)
/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)cjg_JSONString;
@end
