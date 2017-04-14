//
//  PermissionAlert.m
//  PermissonKit
//
//  Created by ray on 2017/4/14.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "PermissionAlert.h"
#import "Permission.h"
#import <UIKit/UIKit.h>

#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.f) ? (YES) : (NO))


@interface PermissionAlert () <UIAlertViewDelegate>
@property (nonatomic, weak) Permission *permission;
//@property (nonatomic, copy) NSString *cancelActionTitle;
//@property (nonatomic, copy) NSString *defaultActionTitle;
- (UIAlertController *)controller;
- (UIAlertView *)alertView;

@end

@implementation PermissionAlert

- (instancetype)initWith:(Permission *)permission {
    if (self = [super init]) {
        _permission = permission;
    }
    return self;
}

- (void)present {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (IOS_VERSION_8_OR_LATER) {
            [[self topViewController] presentViewController:[self controller] animated:true completion:nil];
        } else {
            [[self alertView] show];
        }
    });
}

- (void)cancelHandler {
    [self callbacks]([self status]);
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self cancelHandler];
    }
}

#pragma mark - property

- (UIAlertView *)alertView {
    return
    [[UIAlertView alloc] initWithTitle:self.title message:self.message delegate:self cancelButtonTitle:self.cancel otherButtonTitles: nil];
}

- (UIAlertController *)controller {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:self.cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self cancelHandler];
    }];
    [controller addAction:action];
    return controller;
}

- (UIViewController *)topViewController {
    UIViewController *vc = [[UIApplication sharedApplication].delegate window].rootViewController;
    
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
    }
    
    return vc;
}

- (PermissionStatus)status {
    return self.permission.status;
}

- (PermissionCallBack)callbacks {
    return ^(PermissionStatus status){
        [self.permission callBacksWith:status];
    };
}

@end

@implementation DisabledAlert

- (instancetype)initWith:(Permission *)permission {
    self = [super initWith:permission];
    
    self.title = [NSString stringWithFormat:@"%@ is currently disabled",self.permission.description];
    self.message = [NSString stringWithFormat:@"Please enable access to %@ in the Settings app.",self.permission.description];
    self.cancel = @"OK";
    
    return self;
}

@end

@implementation DeniedAlert

- (instancetype)initWith:(Permission *)permission {
    self = [super initWith:permission];
    
    self.title = [NSString stringWithFormat:@"Permission for %@ was denied",self.permission.description];
    self.message = [NSString stringWithFormat:@"Please enable access to %@ in the Settings app.",self.permission.description];
    self.cancel = @"Cancel";
    self.setting = @"Settings";
    
    return self;
}



- (UIAlertController *)controller {
    UIAlertController *controller = super.controller;
    UIAlertAction *action = [UIAlertAction actionWithTitle:self.setting style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self settingsHandler];
    }];
    [controller addAction:action];
    return controller;
}

- (void)settingsOver {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    [super callbacks]([super status]);
}

- (void)settingsHandler {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(settingsOver) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

}

@end





