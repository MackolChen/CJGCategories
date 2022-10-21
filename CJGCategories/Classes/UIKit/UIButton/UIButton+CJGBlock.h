//
//  UIButton+Block.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CJGTouchedButtonBlock)(NSInteger tag);

@interface UIButton (CJGBlock)
-(void)cjg_addActionHandler:(CJGTouchedButtonBlock)touchHandler;
@end
