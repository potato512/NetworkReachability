# NetworkReachability
网络监测Reachability

#import "ReachabilityHelper.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    // Override point for customization after application launch.

    // 开启网络状态监听
    [[ReachabilityHelper shareReachability] startNetworkStatusNotifier];

    // 网络环境
    NSString *message = (isNotReachable ? @"无网络" : (isWifi ? @"WiFi环境" : @"无限广域网"));
    NSLog(@"net work %@", message);

    return YES;
}