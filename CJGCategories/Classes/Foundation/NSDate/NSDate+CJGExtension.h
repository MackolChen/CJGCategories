//
//  NSDate+Extension.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JKExtension)


/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)cjg_day;
- (NSUInteger)cjg_month;
- (NSUInteger)cjg_year;
- (NSUInteger)cjg_hour;
- (NSUInteger)cjg_minute;
- (NSUInteger)cjg_second;
+ (NSUInteger)cjg_day:(NSDate *)date;
+ (NSUInteger)cjg_month:(NSDate *)date;
+ (NSUInteger)cjg_year:(NSDate *)date;
+ (NSUInteger)cjg_hour:(NSDate *)date;
+ (NSUInteger)cjg_minute:(NSDate *)date;
+ (NSUInteger)cjg_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)cjg_daysInYear;
+ (NSUInteger)cjg_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)cjg_isLeapYear;
+ (BOOL)cjg_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)cjg_weekOfYear;
+ (NSUInteger)cjg_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)cjg_formatYMD;
+ (NSString *)cjg_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)cjg_weeksOfMonth;
+ (NSUInteger)cjg_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)cjg_begindayOfMonth;
+ (NSDate *)cjg_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)cjg_lastdayOfMonth;
+ (NSDate *)cjg_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)cjg_dateAfterDay:(NSUInteger)day;
+ (NSDate *)cjg_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)cjg_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)cjg_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)cjg_offsetYears:(int)numYears;
+ (NSDate *)cjg_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)cjg_offsetMonths:(int)numMonths;
+ (NSDate *)cjg_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)cjg_offsetDays:(int)numDays;
+ (NSDate *)cjg_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)cjg_offsetHours:(int)hours;
+ (NSDate *)cjg_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)cjg_daysAgo;
+ (NSUInteger)cjg_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)cjg_weekday;
+ (NSInteger)cjg_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)cjg_dayFromWeekday;
+ (NSString *)cjg_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)cjg_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)cjg_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)cjg_dateByAddingDays:(NSUInteger)days;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)cjg_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)cjg_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)cjg_stringWithFormat:(NSString *)format;
+ (NSDate *)cjg_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)cjg_daysInMonth:(NSUInteger)month;
+ (NSUInteger)cjg_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)cjg_daysInMonth;
+ (NSUInteger)cjg_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)cjg_timeInfo;
+ (NSString *)cjg_timeInfoWithDate:(NSDate *)date;
+ (NSString *)cjg_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)cjg_ymdFormat;
- (NSString *)cjg_hmsFormat;
- (NSString *)cjg_ymdHmsFormat;
+ (NSString *)cjg_ymdFormat;
+ (NSString *)cjg_hmsFormat;
+ (NSString *)cjg_ymdHmsFormat;

@end
