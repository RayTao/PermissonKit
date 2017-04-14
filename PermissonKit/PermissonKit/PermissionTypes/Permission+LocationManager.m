//
//  Permission+LocationManager.m
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission+LocationManager.h"

static BOOL requestedLocation = false;
static BOOL triggerCallbacks = false;

@implementation Permission (LocationManager)
+ (CLLocationManager *)locationManager {
    static id locationManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationManager = [[CLLocationManager alloc] init];
    });
    
    return locationManager;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if (requestedLocation && triggerCallbacks) {
        requestedLocation = false;
        triggerCallbacks = false;
        [self callBacksWith:self.status];
    } else if (requestedLocation && !triggerCallbacks) {
        triggerCallbacks = true;
    }
    
}

@end

@implementation CLLocationManager (Permission)

- (void)request:(Permission *)permission {
    self.delegate = permission;
    
    requestedLocation = true;
    
    if (PermissionTypeLocationAlways == permission.type) {
        [self requestAlwaysAuthorization];
    } else if (PermissionTypeLocationWhenInUse == permission.type) {
        [self requestWhenInUseAuthorization];
    }
}

@end
