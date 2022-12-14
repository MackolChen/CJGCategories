//
//  NSData+CJGHash.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/6/1.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (CJGHash)
/**
 *  @brief  md5 NSData
 */
@property (readonly) NSData *cjg_md5Data;
/**
 *  @brief  sha1Data NSData
 */
@property (readonly) NSData *cjg_sha1Data;
/**
 *  @brief  sha256Data NSData
 */
@property (readonly) NSData *cjg_sha256Data;
/**
 *  @brief  sha512Data NSData
 */
@property (readonly) NSData *cjg_sha512Data;

/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)cjg_hmacMD5DataWithKey:(NSData *)key;
/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)cjg_hmacSHA1DataWithKey:(NSData *)key;
/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)cjg_hmacSHA256DataWithKey:(NSData *)key;
/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)cjg_hmacSHA512DataWithKey:(NSData *)key;
@end
