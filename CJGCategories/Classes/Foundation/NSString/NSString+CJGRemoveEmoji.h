//
//  NSString+CJGRemoveEmoji.h
//  NSString+RemoveEmoji
//
//  Created by Jakey on 15/5/13.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString (CJGRemoveEmoji)
/**
 *  @brief  是否包含emoji
 *
 *  @return 是否包含emoji
 */
- (BOOL)cjg_isIncludingEmoji;

/**
 *  @brief  删除掉包含的emoji
 *
 *  @return 清除后的string
 */
- (instancetype)cjg_removedEmojiString;

@end
