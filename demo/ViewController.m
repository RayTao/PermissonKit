//
//  ViewController.m
//  demo
//
//  Created by ray on 2017/4/12.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "ViewController.h"
#import "Permission.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Permission *permission = Permission.locationWhenInUse;
    NSLog(@"permission.status:%@",@(permission.status));
    
    [permission request:^(PermissionStatus status) {
        switch (status) {
            case PermissionStatusAuthorized:
            {
                NSLog(@"Authorized");
            }
                break;
            case PermissionStatusNotDetermined:
            {
                NSLog(@"NotDetermined");

            }
                break;
            case PermissionStatusDenied:
            {
                NSLog(@"Denied");
            }
                break;
            case PermissionStatusDisabled:
            {
                NSLog(@"Disabled");
            }
                break;
            default:
                break;
        }
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
