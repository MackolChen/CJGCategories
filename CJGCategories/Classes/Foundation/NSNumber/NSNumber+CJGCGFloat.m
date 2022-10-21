//
//  NSNumber+CGFloat.m
//
//  Created by Alexey Aleshkov on 16.02.14.
//  Copyright (c) 2014 Alexey Aleshkov. All rights reserved.
//

#import "NSNumber+CJGCGFloat.h"

@implementation NSNumber (CJGCGFloat)

- (CGFloat)cjg_CGFloatValue
{
#if (CGFLOAT_IS_DOUBLE == 1)
    CGFloat result = [self doubleValue];
#else
    CGFloat result = [self floatValue];
#endif
    return result;
}

- (id)initWithCJGCGFloat:(CGFloat)value
{
#if (CGFLOAT_IS_DOUBLE == 1)
    self = [self initWithDouble:value];
#else
    self = [self initWithFloat:value];
#endif
    return self;
}

+ (NSNumber *)cjg_numberWithCGFloat:(CGFloat)value
{
    NSNumber *result = [[self alloc] initWithCJGCGFloat:value];
    return result;
}

@end
