//
//  UIView+CJGConstraints.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+CJGConstraints.h"

@implementation UIView (JKConstraints)
-(NSLayoutConstraint *)cjg_constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];
    
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

- (NSLayoutConstraint *)cjg_leftConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)cjg_rightConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)cjg_topConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)cjg_bottomConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)cjg_leadingConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *)cjg_trailingConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *)cjg_widthConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)cjg_heightConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)cjg_centerXConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)cjg_centerYConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)cjg_baseLineConstraint {
    return [self cjg_constraintForAttribute:NSLayoutAttributeBaseline];
}
@end
