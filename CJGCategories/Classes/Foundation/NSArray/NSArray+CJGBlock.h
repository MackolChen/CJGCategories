//
//  NSArray+Block.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CJGBlock)
- (void)cjg_each:(void (^)(id object))block;
- (void)cjg_eachWithIndex:(void (^)(id object, NSUInteger index))block;
- (NSArray *)cjg_map:(id (^)(id object))block;
- (NSArray *)cjg_filter:(BOOL (^)(id object))block;
- (NSArray *)cjg_reject:(BOOL (^)(id object))block;
- (id)cjg_detect:(BOOL (^)(id object))block;
- (id)cjg_reduce:(id (^)(id accumulator, id object))block;
- (id)cjg_reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;
@end
