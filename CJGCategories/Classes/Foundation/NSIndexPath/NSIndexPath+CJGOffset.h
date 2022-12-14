//
//  NSIndexPath+Offset.h
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface NSIndexPath (CJGOffset)
/**
 *  @author CJGCategories
 *
 *  Compute previous row indexpath
 *
 */
- (NSIndexPath *)cjg_previousRow;
/**
 *  @author CJGCategories
 *
 *  Compute next row indexpath
 *
 */
- (NSIndexPath *)cjg_nextRow;
/**
 *  @author CJGCategories
 *
 *  Compute previous item indexpath
 *
 */
- (NSIndexPath *)cjg_previousItem;
/**
 *  @author CJGCategories
 *
 *  Compute next item indexpath
 *
 */
- (NSIndexPath *)cjg_nextItem;
/**
 *  @author CJGCategories
 *
 *  Compute next section indexpath
 *
 */
- (NSIndexPath *)cjg_nextSection;
/**
 *  @author CJGCategories
 *
 *  Compute previous section indexpath
 *
 */
- (NSIndexPath *)cjg_previousSection;

@end
