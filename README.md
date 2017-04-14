# PermissonKit
A easy way to ask for permissions on iOS

**Version 3.0.2**, synced to [Permission](https://github.com/delba/Permission)

## Usage

#### Permission

[`Permission.h`](https://github.com/RayTao/PermissonKit/blob/master/PermissonKit/Permission.h)
[`PermissionStatus.h`](https://github.com/RayTao/PermissonKit/blob/master/PermissonKit/PermissionStatus.h)

```objc
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
```



##### Supported Permissions

> [`PermissionType.swift`](https://github.com/delba/Permission/blob/master/Source/PermissionType.swift)
> [`PermissionTypes/`](https://github.com/delba/Permission/tree/master/Source/PermissionTypes)

- [`Microphone`](https://github.com/RayTao/PermissonKit/blob/master/PermissonKit/PermissionTypes/Permission%2BMicrophone.m)
- [`LocationAlways`](https://github.com/RayTao/PermissonKit/blob/master/PermissonKit/PermissionTypes/Permission%2BLocationAlways.m)
- [`LocationWhenInUse`](https://github.com/RayTao/PermissonKit/blob/master/PermissonKit/PermissionTypes/Permission%2BLocationWhenInUse.m)