//
//  SYReachability.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 14-7-14.
//  Copyright (c) 2014年 zhangshaoyu. All rights reserved.
//

#import "SYReachability.h"

static NetworkStatus staticCurrentNetworkStatus;   // 当前网络连接

@implementation SYReachability
{
    Reachability *hostReachbility;
}

// 单例模式
+ (SYReachability *)shareReachability
{
    static SYReachability *staticNetworkStatusManager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        staticNetworkStatusManager = [[self alloc] init];
        assert(staticNetworkStatusManager != nil);
    });
    
    return staticNetworkStatusManager;
}

// 开启网络状态监听
- (BOOL)startNetworkStatusNotifier
{
    // 检测设备网络状态，可以以多种形式初始化
    hostReachbility = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    // 获得设备现在的网络状态
    staticCurrentNetworkStatus = [hostReachbility currentReachabilityStatus];
    
    // 开启网络状况的监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    // 开始监听,会启动一个run loop
    return [hostReachbility startNotifier];
}

// 处理连接改变后的情况
- (void)updateInterfaceWithReachability:(Reachability *)curReach
{
    staticCurrentNetworkStatus = [curReach currentReachabilityStatus];
}

// 连接改变
- (void)reachabilityChanged:(NSNotification *)note
{
    Reachability *curReach = [note object];
//    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    if ([curReach isKindOfClass:[Reachability class]])
    {
        [self updateInterfaceWithReachability: curReach];
    }
}

/// 获取当前的网络状态
- (NetworkStatus)NetworkStatus
{
    return staticCurrentNetworkStatus;
}

// 获得当前的网络状态，wifi
- (BOOL)isNetworkWifi
{
    if (kReachableViaWiFi == staticCurrentNetworkStatus)
    {
        return YES;
    }
    return NO;
}

// 获得当前的网络状态，无网络
- (BOOL)isNetworkNotReachable
{
    if (kNotReachable == staticCurrentNetworkStatus)
    {
        return YES;
    }
    return NO;
}

// 获得当前的网络状态，WWAN
- (BOOL)isNetworkWWAN
{
    if (kReachableViaWWAN == staticCurrentNetworkStatus)
    {
        return YES;
    }
    return NO;
}

@end
