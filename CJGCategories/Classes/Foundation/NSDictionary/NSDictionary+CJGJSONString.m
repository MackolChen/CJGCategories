//
//  NSDictionary+CJGJSONString.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionary+CJGJSONString.h"

@implementation NSDictionary (CJGJSONString)
/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)cjg_JSONString{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end
