//
//  SYReachability.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 14-7-14.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//  功能描述：网络状态管理

#import <Foundation/Foundation.h>
#import "Reachability.h"

/// Wifi网络
#define isWifi ([[SYReachability shareReachability] isNetworkWifi])

/// WWAN网络
#define isWWAN ([[SYReachability shareReachability] isNetworkWWAN])

/// 无网络
#define isNotReachable ([[SYReachability shareReachability] isNetworkNotReachable])

@interface SYReachability : NSObject

/// 单例模式
+ (SYReachability *)shareReachability;

/// 开启网络状态监听（注意：在AppDelegate类的代理方法中实现，- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { return YES; }）
- (BOOL)startNetworkStatusNotifier;

/// 获取当前的网络状态（kNotReachable = 0, kReachableViaWWAN, kReachableViaWiFi）
- (NetworkStatus)NetworkStatus;

/// 获得当前的网络状态，Wifi
- (BOOL)isNetworkWifi;

/// 获得当前的网络状态，无网络
- (BOOL)isNetworkNotReachable;

/// 获得当前的网络状态，WWAN
- (BOOL)isNetworkWWAN;

@end
