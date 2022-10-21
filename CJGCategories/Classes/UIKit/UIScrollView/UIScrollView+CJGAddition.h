//
//  UIScrollView+CJGAddition.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, JKScrollDirection) {
    JKScrollDirectionUp,
    JKScrollDirectionDown,
    JKScrollDirectionLeft,
    JKScrollDirectionRight,
    JKScrollDirectionWTF
};

@interface UIScrollView (JKAddition)
@property(nonatomic) CGFloat cjg_contentWidth;
@property(nonatomic) CGFloat cjg_contentHeight;
@property(nonatomic) CGFloat cjg_contentOffsetX;
@property(nonatomic) CGFloat cjg_contentOffsetY;

- (CGPoint)cjg_topContentOffset;
- (CGPoint)cjg_bottomContentOffset;
- (CGPoint)cjg_leftContentOffset;
- (CGPoint)cjg_rightContentOffset;

- (JKScrollDirection)cjg_ScrollDirection;

- (BOOL)cjg_isScrolledToTop;
- (BOOL)cjg_isScrolledToBottom;
- (BOOL)cjg_isScrolledToLeft;
- (BOOL)cjg_isScrolledToRight;
- (void)cjg_scrollToTopAnimated:(BOOL)animated;
- (void)cjg_scrollToBottomAnimated:(BOOL)animated;
- (void)cjg_scrollToLeftAnimated:(BOOL)animated;
- (void)cjg_scrollToRightAnimated:(BOOL)animated;

- (NSUInteger)cjg_verticalPageIndex;
- (NSUInteger)cjg_horizontalPageIndex;

- (void)cjg_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)cjg_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
@end
