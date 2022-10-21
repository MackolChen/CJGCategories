//
//  NSSet+Block.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (CJGBlock)
- (void)cjg_each:(void (^)(id))block;
- (void)cjg_eachWithIndex:(void (^)(id, int))block;
- (NSArray *)cjg_map:(id (^)(id object))block;
- (NSArray *)cjg_select:(BOOL (^)(id object))block;
- (NSArray *)cjg_reject:(BOOL (^)(id object))block;
- (NSArray *)cjg_sort;
- (id)cjg_reduce:(id(^)(id accumulator, id object))block;
- (id)cjg_reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block;
@end
