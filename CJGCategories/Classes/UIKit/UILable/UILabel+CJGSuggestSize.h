//
//  UILabel+SuggestSize.h
//  WordPress
//
//  Created by Eric J on 6/18/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JKSuggestSize)

- (CGSize)cjg_suggestedSizeForWidth:(CGFloat)width;
- (CGSize)cjg_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;
- (CGSize)cjg_suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end
