//
//  UIControl+CJGBlock.h
//  FXCategories
//
//  Created by fox softer on 15/2/23.
//  Copyright (c) 2015年 foxsofter. All rights reserved.
//  https://github.com/foxsofter/FXCategories
//  http://stackoverflow.com/questions/2437875/target-action-uicontrolevents
#import <UIKit/UIKit.h>

@interface UIControl (JKBlock)

- (void)cjg_touchDown:(void (^)(void))eventBlock;
- (void)cjg_touchDownRepeat:(void (^)(void))eventBlock;
- (void)cjg_touchDragInside:(void (^)(void))eventBlock;
- (void)cjg_touchDragOutside:(void (^)(void))eventBlock;
- (void)cjg_touchDragEnter:(void (^)(void))eventBlock;
- (void)cjg_touchDragExit:(void (^)(void))eventBlock;
- (void)cjg_touchUpInside:(void (^)(void))eventBlock;
- (void)cjg_touchUpOutside:(void (^)(void))eventBlock;
- (void)cjg_touchCancel:(void (^)(void))eventBlock;
- (void)cjg_valueChanged:(void (^)(void))eventBlock;
- (void)cjg_editingDidBegin:(void (^)(void))eventBlock;
- (void)cjg_editingChanged:(void (^)(void))eventBlock;
- (void)cjg_editingDidEnd:(void (^)(void))eventBlock;
- (void)cjg_editingDidEndOnExit:(void (^)(void))eventBlock;

@end
