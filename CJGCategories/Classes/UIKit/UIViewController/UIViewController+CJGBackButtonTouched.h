//
//  UIViewController+BackButtonTouched.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef void (^CJGBackButtonHandler)(UIViewController *vc);
@interface UIViewController (CJGBackButtonTouched)
/**
 *  @author CJGCategories
 *
 *  navgation 返回按钮回调
 *
 *  @param backButtonHandler <#backButtonHandler description#>
 */
-(void)cjg_backButtonTouched:(CJGBackButtonHandler)backButtonHandler;
@end
