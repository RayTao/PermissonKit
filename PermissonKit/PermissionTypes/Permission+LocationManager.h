//
//  Permission+LocationManager.h
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission.h"
#import <CoreLocation/CoreLocation.h>

@interface Permission (LocationManager) <CLLocationManagerDelegate>
+ (CLLocationManager *)locationManager;

@end

@interface CLLocationManager (Permission)

- (void)request:(Permission *)permission;
@end
