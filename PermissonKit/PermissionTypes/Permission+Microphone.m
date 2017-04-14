//
//  Permission+Microphone.m
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission+Microphone.h"
#import <AVFoundation/AVFoundation.h>

@implementation Permission (Microphone)

- (PermissionStatus)statusMicrophone {
    AVAudioSessionRecordPermission status = [[AVAudioSession sharedInstance] recordPermission];
    switch (status) {
        case AVAudioSessionRecordPermissionDenied:
            return PermissionStatusDenied;
        case AVAudioSessionRecordPermissionGranted:
            return PermissionStatusAuthorized;
        default:
            return PermissionStatusNotDetermined;
    }
}

- (void)requestMicrophone:(PermissionCallBack)callBack {
    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        callBack(self.status);
    }];
}

@end
