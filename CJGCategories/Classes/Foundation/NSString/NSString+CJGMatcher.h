//
//  NSString+CJGMatcher.h
//  Whyd
//
//  Created by Damien Romito on 29/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//
//https://github.com/damienromito/NSString-Matcher
#import <Foundation/Foundation.h>
@interface NSString(CJGMatcher)
- (NSArray *)cjg_matchWithRegex:(NSString *)regex;
- (NSString *)cjg_matchWithRegex:(NSString *)regex atIndex:(NSUInteger)index;
- (NSString *)cjg_firstMatchedGroupWithRegex:(NSString *)regex;
- (NSTextCheckingResult *)cjg_firstMatchedResultWithRegex:(NSString *)regex;
@end
