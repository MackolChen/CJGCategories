//
//  NSData+SDDataCache.m
//  SDCycleScrollView
//
//  Created by aier on 15-3-30.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "NSData+CJGDataCache.h"
#import <CommonCrypto/CommonDigest.h>

#define kSDMaxCacheFileAmount 100

@implementation NSData (CJGDataCache)

+ (NSString *)cjg_cachePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"Caches"];
    path = [path stringByAppendingPathComponent:@"CJGDataCache"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}

+ (NSString *)cjg_creatMD5StringWithString:(NSString *)string
{
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    [hash lowercaseString];
    return hash;
}

+ (NSString *)cjg_creatDataPathWithString:(NSString *)string
{
    NSString *path = [NSData cjg_cachePath];
    path = [path stringByAppendingPathComponent:[self cjg_creatMD5StringWithString:string]];
    return path;
}

- (void)cjg_saveDataCacheWithIdentifier:(NSString *)identifier
{
    NSString *path = [NSData cjg_creatDataPathWithString:identifier];
    [self writeToFile:path atomically:YES];
}

+ (NSData *)cjg_getDataCacheWithIdentifier:(NSString *)identifier
{
    static BOOL isCheckedCacheDisk = NO;
    if (!isCheckedCacheDisk) {
        NSFileManager *manager = [NSFileManager defaultManager];
        NSArray *contents = [manager contentsOfDirectoryAtPath:[self cjg_cachePath] error:nil];
        if (contents.count >= kSDMaxCacheFileAmount) {
            [manager removeItemAtPath:[self cjg_cachePath] error:nil];
        }
        isCheckedCacheDisk = YES;
    }
    NSString *path = [self cjg_creatDataPathWithString:identifier];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

@end
