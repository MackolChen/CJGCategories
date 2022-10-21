//
//  NSString+CJGDictionary.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14-6-13.
//  Copyright (c) 2014年 jakey. All rights reserved.
//

#import "NSString+CJGDictionaryValue.h"

@implementation NSString (CJGDictionaryValue)
/**
 *  @brief  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)cjg_dictionaryValue{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", self, errorJson);
#endif
    }
    return jsonDict;
}

@end
