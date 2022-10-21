//
//  UIView+Recursion.m
//  CJGCategories
//
//  Created by Jakey on 15/6/23.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+CJGRecursion.h"

@implementation UIView (CJGRecursion)
/**
 *  @brief  寻找子视图
 *
 *  @param recurse 回调
 *
 *  @return  Return YES from the block to recurse into the subview.
 Set stop to YES to return the subview.
 */
- (UIView*)cjg_findViewRecursively:(BOOL(^)(UIView* subview, BOOL* stop))recurse
{
    for( UIView* subview in self.subviews ) {
        BOOL stop = NO;
        if( recurse( subview, &stop ) ) {
            return [subview cjg_findViewRecursively:recurse];
        } else if( stop ) {
            return subview;
        }
    }
    
    return nil;
}


-(void)cjg_runBlockOnAllSubviews:(CJGSubviewBlock)block
{
    block(self);
    for (UIView* view in [self subviews])
    {
        [view cjg_runBlockOnAllSubviews:block];
    }
}

-(void)cjg_runBlockOnAllSuperviews:(CJGSuperviewBlock)block
{
    block(self);
    if (self.superview)
    {
        [self.superview cjg_runBlockOnAllSuperviews:block];
    }
}

-(void)cjg_enableAllControlsInViewHierarchy
{
    [self cjg_runBlockOnAllSubviews:^(UIView *view) {
        
        if ([view isKindOfClass:[UIControl class]])
        {
            [(UIControl *)view setEnabled:YES];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            [(UITextView *)view setEditable:YES];
        }
    }];
}

-(void)cjg_disableAllControlsInViewHierarchy
{
    [self cjg_runBlockOnAllSubviews:^(UIView *view) {
        
        if ([view isKindOfClass:[UIControl class]])
        {
            [(UIControl *)view setEnabled:NO];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            [(UITextView *)view setEditable:NO];
        }
    }];
}
@end
