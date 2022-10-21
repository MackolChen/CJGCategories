//
//  NSArray+CJGSafeAccess.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (JKSafeAccess)
-(id)cjg_objectWithIndex:(NSUInteger)index;

- (NSString*)cjg_stringWithIndex:(NSUInteger)index;

- (NSNumber*)cjg_numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)cjg_decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*)cjg_arrayWithIndex:(NSUInteger)index;

- (NSDictionary*)cjg_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)cjg_integerWithIndex:(NSUInteger)index;

- (NSUInteger)cjg_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)cjg_boolWithIndex:(NSUInteger)index;

- (int16_t)cjg_int16WithIndex:(NSUInteger)index;

- (int32_t)cjg_int32WithIndex:(NSUInteger)index;

- (int64_t)cjg_int64WithIndex:(NSUInteger)index;

- (char)cjg_charWithIndex:(NSUInteger)index;

- (short)cjg_shortWithIndex:(NSUInteger)index;

- (float)cjg_floatWithIndex:(NSUInteger)index;

- (double)cjg_doubleWithIndex:(NSUInteger)index;

- (NSDate *)cjg_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)cjg_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)cjg_pointWithIndex:(NSUInteger)index;

- (CGSize)cjg_sizeWithIndex:(NSUInteger)index;

- (CGRect)cjg_rectWithIndex:(NSUInteger)index;
@end


#pragma --mark NSMutableArray setter

@interface NSMutableArray(JKSafeAccess)

-(void)cjg_addObj:(id)i;

-(void)cjg_addString:(NSString*)i;

-(void)cjg_addBool:(BOOL)i;

-(void)cjg_addInt:(int)i;

-(void)cjg_addInteger:(NSInteger)i;

-(void)cjg_addUnsignedInteger:(NSUInteger)i;

-(void)cjg_addCGFloat:(CGFloat)f;

-(void)cjg_addChar:(char)c;

-(void)cjg_addFloat:(float)i;

-(void)cjg_addPoint:(CGPoint)o;

-(void)cjg_addSize:(CGSize)o;

-(void)cjg_addRect:(CGRect)o;
@end
