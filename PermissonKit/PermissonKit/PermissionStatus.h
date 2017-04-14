//
//  PermissionStatus.h
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#ifndef PermissionStatus_h
#define PermissionStatus_h

typedef NS_ENUM(NSUInteger, PermissionStatus) {
    PermissionStatusAuthorized      = 10,
    PermissionStatusDenied,
    PermissionStatusDisabled,
    PermissionStatusNotDetermined,
};

#endif /* PermissionStatus_h */
