//
//  NSManagedObject+Extensions.m
//  kemmler
//
//  Created by Lars Kuhnt on 28.10.13.
//  Copyright (c) 2013 Coeus Solutions GmbH. All rights reserved.
//

#import "NSManagedObject+CJGExtensions.h"

@implementation NSManagedObject (CJGExtensions)

+ (id)cjg_create:(NSManagedObjectContext*)context {
  return [NSEntityDescription insertNewObjectForEntityForName:[self cjg_entityName] inManagedObjectContext:context];
}

+ (id)cjg_create:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context {
  id instance = [self cjg_create:context];
  [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    [instance setValue:obj forKey:key];
  }];
  return instance;
}

+ (id)cjg_find:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
  return [context cjg_fetchObjectForEntity:[self cjg_entityName] predicate:predicate];
}

+ (id)cjg_find:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors inContext:(NSManagedObjectContext *)context {
  return [context cjg_fetchObjectForEntity:[self cjg_entityName] predicate:predicate sortDescriptors:sortDescriptors];
}

+ (NSArray*)cjg_all:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
  return [context cjg_fetchObjectsForEntity:[self cjg_entityName] predicate:predicate];
}

+ (NSArray *)cjg_all:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors inContext:(NSManagedObjectContext *)context {
  return [context cjg_fetchObjectsForEntity:[self cjg_entityName] predicate:predicate sortDescriptors:sortDescriptors];
}

+ (NSUInteger)cjg_count:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:[self cjg_entityName] inManagedObjectContext:context];
  [request setPredicate:predicate];
  [request setEntity:entity];
  NSError *error = nil;
  return [context countForFetchRequest:request error:&error];
}

+ (NSString *)cjg_entityName {
  return [NSString stringWithCString:object_getClassName(self) encoding:NSASCIIStringEncoding];
}

+ (NSError*)cjg_deleteAll:(NSManagedObjectContext*)context {
  NSFetchRequest * req = [[NSFetchRequest alloc] init];
  [req setEntity:[NSEntityDescription entityForName:[self cjg_entityName] inManagedObjectContext:context]];
  [req setIncludesPropertyValues:NO]; //only fetch the managedObjectID

  NSError * error = nil;
  NSArray * objects = [context executeFetchRequest:req error:&error];
  //error handling goes here
  for (NSManagedObject * obj in objects) {
    [context deleteObject:obj];
  }
  NSError *saveError = nil;
  [context save:&saveError];
  return error;
}

@end
