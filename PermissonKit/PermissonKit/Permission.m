//
//  Permission.m
//  PermissonKit
//
//  Created by ray on 2017/4/12.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission.h"
#import "PermissionSet.h"
#import "PermissionTypes.h"
#import "PermissionAlert.h"



@implementation Permission
static Permission *_microphone = nil;
static Permission *_locationAlways = nil;
static Permission *_locationWhenInUse = nil;


- (instancetype)initWith:(PermissionType)type {
    if (self = [super init]) {
        _type = type;
        _presentDeniedAlert = true;
        _presentDisabledAlert = true;
    }
    return self;
}


- (void)request:(PermissionCallBack)callback {
    self.callback = callback;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.permissionSets enumerateObjectsUsingBlock:^(PermissionSet * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj willRequestPermission:self];
        }];
    });
    
    PermissionStatus status = self.status;
    switch (status) {
        case PermissionStatusAuthorized:
        {
            [self callBacksWith:status];
        }
            break;
        case PermissionStatusNotDetermined:
        {
//            self.pre
            
            PermissionCallBack callbacks = ^(PermissionStatus status){
                [self callBacksWith:status];
            };
            [self requestAuthorization:callbacks];
        }
            break;
        case PermissionStatusDenied:
        {
            self.presentDeniedAlert ? [self.deniedAlert present] : [self callBacksWith:status];
        }
            break;
        case PermissionStatusDisabled:
        {
            self.presentDisabledAlert ? [self.disabledAlert present] : [self callBacksWith:status];
        }
            break;
        default:
            break;
    }
//    
//    switch status {
//    case .authorized:    callbacks(status)
//    case .notDetermined: presentPrePermissionAlert ? prePermissionAlert.present() : requestAuthorization(callbacks)
//    case .denied:        presentDeniedAlert ? deniedAlert.present() : callbacks(status)
//    case .disabled:      presentDisabledAlert ? disabledAlert.present() : callbacks(status)
//    }
}

- (void)requestAuthorization:(PermissionCallBack)callback {
    
    switch (self.type) {
        case PermissionTypeMicrophone:
        {
            [self requestMicrophone:callback];
        }
            break;
        case PermissionTypeLocationAlways:
        {
            [self requestLocationAlways:callback];
        }
            break;
        case PermissionTypeLocationWhenInUse:
        {
            [self requestLocationWhenInUse:callback];
        }
            break;
        default:
            break;
    }
}

- (void)callBacksWith:(PermissionStatus)status {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.callback) self.callback(self.status);
        [self.permissionSets enumerateObjectsUsingBlock:^(PermissionSet * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj didRequestPermission:self];
        }];
    });
}

- (NSString *)description {
    return [Permission descriptionWithType:self.type];
}

+ (NSString *)descriptionWithType:(PermissionType)type {
    //#if PERMISSION_CONTACTS
    //    if case .contacts = self { return "Contacts" }
    //#endif
    //
    //#if PERMISSION_ADDRESS_BOOK
    //    if case .addressBook = self { return "Address Book" }
    //#endif
    //
    //#if PERMISSION_NOTIFICATIONS
    //    if case .notifications = self { return "Notifications" }
    //#endif
    //#if PERMISSION_CAMERA
    //    if case .camera = self { return "Camera" }
    //#endif
    //
    //#if PERMISSION_PHOTOS
    //    if case .photos = self { return "Photos" }
    //#endif
    //
    //#if PERMISSION_REMINDERS
    //    if case .reminders = self { return "Reminders" }
    //#endif
    //
    //#if PERMISSION_EVENTS
    //    if case .events = self { return "Events" }
    //#endif
    //
    //#if PERMISSION_BLUETOOTH
    //    if case .bluetooth = self { return "Bluetooth" }
    //#endif
    //
    //#if PERMISSION_MOTION
    //    if case .motion = self { return "Motion" }
    //#endif
    //
    //#if PERMISSION_SPEECH_RECOGNIZER
    //    if case .speechRecognizer = self { return "Speech Recognizer" }
    //#endif
    //
    //#if PERMISSION_SIRI
    //    if case .siri = self { return "SiriKit" }
    //#endif
    //
    //#if PERMISSION_MEDIA_LIBRARY
    //    if case .mediaLibrary = self { return "Media Library" }
    //#endif
    
    switch (type) {
        case PermissionTypeMicrophone:
            return @"Microphone";
            break;
        case PermissionTypeLocationAlways:
        case PermissionTypeLocationWhenInUse:
            return @"Location";
        default:
            NSAssert(false, @"Error permission type");
    }
}

#pragma mark - property

- (PermissionAlert *)disabledAlert {
    if (nil == _disabledAlert) {
        _disabledAlert = [[DisabledAlert alloc] initWith:self];
    }
    return _disabledAlert;
}

- (PermissionAlert *)deniedAlert {
    if (nil == _deniedAlert) {
        _deniedAlert = [[DeniedAlert alloc] initWith:self];
    }
    return _deniedAlert;
}

- (PermissionStatus)status {
    switch (self.type) {
        case PermissionTypeMicrophone:
        {
            return [self statusMicrophone];
        }
            break;
        case PermissionTypeLocationAlways:
        {
            return [self statusLocationAlways];
        }
            break;
        case PermissionTypeLocationWhenInUse:
        {
            return [self statusLocationWhenInUse];
        }
            break;
        default:
            break;
    }
    
    NSAssert(false, @"Error permission type");
    return PermissionStatusDenied;
}

+ (Permission *)locationWhenInUse {
    if (nil == _locationWhenInUse) {
        _locationWhenInUse = [[Permission alloc] initWith:PermissionTypeLocationWhenInUse];
    }
    return _locationWhenInUse;
}

+ (Permission *)locationAlways {
    if (nil == _locationAlways) {
        _locationAlways = [[Permission alloc] initWith:PermissionTypeLocationAlways];
    }
    return _locationAlways;
}

+ (Permission *)microphone {
    if (nil == _microphone) {
        _microphone = [[Permission alloc] initWith:PermissionTypeMicrophone];
    }
    return _microphone;
}

@end
