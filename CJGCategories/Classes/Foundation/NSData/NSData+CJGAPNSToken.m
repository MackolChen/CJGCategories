//
//  NSData+CJGAPNSToken.m
//  CJGCategories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "NSData+CJGAPNSToken.h"

@implementation NSData (CJGAPNSToken)
/**
 *  @brief  将APNS NSData类型token 格式化成字符串
 *
 *  @return 字符串token
 */
- (NSString *)cjg_APNSToken {
    return [[[[self description]
              stringByReplacingOccurrencesOfString: @"<" withString: @""]
             stringByReplacingOccurrencesOfString: @">" withString: @""]
            stringByReplacingOccurrencesOfString: @" " withString: @""];
}

@end
