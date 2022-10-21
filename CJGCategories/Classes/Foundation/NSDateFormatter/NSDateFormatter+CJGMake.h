//
//  NSDateFormatter+Make.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  mobile.dzone.com/news/ios-threadsafe-date-formatting

#import <Foundation/Foundation.h>

@interface NSDateFormatter (JKMake)
+(NSDateFormatter *)cjg_dateFormatterWithFormat:(NSString *)format;
+(NSDateFormatter *)cjg_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)cjg_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
+(NSDateFormatter *)cjg_dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)cjg_dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)cjg_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)cjg_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
@end
