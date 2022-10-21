//
//  UIWindow+CJGHierarchy.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/1/16.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIWindow+CJGHierarchy.h"

@implementation UIWindow (CJGHierarchy)
- (UIViewController*)cjg_topMostController
{
    UIViewController *topController = [self rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)cjg_currentViewController;
{
    UIViewController *currentViewController = [self cjg_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}
@end
