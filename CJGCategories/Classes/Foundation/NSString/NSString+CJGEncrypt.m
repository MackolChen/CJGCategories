//
//  NSString+CJGEncrypt.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSString+CJGEncrypt.h"
#import "NSData+CJGEncrypt.h"
#import "NSData+CJGBase64.h"

@implementation NSString (JKEncrypt)
-(NSString*)cjg_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] cjg_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted cjg_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)cjg_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData cjg_dataWithBase64EncodedString:self] cjg_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)cjg_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] cjg_encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted cjg_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)cjg_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData cjg_dataWithBase64EncodedString:self] cjg_decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

@end
