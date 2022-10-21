//
//  UIWindow+CJGHierarchy.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/1/16.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (CJGHierarchy)
/*!
 @method topMostController
 
 @return Returns the current Top Most ViewController in hierarchy.
 */
- (UIViewController*)cjg_topMostController;

/*!
 @method currentViewController
 
 @return Returns the topViewController in stack of topMostController.
 */
- (UIViewController*)cjg_currentViewController;
@end
