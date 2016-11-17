//
//  ViewController.m
//  DemoReachability
//
//  Created by zhangshaoyu on 15/8/3.
//  Copyright (c) 2015年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"
#import "SYReachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"网络监测";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Check" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClick:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick:(UIBarButtonItem *)button
{
    NSString *message = @"";
    // 方法1
    if ([[SYReachability shareReachability] NetworkStatus] == kNotReachable)
    {
        message = @"无网络";
    }
    else if ([[SYReachability shareReachability] NetworkStatus] == kReachableViaWWAN)
    {
        message = @"无限广域网";
    }
    else if ([[SYReachability shareReachability] NetworkStatus] == kReachableViaWiFi)
    {
        message = @"WiFi环境";
    }
    
    // 方法2
    message = (isNotReachable ? @"无网络" : (isWifi ? @"WiFi环境" : @"无限广域网"));
    
    [[[UIAlertView alloc] initWithTitle:@"当前网络状态" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil] show];
}

@end
