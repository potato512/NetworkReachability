//
//  NetworkManager.h
//  AMF
//
//  Created by zhangshaoyu on 14-7-14.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//  功能描述：网络状态管理

#import <Foundation/Foundation.h>
#import "Reachability.h"

/// Wifi网络
#define isWifi ([[ReachabilityHelper shareReachability] NetworkWifi])

/// WWAN网络
#define isWWAN ([[ReachabilityHelper shareReachability] NetworkWWAN])

/// 无网络
#define isNotReachable ([[ReachabilityHelper shareReachability] NetworkNotReachable])

@interface ReachabilityHelper : NSObject

/// 单例模式
+ (ReachabilityHelper *)shareReachability;

/// 开启网络状态监听
- (BOOL)startNetworkStatusNotifier;

/// 获取当前的网络状态（kNotReachable = 0, kReachableViaWWAN, kReachableViaWiFi）
- (NetworkStatus)NetworkStatus;

/// 获得当前的网络状态，Wifi
- (BOOL)NetworkWifi;

/// 获得当前的网络状态，无网络
- (BOOL)NetworkNotReachable;

/// 获得当前的网络状态，WWAN
- (BOOL)NetworkWWAN;

@end
