//
//  UIBarButtonItem+CJGAction.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

char * const UIBarButtonItemJKActionBlock = "UIBarButtonItemJKActionBlock";
#import "UIBarButtonItem+CJGAction.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (JKAction)

- (void)cjg_performActionBlock {
    
    dispatch_block_t block = self.cjg_actionBlock;
    
    if (block)
        block();
    
}

- (BarButtonJKActionBlock)cjg_actionBlock {
    return objc_getAssociatedObject(self, UIBarButtonItemJKActionBlock);
}

- (void)setCjg_actionBlock:(BarButtonJKActionBlock)actionBlock
 {
    
    if (actionBlock != self.cjg_actionBlock) {
        [self willChangeValueForKey:@"cjg_actionBlock"];
        
        objc_setAssociatedObject(self,
                                 UIBarButtonItemJKActionBlock,
                                 actionBlock,
                                 OBJC_ASSOCIATION_COPY);
        
        // Sets up the action.
        [self setTarget:self];
        [self setAction:@selector(cjg_performActionBlock)];
        
        [self didChangeValueForKey:@"cjg_actionBlock"];
    }
}
@end
