//
//  UIControl+CJGActionBlocks.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIControl+CJGActionBlocks.h"
#import <objc/runtime.h>

static const void *UIControlJKActionBlockArray = &UIControlJKActionBlockArray;

@implementation UIControlJKActionBlockWrapper

- (void)cjg_invokeBlock:(id)sender {
    if (self.cjg_actionBlock) {
        self.cjg_actionBlock(sender);
    }
}
@end


@implementation UIControl (JKActionBlocks)
-(void)cjg_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlJKActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self cjg_actionBlocksArray];
    
    UIControlJKActionBlockWrapper *blockActionWrapper = [[UIControlJKActionBlockWrapper alloc] init];
    blockActionWrapper.cjg_actionBlock = actionBlock;
    blockActionWrapper.cjg_controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(cjg_invokeBlock:) forControlEvents:controlEvents];
}


- (void)cjg_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self cjg_actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIControlJKActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.cjg_controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(cjg_invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
}


- (NSMutableArray *)cjg_actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, UIControlJKActionBlockArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, UIControlJKActionBlockArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}
@end
