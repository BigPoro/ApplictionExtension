//
//  AppDelegate.m
//  ApplicationExtension
//
//  Created by iDog on 2020/8/25.
//  Copyright © 2020 iDog. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = ViewController.new;
    [self.window makeKeyAndVisible];
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"app group name"];
    [userDefaults setObject:@"共享数据" forKey:@"content"];
    return YES;
}





@end
