//
//  NSDate+Utilities.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#define D_MINUTE	60
#define D_HOUR	3600
#define D_DAY	86400
#define D_WEEK	604800
#define D_YEAR	31556926
@interface NSDate (JKUtilities)

+ (NSCalendar *)cjg_currentCalendar; // avoid bottlenecks

// Relative dates from the current date
+ (NSDate *)cjg_dateTomorrow;
+ (NSDate *)cjg_dateYesterday;
+ (NSDate *)cjg_dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *)cjg_dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *)cjg_dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *)cjg_dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *)cjg_dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *)cjg_dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Short string utilities
- (NSString *)cjg_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString *)cjg_stringWithFormat: (NSString *) format;

@property (nonatomic, readonly) NSString *cjg_shortString;
@property (nonatomic, readonly) NSString *cjg_shortDateString;
@property (nonatomic, readonly) NSString *cjg_shortTimeString;
@property (nonatomic, readonly) NSString *cjg_mediumString;
@property (nonatomic, readonly) NSString *cjg_mediumDateString;
@property (nonatomic, readonly) NSString *cjg_mediumTimeString;
@property (nonatomic, readonly) NSString *cjg_longString;
@property (nonatomic, readonly) NSString *cjg_longDateString;
@property (nonatomic, readonly) NSString *cjg_longTimeString;



// Comparing dates
- (BOOL)cjg_isEqualToDateIgnoringTime: (NSDate *) aDate;

- (BOOL)cjg_isToday;
- (BOOL)cjg_isTomorrow;
- (BOOL)cjg_isYesterday;

- (BOOL)cjg_isSameWeekAsDate: (NSDate *) aDate;
- (BOOL)cjg_isThisWeek;
- (BOOL)cjg_isNextWeek;
- (BOOL)cjg_isLastWeek;

- (BOOL)cjg_isSameMonthAsDate: (NSDate *) aDate;
- (BOOL)cjg_isThisMonth;
- (BOOL)cjg_isNextMonth;
- (BOOL)cjg_isLastMonth;

- (BOOL)cjg_isSameYearAsDate: (NSDate *) aDate;
- (BOOL)cjg_isThisYear;
- (BOOL)cjg_isNextYear;
- (BOOL)cjg_isLastYear;

- (BOOL)cjg_isEarlierThanDate: (NSDate *) aDate;
- (BOOL)cjg_isLaterThanDate: (NSDate *) aDate;

- (BOOL)cjg_isInFuture;
- (BOOL)cjg_isInPast;

// Date roles
- (BOOL)cjg_isTypicallyWorkday;
- (BOOL)cjg_isTypicallyWeekend;

// Adjusting dates
- (NSDate *) cjg_dateByAddingYears: (NSInteger) dYears;
- (NSDate *) cjg_dateBySubtractingYears: (NSInteger) dYears;
- (NSDate *) cjg_dateByAddingMonths: (NSInteger) dMonths;
- (NSDate *) cjg_dateBySubtractingMonths: (NSInteger) dMonths;
- (NSDate *) cjg_dateByAddingDays: (NSInteger) dDays;
- (NSDate *) cjg_dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) cjg_dateByAddingHours: (NSInteger) dHours;
- (NSDate *) cjg_dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) cjg_dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) cjg_dateBySubtractingMinutes: (NSInteger) dMinutes;

// Date extremes
- (NSDate *) cjg_dateAtStartOfDay;
- (NSDate *) cjg_dateAtEndOfDay;

// Retrieving intervals
- (NSInteger) cjg_minutesAfterDate: (NSDate *) aDate;
- (NSInteger) cjg_minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) cjg_hoursAfterDate: (NSDate *) aDate;
- (NSInteger) cjg_hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) cjg_daysAfterDate: (NSDate *) aDate;
- (NSInteger) cjg_daysBeforeDate: (NSDate *) aDate;
- (NSInteger) cjg_distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates
@property (readonly) NSInteger cjg_nearestHour;
@property (readonly) NSInteger cjg_hour;
@property (readonly) NSInteger cjg_minute;
@property (readonly) NSInteger cjg_seconds;
@property (readonly) NSInteger cjg_day;
@property (readonly) NSInteger cjg_month;
@property (readonly) NSInteger cjg_week;
@property (readonly) NSInteger cjg_weekday;
@property (readonly) NSInteger cjg_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger cjg_year;
@end
