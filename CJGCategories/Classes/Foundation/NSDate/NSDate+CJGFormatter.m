//
//  NSDate+Formatter.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDate+CJGFormatter.h"

@implementation NSDate (CJGFormatter)
+(NSDateFormatter *)cjg_formatter {
    
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDoesRelativeDateFormatting:YES];
    });
    
    return formatter;
}

+(NSDateFormatter *)cjg_formatterWithoutTime {
    
    static NSDateFormatter *formatterWithoutTime = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        formatterWithoutTime = [[NSDate cjg_formatter] copy];
        [formatterWithoutTime setTimeStyle:NSDateFormatterNoStyle];
    });
    
    return formatterWithoutTime;
}

+(NSDateFormatter *)cjg_formatterWithoutDate {
    
    static NSDateFormatter *formatterWithoutDate = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        formatterWithoutDate = [[NSDate cjg_formatter] copy];
        [formatterWithoutDate setDateStyle:NSDateFormatterNoStyle];
    });
    
    return formatterWithoutDate;
}

#pragma mark -
#pragma mark Formatter with date & time
-(NSString *)cjg_formatWithUTCTimeZone {
    return [self cjg_formatWithTimeZoneOffset:0];
}

-(NSString *)cjg_formatWithLocalTimeZone {
    return [self cjg_formatWithTimeZone:[NSTimeZone localTimeZone]];
}

-(NSString *)cjg_formatWithTimeZoneOffset:(NSTimeInterval)offset {
    return [self cjg_formatWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)cjg_formatWithTimeZone:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate cjg_formatter];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}

#pragma mark -
#pragma mark Formatter without time
-(NSString *)cjg_formatWithUTCTimeZoneWithoutTime {
    return [self cjg_formatWithTimeZoneOffsetWithoutTime:0];
}

-(NSString *)cjg_formatWithLocalTimeZoneWithoutTime {
    return [self cjg_formatWithTimeZoneWithoutTime:[NSTimeZone localTimeZone]];
}

-(NSString *)cjg_formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset {
    return [self cjg_formatWithTimeZoneWithoutTime:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)cjg_formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate cjg_formatterWithoutTime];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}

#pragma mark -
#pragma mark Formatter without date
-(NSString *)cjg_formatWithUTCWithoutDate {
    return [self cjg_formatTimeWithTimeZone:0];
}
-(NSString *)cjg_formatWithLocalTimeWithoutDate {
    return [self cjg_formatTimeWithTimeZone:[NSTimeZone localTimeZone]];
}

-(NSString *)cjg_formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset {
    return [self cjg_formatTimeWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)cjg_formatTimeWithTimeZone:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate cjg_formatterWithoutDate];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}
#pragma mark -
#pragma mark Formatter  date
+ (NSString *)cjg_currentDateStringWithFormat:(NSString *)format
{
    NSDate *chosenDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:chosenDate];
    return date;
}
+ (NSDate *)cjg_dateWithSecondsFromNow:(NSInteger)seconds {
    NSDate *date = [NSDate date];
    NSDateComponents *components = [NSDateComponents new];
    [components setSecond:seconds];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *dateSecondsAgo = [calendar dateByAddingComponents:components toDate:date options:0];
    return dateSecondsAgo;
}

+ (NSDate *)cjg_dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}
- (NSString *)cjg_dateWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:self];
    return date;
}
@end
