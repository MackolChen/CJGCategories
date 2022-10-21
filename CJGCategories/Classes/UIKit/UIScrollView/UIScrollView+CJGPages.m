//
//  UIScrollView+CJGPages.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIScrollView+CJGPages.h"

@implementation UIScrollView (CJGPages)
- (NSInteger)cjg_pages{
    NSInteger pages = self.contentSize.width/self.frame.size.width;
    return pages;
}
- (NSInteger)cjg_currentPage{
    NSInteger pages = self.contentSize.width/self.frame.size.width;
    CGFloat scrollPercent = [self cjg_scrollPercent];
    NSInteger currentPage = (NSInteger)roundf((pages-1)*scrollPercent);
    return currentPage;
}
- (CGFloat)cjg_scrollPercent{
    CGFloat width = self.contentSize.width-self.frame.size.width;
    CGFloat scrollPercent = self.contentOffset.x/width;
    return scrollPercent;
}

- (CGFloat)cjg_pagesY {
    CGFloat pageHeight = self.frame.size.height;
    CGFloat contentHeight = self.contentSize.height;
    return contentHeight/pageHeight;
}
- (CGFloat)cjg_pagesX{
    CGFloat pageWidth = self.frame.size.width;
    CGFloat contentWidth = self.contentSize.width;
    return contentWidth/pageWidth;
}
- (CGFloat)cjg_currentPageY{
    CGFloat pageHeight = self.frame.size.height;
    CGFloat offsetY = self.contentOffset.y;
    return offsetY / pageHeight;
}
- (CGFloat)cjg_currentPageX{
    CGFloat pageWidth = self.frame.size.width;
    CGFloat offsetX = self.contentOffset.x;
    return offsetX / pageWidth;
}
- (void)cjg_setPageY:(CGFloat)page{
    [self cjg_setPageY:page animated:NO];
}
- (void) cjg_setPageX:(CGFloat)page{
    [self cjg_setPageX:page animated:NO];
}
- (void)cjg_setPageY:(CGFloat)page animated:(BOOL)animated {
    CGFloat pageHeight = self.frame.size.height;
    CGFloat offsetY = page * pageHeight;
    CGFloat offsetX = self.contentOffset.x;
    CGPoint offset = CGPointMake(offsetX,offsetY);
    [self setContentOffset:offset];
}
- (void)cjg_setPageX:(CGFloat)page animated:(BOOL)animated{
    CGFloat pageWidth = self.frame.size.width;
    CGFloat offsetY = self.contentOffset.y;
    CGFloat offsetX = page * pageWidth;
    CGPoint offset = CGPointMake(offsetX,offsetY);
    [self setContentOffset:offset animated:animated];
}

@end
