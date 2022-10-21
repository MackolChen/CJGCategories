//
//  NSUserDefaults+iCloudSync.h
//
//  Created by Riccardo Paolillo on 09/05/13.
//  Copyright (c) 2013. All rights reserved.
//


#import "NSUserDefaults+CJGiCloudSync.h"


@implementation NSUserDefaults (JKiCloudSync)


-(void)cjg_setValue:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] setValue:value forKey:key];
    
    [self setValue:value forKey:key];
}

-(id)cjg_valueForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
    {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] valueForKey:key];
        
        //Store locally and synchronize
        [self setValue:value forKey:key];
        [self synchronize];
        
        return value;
    }
    
    return [self valueForKey:key];
}

- (void)cjg_removeValueForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    [self cjg_removeObjectForKey:key iCloudSync:sync];
}



-(void)cjg_setObject:(id)value forKey:(NSString *)defaultName iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] setObject:value forKey:defaultName];
    
    [self setObject:value forKey:defaultName];
}

-(id)cjg_objectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
    {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] objectForKey:key];
        
        //Store to NSUserDefault and synchronize
        [self setObject:value forKey:key];
        [self synchronize];
        
        return value;
    }
    
    return [self objectForKey:key];
}

- (void)cjg_removeObjectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:key];
    
    //Remove from NSUserDefault
    return [self removeObjectForKey:key];
}



- (BOOL)cjg_synchronizeAlsoiCloudSync:(BOOL)sync
{
    BOOL res = true;
    
    if (sync)
        res &= [self synchronize];
    
    res &= [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    
    return res;
}

@end
