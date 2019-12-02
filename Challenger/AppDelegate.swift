//
//  AppDelegate.swift
//  Challenger
//
//  Created by Sreeni Appasani on 12/1/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

import Foundation

#import "AppDelegate.h"
#import "CGRLoginViewController.h"
#import "HomeViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//   Lets facebook SDK handle results from the native Facebook app when performing a Login or Share action.
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
//    CGRLoginViewController *masterViewController = [[CGRLoginViewController alloc] initWithNibName:nil bundle:nil];
//    self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CGRLogin_Storyboard" bundle:[NSBundle mainBundle]];
    CGRLoginViewController *vc = [storyboard instantiateInitialViewController];
    
    // Set root view controller and make windows visible
    
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        HomeViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewSB"];
        [self.navigationController pushViewController:controller animated:YES];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        self.window.rootViewController = controller;
        [self.window makeKeyAndVisible];
    } else {
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
        self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        self.window.rootViewController = vc;
        [self.window makeKeyAndVisible];
    }

    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
