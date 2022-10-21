//
//  UIViewController+CJGVisible.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIViewController+CJGVisible.h"

@implementation UIViewController (CJGVisible)
- (BOOL)cjg_isVisible {
    return [self isViewLoaded] && self.view.window;
}
@end
