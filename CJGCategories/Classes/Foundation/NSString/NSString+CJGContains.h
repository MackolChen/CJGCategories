//
//  NSString+Contains.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 http://weibo.com/u/1655766025 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJGContains)
/**
 *  @brief  判断URL中是否包含中文
 *
 *  @return 是否包含中文
 */
- (BOOL)cjg_isContainChinese;
/**
 *  @brief  是否包含空格
 *
 *  @return 是否包含空格
 */
- (BOOL)cjg_isContainBlank;

/**
 *  @brief  Unicode编码的字符串转成NSString
 *
 *  @return Unicode编码的字符串转成NSString
 */
- (NSString *)cjg_makeUnicodeToString;

- (BOOL)cjg_containsCharacterSet:(NSCharacterSet *)set;
/**
 *  @brief 是否包含字符串
 *
 *  @param string 字符串
 *
 *  @return YES, 包含;
 */
- (BOOL)cjg_containsaString:(NSString *)string;
/**
 *  @brief 获取字符数量
 */
- (int)cjg_wordsCount;

@end
