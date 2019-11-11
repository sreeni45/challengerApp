//
//  CGRLoginViewController.m
//  Challenger
//
//  Created by Sreenivas Appasani on 11/10/19.
//  Copyright © 2019 Sreenivas Appasani. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HomeViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "CGRLoginViewController.h"

@interface CGRLoginViewController ()

@end

@implementation CGRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    // Do any additional setup after loading the view.
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        HomeViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewSB"];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
