//
//  Permission+String.m
//  PermissonKit
//
//  Created by ray on 2017/4/13.
//  Copyright © 2017年 ray. All rights reserved.
//

#import "Permission+String.h"

@implementation Permission (String)
static NSString *_locationWhenInUseUsageDescription = @"NSLocationWhenInUseUsageDescription";
static NSString *_locationAlwaysUsageDescription = @"NSLocationAlwaysUsageDescription";
static NSString *_microphoneUsageDescription = @"NSMicrophoneUsageDescription";
static NSString *_speechRecognitionUsageDescription = @"NSPhotoLibraryUsageDescription";
static NSString *_photoLibraryUsageDescription = @"NSPhotoLibraryUsageDescription";
static NSString *_cameraUsageDescription = @"NSCameraUsageDescription";
static NSString *_mediaLibraryUsageDescription = @"NSAppleMusicUsageDescription";
static NSString *_siriUsageDescription = @"NSSiriUsageDescription";

static NSString *_requestedLocationAlwaysWithWhenInUse = @"permission.requestedLocationAlwaysWithWhenInUse";
static NSString *_requestedMotion = @"permission.requestedMotion";
static NSString *_requestedBluetooth = @"permission.requestedBluetooth";
static NSString *_statusBluetooth = @"permission.statusBluetooth";
static NSString *_stateBluetoothManagerDetermined = @"permission.stateBluetoothManagerDetermined";

+ (NSString *)stateBluetoothManagerDetermined {
    return _stateBluetoothManagerDetermined;
}

+ (NSString *)statusBluetooth {
    return _statusBluetooth;
}

+ (NSString *)requestedBluetooth {
    return _requestedBluetooth;
}

+ (NSString *)requestedMotion {
    return _requestedLocationAlwaysWithWhenInUse;
}

+ (NSString *)requestedLocationAlwaysWithWhenInUse {
    return _requestedLocationAlwaysWithWhenInUse;
}

+ (NSString *)photoLibraryUsageDescription {
    return _photoLibraryUsageDescription;
}

+ (NSString *)siriUsageDescription {
    return _siriUsageDescription;
}

+ (NSString *)mediaLibraryUsageDescription {
    return _mediaLibraryUsageDescription;
}

+ (NSString *)cameraUsageDescription {
    return _cameraUsageDescription;
}

+ (NSString *)speechRecognitionUsageDescription {
    return _speechRecognitionUsageDescription;
}

+ (NSString *)microphoneUsageDescription {
    return _microphoneUsageDescription;
}

+ (NSString *)locationAlwaysUsageDescription {
    return _locationAlwaysUsageDescription;
}

+ (NSString *)locationWhenInUseUsageDescription {
    return _locationWhenInUseUsageDescription;
}

@end
