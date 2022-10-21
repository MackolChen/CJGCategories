//
//  UIView+CJGConstraints.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKConstraints)
- (NSLayoutConstraint *)cjg_constraintForAttribute:(NSLayoutAttribute)attribute;

- (NSLayoutConstraint *)cjg_leftConstraint;
- (NSLayoutConstraint *)cjg_rightConstraint;
- (NSLayoutConstraint *)cjg_topConstraint;
- (NSLayoutConstraint *)cjg_bottomConstraint;
- (NSLayoutConstraint *)cjg_leadingConstraint;
- (NSLayoutConstraint *)cjg_trailingConstraint;
- (NSLayoutConstraint *)cjg_widthConstraint;
- (NSLayoutConstraint *)cjg_heightConstraint;
- (NSLayoutConstraint *)cjg_centerXConstraint;
- (NSLayoutConstraint *)cjg_centerYConstraint;
- (NSLayoutConstraint *)cjg_baseLineConstraint;
@end
