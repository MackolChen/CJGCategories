//
//  UIBarButtonItem+CJGAction.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

char * const UIBarButtonItemCJGActionBlock = "UIBarButtonItemCJGActionBlock";
#import "UIBarButtonItem+CJGAction.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (CJGAction)

- (void)cjg_performActionBlock {
    
    dispatch_block_t block = self.cjg_actionBlock;
    
    if (block)
        block();
    
}

- (BarButtonCJGActionBlock)cjg_actionBlock {
    return objc_getAssociatedObject(self, UIBarButtonItemCJGActionBlock);
}

- (void)setCjg_actionBlock:(BarButtonCJGActionBlock)actionBlock
 {
    
    if (actionBlock != self.cjg_actionBlock) {
        [self willChangeValueForKey:@"cjg_actionBlock"];
        
        objc_setAssociatedObject(self,
                                 UIBarButtonItemCJGActionBlock,
                                 actionBlock,
                                 OBJC_ASSOCIATION_COPY);
        
        // Sets up the action.
        [self setTarget:self];
        [self setAction:@selector(cjg_performActionBlock)];
        
        [self didChangeValueForKey:@"cjg_actionBlock"];
    }
}
@end
