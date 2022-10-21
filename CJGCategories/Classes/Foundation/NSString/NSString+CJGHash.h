//
//  NSString+CJGHash.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (CJGHash)
@property (readonly) NSString *cjg_md5String;
@property (readonly) NSString *cjg_sha1String;
@property (readonly) NSString *cjg_sha256String;
@property (readonly) NSString *cjg_sha512String;

- (NSString *)cjg_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)cjg_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)cjg_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)cjg_hmacSHA512StringWithKey:(NSString *)key;
@end
