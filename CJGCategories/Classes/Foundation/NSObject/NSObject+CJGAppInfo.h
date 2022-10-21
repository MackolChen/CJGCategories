//
//  NSObject+CJGAppInfo.h
//  JKCategories
//
//  Created by nidom on 15/9/29.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JKAppInfo)
-(NSString *)cjg_version;
-(NSInteger)cjg_build;
-(NSString *)cjg_identifier;
-(NSString *)cjg_currentLanguage;
-(NSString *)cjg_deviceModel;
@end
