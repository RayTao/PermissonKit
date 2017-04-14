//
//  Permission+LocationWhenInUse.h
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission.h"

@interface Permission (LocationWhenInUse)
@property (nonatomic, readonly) PermissionStatus statusLocationWhenInUse;

- (void)requestLocationWhenInUse:(PermissionCallBack)callBack;

@end
