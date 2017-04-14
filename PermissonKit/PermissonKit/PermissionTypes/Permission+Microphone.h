//
//  Permission+Microphone.h
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission.h"

@interface Permission (Microphone)
@property (nonatomic, readonly) PermissionStatus statusMicrophone;

- (void)requestMicrophone:(PermissionCallBack)callBack;

@end
