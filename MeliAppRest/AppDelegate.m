//
//  AppDelegate.m
//  MeliAppRest
//
//  Created by marcos vissio on 20/12/2019.
//  Copyright © 2019 Rodrigo Camara Robles. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Init MainViewController and a Navigation Controller
    MainViewController *mainViewController = [[MainViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen.mainScreen bounds]];
    [self.window setRootViewController:navController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
