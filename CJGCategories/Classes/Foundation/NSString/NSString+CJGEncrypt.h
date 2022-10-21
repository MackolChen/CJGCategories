//
//  NSString+CJGEncrypt.h
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CJGEncrypt)
- (NSString*)cjg_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)cjg_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSString*)cjg_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)cjg_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

@end
