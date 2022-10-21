//
//  UIButton+Block.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIButton+CJGBlock.h"
#import <objc/runtime.h>
static const void *cjg_UIButtonBlockKey = &cjg_UIButtonBlockKey;

@implementation UIButton (cjg_Block)
-(void)cjg_addActionHandler:(JKTouchedButtonBlock)touchHandler{
    objc_setAssociatedObject(self, cjg_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(cjg_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)cjg_blockActionTouched:(UIButton *)btn{
    JKTouchedButtonBlock block = objc_getAssociatedObject(self, cjg_UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}
@end

