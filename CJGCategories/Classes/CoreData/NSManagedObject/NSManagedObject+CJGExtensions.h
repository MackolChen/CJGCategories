//
//  NSManagedObject+Extensions.h
//  kemmler
//
//  Created by Lars Kuhnt on 28.10.13.
//  Copyright (c) 2013 Coeus Solutions GmbH. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "NSManagedObjectContext+CJGExtensions.h"

@interface NSManagedObject (JKExtensions)

+ (id)cjg_create:(NSManagedObjectContext*)context;
+ (id)cjg_create:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context;
+ (id)cjg_find:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (id)cjg_find:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors inContext:(NSManagedObjectContext *)context;
+ (NSArray*)cjg_all:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray*)cjg_all:(NSPredicate *)predicate sortDescriptors:(NSArray*)sortDescriptors inContext:(NSManagedObjectContext *)context;
+ (NSUInteger)cjg_count:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)contex;
+ (NSString *)cjg_entityName;
+ (NSError*)cjg_deleteAll:(NSManagedObjectContext*)context;

@end
