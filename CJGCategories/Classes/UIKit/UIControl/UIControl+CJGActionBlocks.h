//
//  UIControl+CJGActionBlocks.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/lavoy/ALActionBlocks

#import <UIKit/UIKit.h>
typedef void (^UIControlJKActionBlock)(id weakSender);


@interface UIControlJKActionBlockWrapper : NSObject
@property (nonatomic, copy) UIControlJKActionBlock cjg_actionBlock;
@property (nonatomic, assign) UIControlEvents cjg_controlEvents;
- (void)cjg_invokeBlock:(id)sender;
@end



@interface UIControl (JKActionBlocks)
- (void)cjg_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlJKActionBlock)actionBlock;
- (void)cjg_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;
@end
