//
//  UIView+Nib.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+CJGNib.h"

@implementation UIView (JKNib)
#pragma mark - Nibs
+ (UINib *)cjg_loadNib
{
    return [self cjg_loadNibNamed:NSStringFromClass([self class])];
}
+ (UINib *)cjg_loadNibNamed:(NSString*)nibName
{
    return [self cjg_loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}
+ (UINib *)cjg_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:nibName bundle:bundle];
}
+ (instancetype)cjg_loadInstanceFromNib
{
    return [self cjg_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}
+ (instancetype)cjg_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self cjg_loadInstanceFromNibWithName:nibName owner:nil];
}
+ (instancetype)cjg_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self cjg_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}
+ (instancetype)cjg_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}

@end
