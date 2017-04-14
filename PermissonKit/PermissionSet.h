//
//  PermissionSet.h
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Permission;
@class PermissionSet;
@protocol PermissionSetDelegate;

@protocol PermissionSetDelegate <NSObject>

/**
 Tells the delegate that the specified permission has been requested.

 @param permissionSet The permission set containing the requested permission.
 @param permission The requested permission.
 */
- (void)permissionSet:(PermissionSet *)permissionSet didRequestPermission:(Permission *)permission;
- (void)permissionSet:(PermissionSet *)permissionSet willRequestPermission:(Permission *)permission;

@end


@interface PermissionSet : NSObject
@property (nonatomic, strong, readonly) NSSet<Permission *> *permissions;
@property (nonatomic, weak) id<PermissionSetDelegate> delegate;

- (void)willRequestPermission:(Permission *)permission;
- (void)didRequestPermission:(Permission *)permission;

@end
