//
// NSDate+Reporting.h
//
// Created by Mel Sampat on 5/11/12.
// Copyright (c) 2012 Mel Sampat.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSDate (CJGReporting)

// Return a date with a specified year, month and day.
+ (NSDate *)cjg_dateWithYear:(int)year month:(int)month day:(int)day;

// Return midnight on the specified date.
+ (NSDate *)cjg_midnightOfDate:(NSDate *)date;

// Return midnight today.
+ (NSDate *)cjg_midnightToday;

// Return midnight tomorrow.
+ (NSDate *)cjg_midnightTomorrow;

// Returns a date that is exactly 1 day after the specified date. Does *not*
// zero out the time components. For example, if the specified date is
// April 15 2012 10:00 AM, the return value will be April 16 2012 10:00 AM.
+ (NSDate *)cjg_oneDayAfter:(NSDate *)date;

// Returns midnight of the first day of the current, previous or next Month.
// Note: firstDayOfNextMonth returns midnight of the first day of next month,
// which is effectively the same as the "last moment" of the current month.
+ (NSDate *)cjg_firstDayOfCurrentMonth;
+ (NSDate *)cjg_firstDayOfPreviousMonth;
+ (NSDate *)cjg_firstDayOfNextMonth;

// Returns midnight of the first day of the current, previous or next Quarter.
// Note: firstDayOfNextQuarter returns midnight of the first day of next quarter,
// which is effectively the same as the "last moment" of the current quarter.
+ (NSDate *)cjg_firstDayOfCurrentQuarter;
+ (NSDate *)cjg_firstDayOfPreviousQuarter;
+ (NSDate *)cjg_firstDayOfNextQuarter;

// Returns midnight of the first day of the current, previous or next Year.
// Note: firstDayOfNextYear returns midnight of the first day of next year,
// which is effectively the same as the "last moment" of the current year.
+ (NSDate *)cjg_firstDayOfCurrentYear;
+ (NSDate *)cjg_firstDayOfPreviousYear;
+ (NSDate *)cjg_firstDayOfNextYear;


- (NSDate*)cjg_dateFloor;
- (NSDate*)cjg_dateCeil;

- (NSDate*)cjg_startOfWeek;
- (NSDate*)cjg_endOfWeek;

- (NSDate*) cjg_startOfMonth;
- (NSDate*) cjg_endOfMonth;

- (NSDate*) cjg_startOfYear;
- (NSDate*) cjg_endOfYear;

- (NSDate*) cjg_previousDay;
- (NSDate*) cjg_nextDay;

- (NSDate*) cjg_previousWeek;
- (NSDate*) cjg_nextWeek;

- (NSDate*) cjg_previousMonth;
- (NSDate*) cjg_previousMonth:(NSUInteger) monthsToMove;
- (NSDate*) cjg_nextMonth;
- (NSDate*) cjg_nextMonth:(NSUInteger) monthsToMove;

#ifdef DEBUG
// For testing only. A helper function to format and display a date
// with an optional comment. For example:
//     NSDate *test = [NSDate firstDayOfCurrentMonth];
//     [test logWithComment:@"First day of current month: "];
- (void)cjg_logWithComment:(NSString *)comment;
#endif

@end
