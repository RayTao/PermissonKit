//
//  Permission+LocationAlways.m
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission+LocationAlways.h"
#import "Permission+String.h"
#import "Permission+LocationManager.h"
#import <UIKit/UIKit.h>

@implementation Permission (LocationAlways)

- (PermissionStatus)statusLocationAlways {
    if (![CLLocationManager locationServicesEnabled]) return PermissionStatusDisabled;
    
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorizedAlways: return PermissionStatusAuthorized;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            BOOL requestedLocationAlwaysWithWhenInUse = [[[NSUserDefaults standardUserDefaults]
             objectForKey:[Permission requestedLocationAlwaysWithWhenInUse]]
             boolValue];
            return requestedLocationAlwaysWithWhenInUse ? PermissionStatusDenied : PermissionStatusNotDetermined;
        }
        case kCLAuthorizationStatusNotDetermined: return PermissionStatusNotDetermined;
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied: return PermissionStatusDenied;
    }
}

- (void)requestLocationAlways:(PermissionCallBack)callBack {

    if (![[NSBundle mainBundle] objectForInfoDictionaryKey:[Permission locationAlwaysUsageDescription]]) {
        NSString *des = [Permission.locationAlwaysUsageDescription stringByAppendingString:@"%@ not found in Info.plist"];
        NSLog(@"%@",des);
        NSAssert(false, des);
    }
    
    [[Permission locationManager] request:self];
}

@end
