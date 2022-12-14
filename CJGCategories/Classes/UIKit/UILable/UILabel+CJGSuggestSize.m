//
//  UILabel+SuggestSize.m
//  WordPress
//
//  Created by Eric J on 6/18/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import "UILabel+CJGSuggestSize.h"

@implementation UILabel (CJGSuggestSize)

- (CGSize)cjg_suggestedSizeForWidth:(CGFloat)width {
    if (self.attributedText)
        return [self cjg_suggestSizeForAttributedString:self.attributedText width:width];
    
	return [self cjg_suggestSizeForString:self.text width:width];
}

- (CGSize)cjg_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

- (CGSize)cjg_suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [self cjg_suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: self.font}] width:width];
}

@end
