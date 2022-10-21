//
//  UIView+draggable.m
//  UIView+draggable
//
//  Created by Andrea on 13/03/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "UIView+CJGDraggable.h"
#import <objc/runtime.h>

@implementation UIView (CJGDraggable)

- (void)setCjg_panGesture:(UIPanGestureRecognizer*)panGesture
{
    objc_setAssociatedObject(self, @selector(cjg_panGesture), panGesture, OBJC_ASSOCIATION_RETAIN);
}

- (UIPanGestureRecognizer*)cjg_panGesture
{
    return objc_getAssociatedObject(self, @selector(cjg_panGesture));
}

- (void)setCjg_cagingArea:(CGRect)cagingArea
{
    if (CGRectEqualToRect(cagingArea, CGRectZero) ||
        CGRectContainsRect(cagingArea, self.frame)) {
        NSValue *cagingAreaValue = [NSValue valueWithCGRect:cagingArea];
        objc_setAssociatedObject(self, @selector(cjg_cagingArea), cagingAreaValue, OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGRect)cjg_cagingArea
{
    NSValue *cagingAreaValue = objc_getAssociatedObject(self, @selector(cjg_cagingArea));
    return [cagingAreaValue CGRectValue];
}

- (void)setCjg_handle:(CGRect)handle
{
    CGRect relativeFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if (CGRectContainsRect(relativeFrame, handle)) {
        NSValue *handleValue = [NSValue valueWithCGRect:handle];
        objc_setAssociatedObject(self, @selector(cjg_handle), handleValue, OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGRect)cjg_handle
{
    NSValue *handleValue = objc_getAssociatedObject(self, @selector(cjg_handle));
    return [handleValue CGRectValue];
}

- (void)setCjg_shouldMoveAlongY:(BOOL)newShould
{
    NSNumber *shouldMoveAlongYBool = [NSNumber numberWithBool:newShould];
    objc_setAssociatedObject(self, @selector(cjg_shouldMoveAlongY), shouldMoveAlongYBool, OBJC_ASSOCIATION_RETAIN );
}

- (BOOL)cjg_shouldMoveAlongY
{
    NSNumber *moveAlongY = objc_getAssociatedObject(self, @selector(cjg_shouldMoveAlongY));
    return (moveAlongY) ? [moveAlongY boolValue] : YES;
}

- (void)setCjg_shouldMoveAlongX:(BOOL)newShould
{
    NSNumber *shouldMoveAlongXBool = [NSNumber numberWithBool:newShould];
    objc_setAssociatedObject(self, @selector(cjg_shouldMoveAlongX), shouldMoveAlongXBool, OBJC_ASSOCIATION_RETAIN );
}

- (BOOL)cjg_shouldMoveAlongX
{
    NSNumber *moveAlongX = objc_getAssociatedObject(self, @selector(cjg_shouldMoveAlongX));
    return (moveAlongX) ? [moveAlongX boolValue] : YES;
}

- (void)setCjg_draggingStartedBlock:(void (^)(void))draggingStartedBlock
{
    objc_setAssociatedObject(self, @selector(cjg_draggingStartedBlock), draggingStartedBlock, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)(void))cjg_draggingStartedBlock
{
    return objc_getAssociatedObject(self, @selector(cjg_draggingStartedBlock));
}

- (void)setCjg_draggingEndedBlock:(void (^)(void))draggingEndedBlock
{
    objc_setAssociatedObject(self, @selector(cjg_draggingEndedBlock), draggingEndedBlock, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)(void))cjg_draggingEndedBlock
{
    return objc_getAssociatedObject(self, @selector(cjg_draggingEndedBlock));
}

- (void)cjg_handlePan:(UIPanGestureRecognizer*)sender
{
    // Check to make you drag from dragging area
    CGPoint locationInView = [sender locationInView:self];
    if (!CGRectContainsPoint(self.cjg_handle, locationInView)) {
        return;
    }
    
    [self cjg_adjustAnchorPointForGestureRecognizer:sender];
    
    if (sender.state == UIGestureRecognizerStateBegan && self.cjg_draggingStartedBlock) {
        self.cjg_draggingStartedBlock();
    }
    
    if (sender.state == UIGestureRecognizerStateEnded && self.cjg_draggingEndedBlock) {
        self.cjg_draggingEndedBlock();
    }
    
    CGPoint translation = [sender translationInView:[self superview]];
    
    CGFloat newXOrigin = CGRectGetMinX(self.frame) + (([self cjg_shouldMoveAlongX]) ? translation.x : 0);
    CGFloat newYOrigin = CGRectGetMinY(self.frame) + (([self cjg_shouldMoveAlongY]) ? translation.y : 0);
    
    CGRect cagingArea = self.cjg_cagingArea;
    
    CGFloat cagingAreaOriginX = CGRectGetMinX(cagingArea);
    CGFloat cagingAreaOriginY = CGRectGetMinY(cagingArea);
    
    CGFloat cagingAreaRightSide = cagingAreaOriginX + CGRectGetWidth(cagingArea);
    CGFloat cagingAreaBottomSide = cagingAreaOriginY + CGRectGetHeight(cagingArea);
    
    if (!CGRectEqualToRect(cagingArea, CGRectZero)) {
        
        // Check to make sure the view is still within the caging area
        if (newXOrigin <= cagingAreaOriginX ||
            newYOrigin <= cagingAreaOriginY ||
            newXOrigin + CGRectGetWidth(self.frame) >= cagingAreaRightSide ||
            newYOrigin + CGRectGetHeight(self.frame) >= cagingAreaBottomSide) {
            
            // Don't move
            newXOrigin = CGRectGetMinX(self.frame);
            newYOrigin = CGRectGetMinY(self.frame);
        }
    }
    
    [self setFrame:CGRectMake(newXOrigin,
                              newYOrigin,
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
    
    [sender setTranslation:(CGPoint){0, 0} inView:[self superview]];
}

- (void)cjg_adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = self;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}

- (void)cjg_setDraggable:(BOOL)draggable
{
    [self.cjg_panGesture setEnabled:draggable];
}

- (void)cjg_enableDragging
{
    self.cjg_panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(cjg_handlePan:)];
    [self.cjg_panGesture setMaximumNumberOfTouches:1];
    [self.cjg_panGesture setMinimumNumberOfTouches:1];
    [self.cjg_panGesture setCancelsTouchesInView:NO];
    [self setCjg_handle:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addGestureRecognizer:self.cjg_panGesture];
}

@end
