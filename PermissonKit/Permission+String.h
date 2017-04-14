//
//  Permission+String.h
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission.h"

@interface Permission (String)
//info.plist privacy keys
@property (class, nonatomic, readonly) NSString *locationWhenInUseUsageDescription;
@property (class, nonatomic, readonly) NSString *locationAlwaysUsageDescription;
@property (class, nonatomic, readonly) NSString *microphoneUsageDescription;
@property (class, nonatomic, readonly) NSString *speechRecognitionUsageDescription;
@property (class, nonatomic, readonly) NSString *photoLibraryUsageDescription;
@property (class, nonatomic, readonly) NSString *cameraUsageDescription;
@property (class, nonatomic, readonly) NSString *mediaLibraryUsageDescription;
@property (class, nonatomic, readonly) NSString *siriUsageDescription;
//UserDefaults keys
@property (class, nonatomic, readonly) NSString *requestedLocationAlwaysWithWhenInUse;
@property (class, nonatomic, readonly) NSString *requestedMotion;
@property (class, nonatomic, readonly) NSString *requestedBluetooth;
@property (class, nonatomic, readonly) NSString *statusBluetooth;
@property (class, nonatomic, readonly) NSString *stateBluetoothManagerDetermined;

@end
