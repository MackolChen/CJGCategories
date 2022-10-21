//
//  UISplitViewController+CJGQuickAccess.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UISplitViewController+CJGQuickAccess.h"

@implementation UISplitViewController (CJGQuickAccess)

- (UIViewController *)cjg_leftController {
    UIViewController * leftVC = [[self viewControllers] objectAtIndex:0];
    
    if ([leftVC isKindOfClass:[UINavigationController class]]) {
        leftVC = [(UINavigationController *)leftVC topViewController];
    }
    return  leftVC;
}

- (UIViewController *)cjg_rightController {
    UIViewController * rightVC = [[self viewControllers] lastObject];
    
    if ([rightVC isKindOfClass:[UINavigationController class]]) {
        rightVC = [(UINavigationController *)rightVC topViewController];
    }
    return rightVC;
}

@end
