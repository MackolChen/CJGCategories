//  NSString+CJGMatcher.m
//  Whyd
//
//  Created by Damien Romito on 29/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//

#import "NSString+CJGMatcher.h"

@implementation NSString(CJGMatcher)


- (NSArray *)cjg_matchWithRegex:(NSString *)regex
{
    NSTextCheckingResult *result = [self cjg_firstMatchedResultWithRegex:regex];
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:[result numberOfRanges]];
    for (int i = 0 ; i < [result numberOfRanges]; i ++ ) {
        [mArray addObject:[self substringWithRange:[result rangeAtIndex:i]]];
    }
    return mArray;
}


- (NSString *)cjg_matchWithRegex:(NSString *)regex atIndex:(NSUInteger)index
{
    NSTextCheckingResult *result = [self cjg_firstMatchedResultWithRegex:regex];
    return [self substringWithRange:[result rangeAtIndex:index]];
}


- (NSString *)cjg_firstMatchedGroupWithRegex:(NSString *)regex
{
    NSTextCheckingResult *result = [self cjg_firstMatchedResultWithRegex:regex];
    return [self substringWithRange:[result rangeAtIndex:1]];
}


- (NSTextCheckingResult *)cjg_firstMatchedResultWithRegex:(NSString *)regex
{
    NSRegularExpression *regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:(NSRegularExpressionOptions)0 error:NULL];
    NSRange range = {0, self.length};
    return [regexExpression firstMatchInString:self options:(NSMatchingOptions)0 range:range];
}

@end
