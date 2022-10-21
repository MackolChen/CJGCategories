//
//  GON_NSIndexPath+Offset.m
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//

#import "NSIndexPath+CJGOffset.h"

@interface NSIndexPath ()
@end

@implementation NSIndexPath (CJGOffset)
#pragma mark - Offset
- (NSIndexPath *)cjg_previousRow
{
    return [NSIndexPath indexPathForRow:self.row - 1
                              inSection:self.section];
}

- (NSIndexPath *)cjg_nextRow
{
    return [NSIndexPath indexPathForRow:self.row + 1
                              inSection:self.section];
}

- (NSIndexPath *)cjg_previousItem
{
    return [NSIndexPath indexPathForItem:self.item - 1
                               inSection:self.section];
}


- (NSIndexPath *)cjg_nextItem
{
    return [NSIndexPath indexPathForItem:self.item + 1
                               inSection:self.section];
}


- (NSIndexPath *)cjg_nextSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section + 1];
}

- (NSIndexPath *)cjg_previousSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section - 1];
}

@end
