//
//  PermissionAlert.h
//  PermissonKit
//
//  Created by ray on 2017/4/14.
//  Copyright © 2017年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Permission;

@interface PermissionAlert : NSObject
/// The title of the alert.
@property (nonatomic, copy) NSString *title;

/// Descriptive text that provides more details about the reason for the alert.
@property (nonatomic, copy) NSString *message;

/// The title of the cancel action.
@property (nonatomic, copy) NSString *cancel;

/// The title of the settings action.
@property (nonatomic, copy) NSString *setting;

/// The title of the confirm action.
@property (nonatomic, copy) NSString *confirm;

- (instancetype)initWith:(Permission *)permission;
- (void)present;

@end


@interface DisabledAlert : PermissionAlert

@end

@interface DeniedAlert : PermissionAlert

@end
