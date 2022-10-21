//
//  NSString+CJGDictionary.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14-6-13.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJGDictionaryValue)
/**
 *  @brief  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)cjg_dictionaryValue;
@end
