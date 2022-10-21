//
//  UIApplication-Permissions.h
//  UIApplication-Permissions Sample
//
//  Created by Jack Rostron on 12/01/2014.
//  Copyright (c) 2014 Rostron. All rights reserved.
//  https://github.com/JackRostron/UIApplication-Permissions
//   Category on UIApplication that adds permission helpers


#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>

typedef enum {
    JKPermissionTypeBluetoothLE,
    JKPermissionTypeCalendar,
    JKPermissionTypeContacts,
    JKPermissionTypeLocation,
    JKPermissionTypeMicrophone,
    JKPermissionTypeMotion,
    JKPermissionTypePhotos,
    JKPermissionTypeReminders,
} JKPermissionType;

typedef enum {
    JKPermissionAccessDenied, //User has rejected feature
    JKPermissionAccessGranted, //User has accepted feature
    JKPermissionAccessRestricted, //Blocked by parental controls or system settings
    JKPermissionAccessUnknown, //Cannot be determined
    JKPermissionAccessUnsupported, //Device doesn't support this - e.g Core Bluetooth
    JKPermissionAccessMissingFramework, //Developer didn't import the required framework to the project
} JKPermissionAccess;

@interface UIApplication (JKPermissions)

//Check permission of service. Cannot check microphone or motion without asking user for permission
-(JKPermissionAccess)cjg_hasAccessToBluetoothLE;
-(JKPermissionAccess)cjg_hasAccessToCalendar;
-(JKPermissionAccess)cjg_hasAccessToContacts;
-(JKPermissionAccess)cjg_hasAccessToLocation;
-(JKPermissionAccess)cjg_hasAccessToPhotos;
-(JKPermissionAccess)cjg_hasAccessToReminders;

//Request permission with callback
-(void)cjg_requestAccessToCalendarWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)cjg_requestAccessToContactsWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)cjg_requestAccessToMicrophoneWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)cjg_requestAccessToPhotosWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)cjg_requestAccessToRemindersWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;

//Instance methods
-(void)cjg_requestAccessToLocationWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;

//No failure callback available
-(void)cjg_requestAccessToMotionWithSuccess:(void(^)(void))accessGranted;

//Needs investigating - unsure whether it can be implemented because of required delegate callbacks
//-(void)requestAccessToBluetoothLEWithSuccess:(void(^)(void))accessGranted;

@end
