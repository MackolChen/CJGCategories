//
//  NSNumber+Round.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (CJGRound)
/* 展示 */
- (NSString*)cjg_toDisplayNumberWithDigit:(NSInteger)digit;
- (NSString*)cjg_toDisplayPercentageWithDigit:(NSInteger)digit;

/*　四舍五入 */
/**
 *  @brief  四舍五入
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)cjg_doRoundWithDigit:(NSUInteger)digit;
/**
 *  @brief  取上整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)cjg_doCeilWithDigit:(NSUInteger)digit;
/**
 *  @brief  取下整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)cjg_doFloorWithDigit:(NSUInteger)digit;
@end
