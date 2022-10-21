//
//  UIAlertView+Block.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 http://weibo.com/u/1655766025 All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewCJGCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (CJGBlock)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewCJGCallBackBlock cjg_alertViewCallBackBlock;

+ (void)cjg_alertWithCallBackBlock:(UIAlertViewCJGCallBackBlock)alertViewCallBackBlock
                            title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName
                otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
