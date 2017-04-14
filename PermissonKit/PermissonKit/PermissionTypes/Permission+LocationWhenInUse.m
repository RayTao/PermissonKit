//
//  Permission+LocationWhenInUse.m
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission+LocationWhenInUse.h"
#import <CoreLocation/CoreLocation.h>
#import "Permission+String.h"
#import "Permission+LocationManager.h"
#import <UIKit/UIKit.h>

@implementation Permission (LocationWhenInUse)

- (PermissionStatus)statusLocationWhenInUse {
    if (![CLLocationManager locationServicesEnabled]) return PermissionStatusDisabled;
    
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined: return PermissionStatusNotDetermined;
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied: return PermissionStatusDenied;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse: return PermissionStatusAuthorized;
    }
}

- (void)requestLocationWhenInUse:(PermissionCallBack)callBack {
    if (![[NSBundle mainBundle] objectForInfoDictionaryKey:Permission.locationWhenInUseUsageDescription]) {
        NSAssert(false, [Permission.locationWhenInUseUsageDescription stringByAppendingString:@"%@ not found in Info.plist"]);
    }
    
    [[Permission locationManager] request:self];
}

@end
