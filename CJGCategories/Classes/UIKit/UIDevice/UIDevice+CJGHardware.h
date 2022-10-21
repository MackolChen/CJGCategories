//
//  UIDevice+Hardware.h
//  TestTable
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIDevice (JKHardware)
+ (NSString *)cjg_platform;
+ (NSString *)cjg_platformString;


+ (NSString *)cjg_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)cjg_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)cjg_busFrequency;
//current device RAM size
+ (NSUInteger)cjg_ramSize;
//Return the current device CPU number
+ (NSUInteger)cjg_cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)cjg_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)cjg_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)cjg_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)cjg_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)cjg_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)cjg_totalDiskSpaceBytes;
@end
