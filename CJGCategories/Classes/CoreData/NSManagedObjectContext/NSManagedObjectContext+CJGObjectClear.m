//
//  GON_NSManagedObjectContext+ObjectClear.m
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//

#import "NSManagedObjectContext+CJGObjectClear.h"

@implementation NSManagedObjectContext (CJGObjectClear)
#pragma mark - Utils
- (void)cjg_deleteObjects:(id <NSFastEnumeration>)objects
{
    for (id obj in objects)
        [self deleteObject:obj];
}
@end
