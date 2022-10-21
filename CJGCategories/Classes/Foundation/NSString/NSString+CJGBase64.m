//
//  NSString+CJGBase64.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSString+CJGBase64.h"
#import "NSData+CJGBase64.h"

@implementation NSString (Base64)
+ (NSString *)cjg_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData cjg_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
- (NSString *)cjg_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data cjg_base64EncodedStringWithWrapWidth:wrapWidth];
}
- (NSString *)cjg_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data cjg_base64EncodedString];
}
- (NSString *)cjg_base64DecodedString
{
    return [NSString cjg_stringWithBase64EncodedString:self];
}
- (NSData *)cjg_base64DecodedData
{
    return [NSData cjg_dataWithBase64EncodedString:self];
}
@end
