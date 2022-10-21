//
//  UIScrollView+CJGPages.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (JKPages)
- (NSInteger)cjg_pages;
- (NSInteger)cjg_currentPage;
- (CGFloat)cjg_scrollPercent;

- (CGFloat)cjg_pagesY;
- (CGFloat)cjg_pagesX;
- (CGFloat)cjg_currentPageY;
- (CGFloat)cjg_currentPageX;
- (void)cjg_setPageY:(CGFloat)page;
- (void)cjg_setPageX:(CGFloat)page;
- (void)cjg_setPageY:(CGFloat)page animated:(BOOL)animated;
- (void)cjg_setPageX:(CGFloat)page animated:(BOOL)animated;
@end
