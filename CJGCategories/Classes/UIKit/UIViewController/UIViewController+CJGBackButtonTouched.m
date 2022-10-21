//
//  UIViewController+BackButtonTouched.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIViewController+CJGBackButtonTouched.h"
#import <objc/runtime.h>
static const void *CJGBackButtonHandlerKey = &CJGBackButtonHandlerKey;

@implementation UIViewController (CJGBackButtonTouched)
-(void)cjg_backButtonTouched:(CJGBackButtonHandler)backButtonHandler{
    objc_setAssociatedObject(self, CJGBackButtonHandlerKey, backButtonHandler, OBJC_ASSOCIATION_COPY);
}
- (CJGBackButtonHandler)cjg_backButtonTouched
{
    return objc_getAssociatedObject(self, CJGBackButtonHandlerKey);
}
@end

@implementation UINavigationController (ShouldPopItem)
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {

	if([self.viewControllers count] < [navigationBar.items count]) {
		return YES;
	}

   	UIViewController* vc = [self topViewController];
    CJGBackButtonHandler handler = [vc cjg_backButtonTouched];
    if (handler) {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906

        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(self);
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }

	return NO;
}
@end
