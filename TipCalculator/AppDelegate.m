//
//  AppDelegate.m
//  TipCalculator
//
//  Created by Jackal Wang on 2015/6/9.
//  Copyright (c) 2015年 Jackal Wang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:0 forKey:@"default_tip_amount"];
        [defaults setBool:YES forKey:@"everLaunched"];
        
        //NSString *ciColorStr = @"0.5 0.7 0.3 1.0";
        float red = 0.5;
        float green = 0.7;
        float blue = 0.3;
        float opaque = 1.0;
        
        [defaults setFloat:red forKey:@"red"];
        [defaults setFloat:green forKey:@"green"];
        [defaults setFloat:blue forKey:@"blue"];
        [defaults setFloat:opaque forKey:@"opaque"];
        
        [defaults synchronize];
    }
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:self.window.rootViewController];
    self.window.rootViewController = nvc;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
