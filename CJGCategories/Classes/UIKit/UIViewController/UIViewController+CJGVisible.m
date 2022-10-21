//
//  UIViewController+CJGVisible.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIViewController+CJGVisible.h"

@implementation UIViewController (JKVisible)
- (BOOL)cjg_isVisible {
    return [self isViewLoaded] && self.view.window;
}
@end
