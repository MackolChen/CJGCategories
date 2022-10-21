//
//  NSString+CJGScore.h
//
//  Created by Nicholas Bruning on 5/12/11.
//  Copyright (c) 2011 Involved Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, NSStringCJGScoreOption) {
    NSStringCJGScoreOptionNone = 1 << 0,
    NSStringCJGScoreOptionFavorSmallerWords = 1 << 1,
    NSStringCJGScoreOptionReducedLongStringPenalty = 1 << 2
};

//模糊匹配字符串 查找某两个字符串的相似程度
@interface NSString (CJGScore)

- (CGFloat)cjg_scoreAgainst:(NSString *)otherString;
- (CGFloat)cjg_scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness;
- (CGFloat)cjg_scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness options:(NSStringCJGScoreOption)options;

@end
