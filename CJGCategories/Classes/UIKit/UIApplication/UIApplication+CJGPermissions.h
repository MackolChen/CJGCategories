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
    CJGPermissionTypeBluetoothLE,
    CJGPermissionTypeCalendar,
    CJGPermissionTypeContacts,
    CJGPermissionTypeLocation,
    CJGPermissionTypeMicrophone,
    CJGPermissionTypeMotion,
    CJGPermissionTypePhotos,
    CJGPermissionTypeReminders,
} CJGPermissionType;

typedef enum {
    CJGPermissionAccessDenied, //User has rejected feature
    CJGPermissionAccessGranted, //User has accepted feature
    CJGPermissionAccessRestricted, //Blocked by parental controls or system settings
    CJGPermissionAccessUnknown, //Cannot be determined
    CJGPermissionAccessUnsupported, //Device doesn't support this - e.g Core Bluetooth
    CJGPermissionAccessMissingFramework, //Developer didn't import the required framework to the project
} CJGPermissionAccess;

@interface UIApplication (CJGPermissions)

//Check permission of service. Cannot check microphone or motion without asking user for permission
-(CJGPermissionAccess)cjg_hasAccessToBluetoothLE;
-(CJGPermissionAccess)cjg_hasAccessToCalendar;
-(CJGPermissionAccess)cjg_hasAccessToContacts;
-(CJGPermissionAccess)cjg_hasAccessToLocation;
-(CJGPermissionAccess)cjg_hasAccessToPhotos;
-(CJGPermissionAccess)cjg_hasAccessToReminders;

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
