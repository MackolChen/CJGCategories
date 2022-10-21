//
//  NSDate+Extension.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/632840804/HYBNSDateExtension

#import "NSDate+CJGExtension.h"

@implementation NSDate (CJGExtension)

- (NSUInteger)cjg_day {
    return [NSDate cjg_day:self];
}

- (NSUInteger)cjg_month {
    return [NSDate cjg_month:self];
}

- (NSUInteger)cjg_year {
    return [NSDate cjg_year:self];
}

- (NSUInteger)cjg_hour {
    return [NSDate cjg_hour:self];
}

- (NSUInteger)cjg_minute {
    return [NSDate cjg_minute:self];
}

- (NSUInteger)cjg_second {
    return [NSDate cjg_second:self];
}

+ (NSUInteger)cjg_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
}

+ (NSUInteger)cjg_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)cjg_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)cjg_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)cjg_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)cjg_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents second];
}

- (NSUInteger)cjg_daysInYear {
    return [NSDate cjg_daysInYear:self];
}

+ (NSUInteger)cjg_daysInYear:(NSDate *)date {
    return [self cjg_isLeapYear:date] ? 366 : 365;
}

- (BOOL)cjg_isLeapYear {
    return [NSDate cjg_isLeapYear:self];
}

+ (BOOL)cjg_isLeapYear:(NSDate *)date {
    NSUInteger year = [date cjg_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)cjg_formatYMD {
    return [NSDate cjg_formatYMD:self];
}

+ (NSString *)cjg_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",[date cjg_year],[date cjg_month], [date cjg_day]];
}

- (NSUInteger)cjg_weeksOfMonth {
    return [NSDate cjg_weeksOfMonth:self];
}

+ (NSUInteger)cjg_weeksOfMonth:(NSDate *)date {
    return [[date cjg_lastdayOfMonth] cjg_weekOfYear] - [[date cjg_begindayOfMonth] cjg_weekOfYear] + 1;
}

- (NSUInteger)cjg_weekOfYear {
    return [NSDate cjg_weekOfYear:self];
}

+ (NSUInteger)cjg_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date cjg_year];
    
    NSDate *lastdate = [date cjg_lastdayOfMonth];
    
    for (i = 1;[[lastdate cjg_dateAfterDay:-7 * i] cjg_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)cjg_dateAfterDay:(NSUInteger)day {
    return [NSDate cjg_dateAfterDate:self day:day];
}

+ (NSDate *)cjg_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)cjg_dateAfterMonth:(NSUInteger)month {
    return [NSDate cjg_dateAfterDate:self month:month];
}

+ (NSDate *)cjg_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)cjg_begindayOfMonth {
    return [NSDate cjg_begindayOfMonth:self];
}

+ (NSDate *)cjg_begindayOfMonth:(NSDate *)date {
    return [self cjg_dateAfterDate:date day:-[date cjg_day] + 1];
}

- (NSDate *)cjg_lastdayOfMonth {
    return [NSDate cjg_lastdayOfMonth:self];
}

+ (NSDate *)cjg_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self cjg_begindayOfMonth:date];
    return [[lastDate cjg_dateAfterMonth:1] cjg_dateAfterDay:-1];
}

- (NSUInteger)cjg_daysAgo {
    return [NSDate cjg_daysAgo:self];
}

+ (NSUInteger)cjg_daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];
}

- (NSInteger)cjg_weekday {
    return [NSDate cjg_weekday:self];
}

+ (NSInteger)cjg_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)cjg_dayFromWeekday {
    return [NSDate cjg_dayFromWeekday:self];
}

+ (NSString *)cjg_dayFromWeekday:(NSDate *)date {
    switch([date cjg_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)cjg_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)cjg_isToday {
    return [self cjg_isSameDay:[NSDate date]];
}

- (NSDate *)cjg_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

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
+ (NSString *)cjg_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)cjg_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date cjg_stringWithFormat:format];
}

- (NSString *)cjg_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)cjg_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSUInteger)cjg_daysInMonth:(NSUInteger)month {
    return [NSDate cjg_daysInMonth:self month:month];
}

+ (NSUInteger)cjg_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date cjg_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)cjg_daysInMonth {
    return [NSDate cjg_daysInMonth:self];
}

+ (NSUInteger)cjg_daysInMonth:(NSDate *)date {
    return [self cjg_daysInMonth:date month:[date cjg_month]];
}

- (NSString *)cjg_timeInfo {
    return [NSDate cjg_timeInfoWithDate:self];
}

+ (NSString *)cjg_timeInfoWithDate:(NSDate *)date {
    return [self cjg_timeInfoWithDateString:[self cjg_stringWithDate:date format:[self cjg_ymdHmsFormat]]];
}

+ (NSString *)cjg_timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self cjg_dateWithString:dateString format:[self cjg_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate cjg_month] - [date cjg_month]);
    int year = (int)([curDate cjg_year] - [date cjg_year]);
    int day = (int)([curDate cjg_day] - [date cjg_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate cjg_month] == 1 && [date cjg_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self cjg_daysInMonth:date month:[date cjg_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate cjg_day] + (totalDays - (int)[date cjg_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate cjg_month];
            int preMonth = (int)[date cjg_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)cjg_ymdFormat {
    return [NSDate cjg_ymdFormat];
}

- (NSString *)cjg_hmsFormat {
    return [NSDate cjg_hmsFormat];
}

- (NSString *)cjg_ymdHmsFormat {
    return [NSDate cjg_ymdHmsFormat];
}

+ (NSString *)cjg_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)cjg_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)cjg_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self cjg_ymdFormat], [self cjg_hmsFormat]];
}

- (NSDate *)cjg_offsetYears:(int)numYears {
    return [NSDate cjg_offsetYears:numYears fromDate:self];
}

+ (NSDate *)cjg_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)cjg_offsetMonths:(int)numMonths {
    return [NSDate cjg_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)cjg_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)cjg_offsetDays:(int)numDays {
    return [NSDate cjg_offsetDays:numDays fromDate:self];
}

+ (NSDate *)cjg_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)cjg_offsetHours:(int)hours {
    return [NSDate cjg_offsetHours:hours fromDate:self];
}

+ (NSDate *)cjg_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}
@end
