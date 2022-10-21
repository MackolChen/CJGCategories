//
//  NSString+CJGBase64.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJGBase64)
+ (NSString *)cjg_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)cjg_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)cjg_base64EncodedString;
- (NSString *)cjg_base64DecodedString;
- (NSData *)cjg_base64DecodedData;
@end
