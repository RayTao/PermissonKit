//
//  Permission.h
//  PermissonKit
//
//  Created by ray on 2017/4/12.
//  Copyright © 2017年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PermissionStatus.h"

@class PermissionSet;
@class PermissionAlert;

typedef NS_ENUM(NSUInteger, PermissionType) {
    PermissionTypeMicrophone,
    PermissionTypeLocationAlways,
    PermissionTypeLocationWhenInUse,
};

typedef void(^PermissionCallBack)(PermissionStatus status);

@interface Permission : NSObject

@property (class, nonatomic, readonly) Permission *microphone;
@property (class, nonatomic, readonly) Permission *locationAlways;
@property (class, nonatomic, readonly) Permission *locationWhenInUse;

@property (nonatomic, assign, readonly) PermissionType type;
@property (nonatomic, readonly) PermissionStatus status;
@property (nonatomic, copy) PermissionCallBack callback;
@property (nonatomic, strong) NSMutableArray<PermissionSet *> *permissionSets;
@property (nonatomic, assign) BOOL presentDeniedAlert;
@property (nonatomic, assign) BOOL presentDisabledAlert;
@property (nonatomic, strong) PermissionAlert *disabledAlert;
@property (nonatomic, strong) PermissionAlert *deniedAlert;


//- (instancetype)initWith:(PermissionType)type;

/**
 Requests the permission.

 @param callback The function to be triggered after the user responded to the request.
 */
- (void)request:(PermissionCallBack)callback;
- (void)callBacksWith:(PermissionStatus)status;

@end
