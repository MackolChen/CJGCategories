//
//  UIApplication+CJGKeyboardFrame.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIApplication+CJGKeyboardFrame.h"

@implementation UIApplication (KeyboardFrame)
static CGRect _cjg_keyboardFrame = (CGRect){ (CGPoint){ 0.0f, 0.0f }, (CGSize){ 0.0f, 0.0f } };

- (CGRect)cjg_keyboardFrame {
    return _cjg_keyboardFrame;
}

+ (void)load
{
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidShowNotification object:nil queue:nil usingBlock:^(NSNotification *note)
     {
         _cjg_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidChangeFrameNotification object:nil queue:nil usingBlock:^(NSNotification *note)
     {
         _cjg_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidHideNotification object:nil queue:nil usingBlock:^(NSNotification *note)
     {
         _cjg_keyboardFrame = CGRectZero;
     }];
}
@end
