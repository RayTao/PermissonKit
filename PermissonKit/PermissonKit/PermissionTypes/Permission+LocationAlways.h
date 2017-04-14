//
//  Permission+LocationAlways.h
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission.h"
#import <CoreLocation/CoreLocation.h>

@interface Permission (LocationAlways)
- (PermissionStatus)statusLocationAlways;
- (void)requestLocationAlways:(PermissionCallBack)callBack;

@end
