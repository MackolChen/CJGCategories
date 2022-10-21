//
//  NSString+CJGPinyin.h
//  Snowball
//
//  Created by croath on 11/11/13.
//  Copyright (c) 2013 Snowball. All rights reserved.
//
// https://github.com/croath/NSString-Pinyin
//  the Chinese Pinyin string of the nsstring

#import <Foundation/Foundation.h>

@interface NSString (CJGPinyin)

- (NSString*)cjg_pinyinWithPhoneticSymbol;
- (NSString*)cjg_pinyin;
- (NSArray*)cjg_pinyinArray;
- (NSString*)cjg_pinyinWithoutBlank;
- (NSArray*)cjg_pinyinInitialsArray;
- (NSString*)cjg_pinyinInitialsString;

@end
