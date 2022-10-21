//
//  NSArray+CJGSafeAccess.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSArray+CJGSafeAccess.h"

@implementation NSArray (CJGSafeAccess)
-(id)cjg_objectWithIndex:(NSUInteger)index{
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
}

- (NSString*)cjg_stringWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}


- (NSNumber*)cjg_numberWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)cjg_decimalNumberWithIndex:(NSUInteger)index{
    id value = [self cjg_objectWithIndex:index];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray*)cjg_arrayWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}


- (NSDictionary*)cjg_dictionaryWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)cjg_integerWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
- (NSUInteger)cjg_unsignedIntegerWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}
- (BOOL)cjg_boolWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)cjg_int16WithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)cjg_int32WithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)cjg_int64WithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (char)cjg_charWithIndex:(NSUInteger)index{
    
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)cjg_shortWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)cjg_floatWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)cjg_doubleWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (NSDate *)cjg_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self cjg_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

//CG
- (CGFloat)cjg_CGFloatWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    CGFloat f = [value doubleValue];
    
    return f;
}

- (CGPoint)cjg_pointWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];

    CGPoint point = CGPointFromString(value);
    
    return point;
}
- (CGSize)cjg_sizeWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];

    CGSize size = CGSizeFromString(value);
    
    return size;
}
- (CGRect)cjg_rectWithIndex:(NSUInteger)index
{
    id value = [self cjg_objectWithIndex:index];
    
    CGRect rect = CGRectFromString(value);
    
    return rect;
}
@end


#pragma --mark NSMutableArray setter
@implementation NSMutableArray (CJGSafeAccess)
-(void)cjg_addObj:(id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)cjg_addString:(NSString*)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)cjg_addBool:(BOOL)i
{
    [self addObject:@(i)];
}
-(void)cjg_addInt:(int)i
{
    [self addObject:@(i)];
}
-(void)cjg_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}
-(void)cjg_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}
-(void)cjg_addCGFloat:(CGFloat)f
{
   [self addObject:@(f)];
}
-(void)cjg_addChar:(char)c
{
    [self addObject:@(c)];
}
-(void)cjg_addFloat:(float)i
{
    [self addObject:@(i)];
}
-(void)cjg_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}
-(void)cjg_addSize:(CGSize)o
{
   [self addObject:NSStringFromCGSize(o)];
}
-(void)cjg_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}
@end

