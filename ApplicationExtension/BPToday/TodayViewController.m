//
//  TodayViewController.m
//  BPToday
//
//  Created by iDog on 2020/8/25.
//  Copyright © 2020 iDog. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 0, 200, 100);
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openContainerApp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 数据共享 
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"app group name"];
    NSLog(@"%@",[userDefaults objectForKey:@"content"]);
}

- (void)openContainerApp:(UIButton *)sender {
    [self.extensionContext openURL:[NSURL URLWithString:@"BPAppExt://"] completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"跳转成功");
        } else {
            NSLog(@"跳转失败");

        }
    }];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {


    completionHandler(NCUpdateResultNewData);
}

@end
