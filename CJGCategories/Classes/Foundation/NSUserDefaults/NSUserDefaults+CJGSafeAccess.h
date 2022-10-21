//
//  NSUserDefaults+SafeAccess.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (JKSafeAccess)
+ (NSString *)cjg_stringForKey:(NSString *)defaultName;

+ (NSArray *)cjg_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)cjg_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)cjg_dataForKey:(NSString *)defaultName;

+ (NSArray *)cjg_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)cjg_integerForKey:(NSString *)defaultName;

+ (float)cjg_floatForKey:(NSString *)defaultName;

+ (double)cjg_doubleForKey:(NSString *)defaultName;

+ (BOOL)cjg_boolForKey:(NSString *)defaultName;

+ (NSURL *)cjg_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)cjg_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)cjg_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)cjg_setArcObject:(id)value forKey:(NSString *)defaultName;
@end
