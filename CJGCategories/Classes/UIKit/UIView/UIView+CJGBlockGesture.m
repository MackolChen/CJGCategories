//
//  UIView+UIView_BlockGesture.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+CJGBlockGesture.h"
#import <objc/runtime.h>
static char cjg_kActionHandlerTapBlockKey;
static char cjg_kActionHandlerTapGestureKey;
static char cjg_kActionHandlerLongPressBlockKey;
static char cjg_kActionHandlerLongPressGestureKey;

@implementation UIView (CJGBlockGesture)
- (void)cjg_addTapActionWithBlock:(CJGGestureActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &cjg_kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cjg_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &cjg_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &cjg_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)cjg_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        CJGGestureActionBlock block = objc_getAssociatedObject(self, &cjg_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
- (void)cjg_addLongPressActionWithBlock:(CJGGestureActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &cjg_kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cjg_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &cjg_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &cjg_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)cjg_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        CJGGestureActionBlock block = objc_getAssociatedObject(self, &cjg_kActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
@end
