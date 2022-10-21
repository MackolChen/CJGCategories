//
//  UIResponder+CJGChain.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (CJGChain)
/**
 *  @brief  响应者链
 *
 *  @return  响应者链
 */
- (NSString *)cjg_responderChainDescription;
@end
