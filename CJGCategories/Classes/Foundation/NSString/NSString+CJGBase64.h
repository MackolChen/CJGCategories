//
//  NSString+CJGBase64.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JKBase64)
+ (NSString *)cjg_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)cjg_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)cjg_base64EncodedString;
- (NSString *)cjg_base64DecodedString;
- (NSData *)cjg_base64DecodedData;
@end
