//
//  UIApplication+CJGApplicationSize.m
//  testSize
//
//  Created by Ignazio Calo on 23/01/15.
//  Copyright (c) 2015 IgnazioC. All rights reserved.
//

#import "UIApplication+CJGApplicationSize.h"

@implementation UIApplication (JKApplicationSize)

- (NSString *)cjg_applicationSize {
    unsigned long long docSize   =  [self cjg_sizeOfFolder:[self cjg_documentPath]];
    unsigned long long libSize   =  [self cjg_sizeOfFolder:[self cjg_libraryPath]];
    unsigned long long cacheSize =  [self cjg_sizeOfFolder:[self cjg_cachePath]];
    
    unsigned long long total = docSize + libSize + cacheSize;
    
    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:total countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}


- (NSString *)cjg_documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)cjg_libraryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)cjg_cachePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}



-(unsigned long long)cjg_sizeOfFolder:(NSString *)folderPath
{
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *contentsEnumurator = [contents objectEnumerator];
    
    NSString *file;
    unsigned long long folderSize = 0;
    
    while (file = [contentsEnumurator nextObject]) {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file] error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
    }
    return folderSize;
}
@end
