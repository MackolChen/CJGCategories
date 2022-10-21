//
//  UIScrollView+CJGAddition.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIScrollView+CJGAddition.h"

@implementation UIScrollView (CJGAddition)
//frame
- (CGFloat)cjg_contentWidth {
    return self.contentSize.width;
}
- (void)setCjg_contentWidth:(CGFloat)width {
    self.contentSize = CGSizeMake(width, self.frame.size.height);
}
- (CGFloat)cjg_contentHeight {
    return self.contentSize.height;
}
- (void)setCjg_contentHeight:(CGFloat)height {
    self.contentSize = CGSizeMake(self.frame.size.width, height);
}
- (CGFloat)cjg_contentOffsetX {
    return self.contentOffset.x;
}
- (void)setCjg_contentOffsetX:(CGFloat)x {
    self.contentOffset = CGPointMake(x, self.contentOffset.y);
}
- (CGFloat)cjg_contentOffsetY {
    return self.contentOffset.y;
}
- (void)setCjg_contentOffsetY:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x, y);
}
//


- (CGPoint)cjg_topContentOffset
{
    return CGPointMake(0.0f, -self.contentInset.top);
}
- (CGPoint)cjg_bottomContentOffset
{
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}
- (CGPoint)cjg_leftContentOffset
{
    return CGPointMake(-self.contentInset.left, 0.0f);
}
- (CGPoint)cjg_rightContentOffset
{
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}
- (CJGScrollDirection)cjg_ScrollDirection
{
    CJGScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f)
    {
        direction = CJGScrollDirectionUp;
    }
    else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f)
    {
        direction = CJGScrollDirectionDown;
    }
    else if ([self.panGestureRecognizer translationInView:self].x < 0.0f)
    {
        direction = CJGScrollDirectionLeft;
    }
    else if ([self.panGestureRecognizer translationInView:self].x > 0.0f)
    {
        direction = CJGScrollDirectionRight;
    }
    else
    {
        direction = CJGScrollDirectionWTF;
    }
    
    return direction;
}
- (BOOL)cjg_isScrolledToTop
{
    return self.contentOffset.y <= [self cjg_topContentOffset].y;
}
- (BOOL)cjg_isScrolledToBottom
{
    return self.contentOffset.y >= [self cjg_bottomContentOffset].y;
}
- (BOOL)cjg_isScrolledToLeft
{
    return self.contentOffset.x <= [self cjg_leftContentOffset].x;
}
- (BOOL)cjg_isScrolledToRight
{
    return self.contentOffset.x >= [self cjg_rightContentOffset].x;
}
- (void)cjg_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:[self cjg_topContentOffset] animated:animated];
}
- (void)cjg_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:[self cjg_bottomContentOffset] animated:animated];
}
- (void)cjg_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:[self cjg_leftContentOffset] animated:animated];
}
- (void)cjg_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:[self cjg_rightContentOffset] animated:animated];
}
- (NSUInteger)cjg_verticalPageIndex
{
    return (self.contentOffset.y + (self.frame.size.height * 0.5f)) / self.frame.size.height;
}
- (NSUInteger)cjg_horizontalPageIndex
{
    return (self.contentOffset.x + (self.frame.size.width * 0.5f)) / self.frame.size.width;
}
- (void)cjg_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * pageIndex) animated:animated];
}
- (void)cjg_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.frame.size.width * pageIndex, 0.0f) animated:animated];
}


@end
