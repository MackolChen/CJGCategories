//
//  UIControl+CJGActionBlocks.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/lavoy/ALActionBlocks

#import <UIKit/UIKit.h>
typedef void (^UIControlCJGActionBlock)(id weakSender);


@interface UIControlCJGActionBlockWrapper : NSObject
@property (nonatomic, copy) UIControlCJGActionBlock cjg_actionBlock;
@property (nonatomic, assign) UIControlEvents cjg_controlEvents;
- (void)cjg_invokeBlock:(id)sender;
@end



@interface UIControl (CJGActionBlocks)
- (void)cjg_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlCJGActionBlock)actionBlock;
- (void)cjg_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;
@end
