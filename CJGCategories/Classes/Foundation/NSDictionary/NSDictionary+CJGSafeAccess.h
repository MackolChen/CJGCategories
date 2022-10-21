//
//  NSDictionary+CJGSafeAccess.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (JKSafeAccess)
- (BOOL)cjg_hasKey:(NSString *)key;

- (NSString*)cjg_stringForKey:(id)key;

- (NSNumber*)cjg_numberForKey:(id)key;

- (NSDecimalNumber *)cjg_decimalNumberForKey:(id)key;

- (NSArray*)cjg_arrayForKey:(id)key;

- (NSDictionary*)cjg_dictionaryForKey:(id)key;

- (NSInteger)cjg_integerForKey:(id)key;

- (NSUInteger)cjg_unsignedIntegerForKey:(id)key;

- (BOOL)cjg_boolForKey:(id)key;

- (int16_t)cjg_int16ForKey:(id)key;

- (int32_t)cjg_int32ForKey:(id)key;

- (int64_t)cjg_int64ForKey:(id)key;

- (char)cjg_charForKey:(id)key;

- (short)cjg_shortForKey:(id)key;

- (float)cjg_floatForKey:(id)key;

- (double)cjg_doubleForKey:(id)key;

- (long long)cjg_longLongForKey:(id)key;

- (unsigned long long)cjg_unsignedLongLongForKey:(id)key;

- (NSDate *)cjg_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)cjg_CGFloatForKey:(id)key;

- (CGPoint)cjg_pointForKey:(id)key;

- (CGSize)cjg_sizeForKey:(id)key;

- (CGRect)cjg_rectForKey:(id)key;
@end

#pragma --mark NSMutableDictionary setter

@interface NSMutableDictionary(SafeAccess)

-(void)cjg_setObj:(id)i forKey:(NSString*)key;

-(void)cjg_setString:(NSString*)i forKey:(NSString*)key;

-(void)cjg_setBool:(BOOL)i forKey:(NSString*)key;

-(void)cjg_setInt:(int)i forKey:(NSString*)key;

-(void)cjg_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)cjg_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)cjg_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)cjg_setChar:(char)c forKey:(NSString*)key;

-(void)cjg_setFloat:(float)i forKey:(NSString*)key;

-(void)cjg_setDouble:(double)i forKey:(NSString*)key;

-(void)cjg_setLongLong:(long long)i forKey:(NSString*)key;

-(void)cjg_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)cjg_setSize:(CGSize)o forKey:(NSString*)key;

-(void)cjg_setRect:(CGRect)o forKey:(NSString*)key;
@end
