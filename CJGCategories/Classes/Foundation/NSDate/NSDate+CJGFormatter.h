//
//  NSDate+Formatter.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Copyright (C) 2013 by Christopher Meyer
//  http://schwiiz.org/
//

#import <Foundation/Foundation.h>

@interface NSDate (JKFormatter)

+(NSDateFormatter *)cjg_formatter;
+(NSDateFormatter *)cjg_formatterWithoutTime;
+(NSDateFormatter *)cjg_formatterWithoutDate;

-(NSString *)cjg_formatWithUTCTimeZone;
-(NSString *)cjg_formatWithLocalTimeZone;
-(NSString *)cjg_formatWithTimeZoneOffset:(NSTimeInterval)offset;
-(NSString *)cjg_formatWithTimeZone:(NSTimeZone *)timezone;

-(NSString *)cjg_formatWithUTCTimeZoneWithoutTime;
-(NSString *)cjg_formatWithLocalTimeZoneWithoutTime;
-(NSString *)cjg_formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset;
-(NSString *)cjg_formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone;

-(NSString *)cjg_formatWithUTCWithoutDate;
-(NSString *)cjg_formatWithLocalTimeWithoutDate;
-(NSString *)cjg_formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset;
-(NSString *)cjg_formatTimeWithTimeZone:(NSTimeZone *)timezone;


+ (NSString *)cjg_currentDateStringWithFormat:(NSString *)format;
+ (NSDate *)cjg_dateWithSecondsFromNow:(NSInteger)seconds;
+ (NSDate *)cjg_dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSString *)cjg_dateWithFormat:(NSString *)format;
@end
