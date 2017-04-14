//
//  PermissionSet.m
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "PermissionSet.h"
#import "Permission.h"

@implementation PermissionSet

- (void)willRequestPermission:(Permission *)permission {
    if ([self.delegate respondsToSelector:@selector(permissionSet:willRequestPermission:)]) {
        [self.delegate permissionSet:self willRequestPermission:permission];
    }
}

- (void)didRequestPermission:(Permission *)permission {
    if ([self.delegate respondsToSelector:@selector(permissionSet:didRequestPermission:)]) {
        [self.delegate permissionSet:self didRequestPermission:permission];
    }
}

@end
