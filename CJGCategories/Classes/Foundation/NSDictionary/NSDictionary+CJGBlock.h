//
//  NSDictionary+CJGBlock.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CJGBlock)

#pragma mark - RX
- (void)cjg_each:(void (^)(id k, id v))block;
- (void)cjg_eachKey:(void (^)(id k))block;
- (void)cjg_eachValue:(void (^)(id v))block;
- (NSArray *)cjg_map:(id (^)(id key, id value))block;
- (NSDictionary *)cjg_pick:(NSArray *)keys;
- (NSDictionary *)cjg_omit:(NSArray *)key;

@end
