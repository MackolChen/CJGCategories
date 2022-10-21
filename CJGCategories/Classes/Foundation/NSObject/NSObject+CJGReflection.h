//
//  NSObject+CJGReflection.h
//  NSObject-CJGReflection
//
//  Created by Jakey on 15/12/22.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CJGReflection)
//类名
- (NSString *)cjg_className;
+ (NSString *)cjg_className;
//父类名称
- (NSString *)cjg_superClassName;
+ (NSString *)cjg_superClassName;

//实例属性字典
-(NSDictionary *)cjg_propertyDictionary;

//属性名称列表
- (NSArray*)cjg_propertyKeys;
+ (NSArray *)cjg_propertyKeys;

//属性详细信息列表
- (NSArray *)cjg_propertiesInfo;
+ (NSArray *)cjg_propertiesInfo;

//格式化后的属性列表
+ (NSArray *)cjg_propertiesWithCodeFormat;

//方法列表
-(NSArray*)cjg_methodList;
+(NSArray*)cjg_methodList;

-(NSArray*)cjg_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)cjg_registedClassList;
//实例变量
+ (NSArray *)cjg_instanceVariable;

//协议列表
-(NSDictionary *)cjg_protocolList;
+ (NSDictionary *)cjg_protocolList;


- (BOOL)cjg_hasPropertyForKey:(NSString*)key;
- (BOOL)cjg_hasIvarForKey:(NSString*)key;

@end
