//
//  UITableViewCell+TS_delaysContentTouches.m
//  tableViewCellDelaysContentTouches
//
//  Created by Nicholas Hodapp on 1/31/14.
//  Copyright (c) 2014 Nicholas Hodapp. All rights reserved.
//

#import "UITableViewCell+CJGDelaysContentTouches.h"

@implementation UITableViewCell (JKDelaysContentTouches)

- (UIScrollView*) cjg_scrollView
{
    id sv = self.contentView.superview;
    while ( ![sv isKindOfClass: [UIScrollView class]] && sv != self )
    {
        sv = [sv superview];
    }
    
    return sv == self ? nil : sv;
}

- (void) setCjg_delaysContentTouches:(BOOL)delaysContentTouches
{
    [self willChangeValueForKey: @"cjg_delaysContentTouches"];
    
    [[self cjg_scrollView] setDelaysContentTouches: delaysContentTouches];
    
    [self didChangeValueForKey: @"cjg_delaysContentTouches"];
}

- (BOOL) cjg_delaysContentTouches
{
    return [[self cjg_scrollView] delaysContentTouches];
}



@end
