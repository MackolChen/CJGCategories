//
//  UIApplication-Permissions.m
//  UIApplication-Permissions Sample
//
//  Created by Jack Rostron on 12/01/2014.
//  Copyright (c) 2014 Rostron. All rights reserved.
//

#import "UIApplication+CJGPermissions.h"
#import <objc/runtime.h>

//Import required frameworks
#import <AddressBook/AddressBook.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <EventKit/EventKit.h>

typedef void (^CJGLocationSuccessCallback)(void);
typedef void (^CJGLocationFailureCallback)(void);

static char CJGPermissionsLocationManagerPropertyKey;
static char CJGPermissionsLocationBlockSuccessPropertyKey;
static char CJGPermissionsLocationBlockFailurePropertyKey;

@interface UIApplication () <CLLocationManagerDelegate>
@property (nonatomic, retain) CLLocationManager *cjg_permissionsLocationManager;
@property (nonatomic, copy) CJGLocationSuccessCallback cjg_locationSuccessCallbackProperty;
@property (nonatomic, copy) CJGLocationFailureCallback cjg_locationFailureCallbackProperty;
@end


@implementation UIApplication (Permissions)


#pragma mark - Check permissions
-(CJGPermissionAccess)hasAccessToBluetoothLE {
    switch ([[[CBCentralManager alloc] init] state]) {
        case CBCentralManagerStateUnsupported:
            return CJGPermissionAccessUnsupported;
            break;
            
        case CBCentralManagerStateUnauthorized:
            return CJGPermissionAccessDenied;
            break;
            
        default:
            return CJGPermissionAccessGranted;
            break;
    }
}

-(CJGPermissionAccess)hasAccessToCalendar {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent]) {
        case EKAuthorizationStatusAuthorized:
            return CJGPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return CJGPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return CJGPermissionAccessRestricted;
            break;
            
        default:
            return CJGPermissionAccessUnknown;
            break;
    }
}

-(CJGPermissionAccess)hasAccessToContacts {
    switch (ABAddressBookGetAuthorizationStatus()) {
        case kABAuthorizationStatusAuthorized:
            return CJGPermissionAccessGranted;
            break;
            
        case kABAuthorizationStatusDenied:
            return CJGPermissionAccessDenied;
            break;
            
        case kABAuthorizationStatusRestricted:
            return CJGPermissionAccessRestricted;
            break;
            
        default:
            return CJGPermissionAccessUnknown;
            break;
    }
}

-(CJGPermissionAccess)hasAccessToLocation {
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorized:
            return CJGPermissionAccessGranted;
            break;
            
        case kCLAuthorizationStatusDenied:
            return CJGPermissionAccessDenied;
            break;
            
        case kCLAuthorizationStatusRestricted:
            return CJGPermissionAccessRestricted;
            break;
            
        default:
            return CJGPermissionAccessUnknown;
            break;
    }
    return CJGPermissionAccessUnknown;
}

-(CJGPermissionAccess)hasAccessToPhotos {
    switch ([ALAssetsLibrary authorizationStatus]) {
        case ALAuthorizationStatusAuthorized:
            return CJGPermissionAccessGranted;
            break;
            
        case ALAuthorizationStatusDenied:
            return CJGPermissionAccessDenied;
            break;
            
        case ALAuthorizationStatusRestricted:
            return CJGPermissionAccessRestricted;
            break;
            
        default:
            return CJGPermissionAccessUnknown;
            break;
    }
}

-(CJGPermissionAccess)hasAccessToReminders {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder]) {
        case EKAuthorizationStatusAuthorized:
            return CJGPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return CJGPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return CJGPermissionAccessRestricted;
            break;
            
        default:
            return CJGPermissionAccessUnknown;
            break;
    }
    return CJGPermissionAccessUnknown;
}


#pragma mark - Request permissions
-(void)cjg_requestAccessToCalendarWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)cjg_requestAccessToContactsWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied {
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    if(addressBook) {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    accessGranted();
                } else {
                    accessDenied();
                }
            });
        });
    }
}

-(void)cjg_requestAccessToMicrophoneWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied {
    AVAudioSession *session = [[AVAudioSession alloc] init];
    [session requestRecordPermission:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)cjg_requestAccessToMotionWithSuccess:(void(^)(void))accessGranted {
    CMMotionActivityManager *motionManager = [[CMMotionActivityManager alloc] init];
    NSOperationQueue *motionQueue = [[NSOperationQueue alloc] init];
    [motionManager startActivityUpdatesToQueue:motionQueue withHandler:^(CMMotionActivity *activity) {
        accessGranted();
        [motionManager stopActivityUpdates];
    }];
}

-(void)cjg_requestAccessToPhotosWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied {
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        accessGranted();
    } failureBlock:^(NSError *error) {
        accessDenied();
    }];
}

-(void)cjg_requestAccessToRemindersWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}


#pragma mark - Needs investigating
/*
 -(void)requestAccessToBluetoothLEWithSuccess:(void(^)(void))accessGranted {
 //REQUIRES DELEGATE - NEEDS RETHINKING
 }
 */

-(void)cjg_requestAccessToLocationWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied {
    self.cjg_permissionsLocationManager = [[CLLocationManager alloc] init];
    self.cjg_permissionsLocationManager.delegate = self;
    
    self.cjg_locationSuccessCallbackProperty = accessGranted;
    self.cjg_locationFailureCallbackProperty = accessDenied;
    [self.cjg_permissionsLocationManager startUpdatingLocation];
}


#pragma mark - Location manager injection
-(CLLocationManager *)cjg_permissionsLocationManager {
    return objc_getAssociatedObject(self, &CJGPermissionsLocationManagerPropertyKey);
}

-(void)setCjg_permissionsLocationManager:(CLLocationManager *)manager {
    objc_setAssociatedObject(self, &CJGPermissionsLocationManagerPropertyKey, manager, OBJC_ASSOCIATION_RETAIN);
}

-(CJGLocationSuccessCallback)locationSuccessCallbackProperty {
    return objc_getAssociatedObject(self, &CJGPermissionsLocationBlockSuccessPropertyKey);
}

-(void)setCjg_locationSuccessCallbackProperty:(CJGLocationSuccessCallback)locationCallbackProperty {
    objc_setAssociatedObject(self, &CJGPermissionsLocationBlockSuccessPropertyKey, locationCallbackProperty, OBJC_ASSOCIATION_COPY);
}

-(CJGLocationFailureCallback)locationFailureCallbackProperty {
    return objc_getAssociatedObject(self, &CJGPermissionsLocationBlockFailurePropertyKey);
}

-(void)setCjg_locationFailureCallbackProperty:(CJGLocationFailureCallback)locationFailureCallbackProperty {
    objc_setAssociatedObject(self, &CJGPermissionsLocationBlockFailurePropertyKey, locationFailureCallbackProperty, OBJC_ASSOCIATION_COPY);
}


#pragma mark - Location manager delegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorized) {
        self.locationSuccessCallbackProperty();
    } else if (status != kCLAuthorizationStatusNotDetermined) {
        self.locationFailureCallbackProperty();
    }
}

@end
