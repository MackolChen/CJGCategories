//
//  NSFileManager+Paths.m
//  CJGCategories (https://github.com/shaojiankui/CJGCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSFileManager+CJGPaths.h"
#include <sys/xattr.h>

@implementation NSFileManager (CJGPaths)
+ (NSURL *)cjg_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)cjg_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)cjg_documentsURL
{
    return [self cjg_URLForDirectory:NSDocumentDirectory];
}

+ (NSString *)cjg_documentsPath
{
    return [self cjg_pathForDirectory:NSDocumentDirectory];
}

+ (NSURL *)cjg_libraryURL
{
    return [self cjg_URLForDirectory:NSLibraryDirectory];
}

+ (NSString *)cjg_libraryPath
{
    return [self cjg_pathForDirectory:NSLibraryDirectory];
}

+ (NSURL *)cjg_cachesURL
{
    return [self cjg_URLForDirectory:NSCachesDirectory];
}

+ (NSString *)cjg_cachesPath
{
    return [self cjg_pathForDirectory:NSCachesDirectory];
}

+ (BOOL)cjg_addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

+ (double)cjg_availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.cjg_documentsPath error:nil];
    
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}
@end
