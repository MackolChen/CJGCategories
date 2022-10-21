//
//  NSUserDefaults+iCloudSync.h
//
//  Created by Riccardo Paolillo on 09/05/13.
//  Copyright (c) 2013. All rights reserved.
//

//https://github.com/RiccardoPaolillo/NSUserDefault-iCloud
// A very simple iOS Category for synchronize NSUserDefaults with iCloud (NSUbiquitousKeyValueStore)

#import <Foundation/Foundation.h>


@interface NSUserDefaults (CJGiCloudSync)

-(void)cjg_setValue:(id)value  forKey:(NSString *)key iCloudSync:(BOOL)sync;
-(void)cjg_setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

-(id)cjg_valueForKey:(NSString *)key  iCloudSync:(BOOL)sync;
-(id)cjg_objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

-(BOOL)cjg_synchronizeAlsoiCloudSync:(BOOL)sync;

@end
