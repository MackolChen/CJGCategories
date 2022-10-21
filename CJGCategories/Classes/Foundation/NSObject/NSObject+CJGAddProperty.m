//
//  NSObject+CJGAddProperty.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+CJGAddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
static const void *JKStringProperty = &JKStringProperty;
static const void *JKIntegerProperty = &JKIntegerProperty;
//static char IntegerProperty;
@implementation NSObject (JKAddProperty)

@dynamic cjg_stringProperty;
@dynamic cjg_integerProperty;

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个字符串属性
 */
-(void)setCjg_stringProperty:(NSString *)cjg_stringProperty{
    //use that a static const as the key
    objc_setAssociatedObject(self, JKStringProperty, cjg_stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //use that property's selector as the key:
    //objc_setAssociatedObject(self, @selector(stringProperty), stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get
-(NSString *)cjg_stringProperty{
    return objc_getAssociatedObject(self, JKStringProperty);
}

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个NSInteger属性
 */
-(void)setCjg_integerProperty:(NSInteger)cjg_integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:cjg_integerProperty];
    objc_setAssociatedObject(self,JKIntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}
//get
-(NSInteger)cjg_integerProperty{
    return [objc_getAssociatedObject(self, JKIntegerProperty) integerValue];
}

@end
