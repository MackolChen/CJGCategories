//
//  NSDecimalNumber+Extensions.m
//  CocoaExtensions
//
//  Created by Lars Kuhnt on 11.03.14.
//  Copyright (c) 2014 Promptus. All rights reserved.
//

#import "NSDecimalNumber+CJGExtensions.h"

@implementation NSDecimalNumber (CJGExtensions)
/**
 *  @brief  四舍五入 NSRoundPlain
 *
 *  @param scale 限制位数
 *
 *  @return 返回结果
 */
- (NSDecimalNumber *)cjg_roundToScale:(NSUInteger)scale{
    return [self cjg_roundToScale:scale mode:NSRoundPlain];
}
/**
 *  @brief  四舍五入
 *
 *  @param scale        限制位数
 *  @param roundingMode NSRoundingMode
 *
 *  @return 返回结果
 */
- (NSDecimalNumber *)cjg_roundToScale:(NSUInteger)scale mode:(NSRoundingMode)roundingMode{
  NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:roundingMode scale:scale raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
  return [self decimalNumberByRoundingAccordingToBehavior:handler];
}

- (NSDecimalNumber*)cjg_decimalNumberWithPercentage:(float)percent {
  NSDecimalNumber * percentage = [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithFloat:percent] decimalValue]];
  return [self decimalNumberByMultiplyingBy:percentage];
}

- (NSDecimalNumber *)cjg_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage {
  NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
  NSDecimalNumber * percent = [self decimalNumberByMultiplyingBy:[discountPercentage decimalNumberByDividingBy:hundred]];
  return [self decimalNumberBySubtracting:percent];
}

- (NSDecimalNumber *)cjg_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage roundToScale:(NSUInteger)scale {
  NSDecimalNumber * value = [self cjg_decimalNumberWithDiscountPercentage:discountPercentage];
  return [value cjg_roundToScale:scale];
}

- (NSDecimalNumber *)cjg_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue {
  NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
  NSDecimalNumber * percentage = [[self decimalNumberByDividingBy:baseValue] decimalNumberByMultiplyingBy:hundred];
  return [hundred decimalNumberBySubtracting:percentage];
}

- (NSDecimalNumber *)cjg_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue roundToScale:(NSUInteger)scale {
  NSDecimalNumber * discount = [self cjg_discountPercentageWithBaseValue:baseValue];
  return [discount cjg_roundToScale:scale];
}

@end
