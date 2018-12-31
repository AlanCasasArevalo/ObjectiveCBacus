//
//  AppDelegate.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 21/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "AppDelegate.h"
#import "WineModel.h"
#import "WineViewController.h"
#import "WineWebViewController.h"
#import "WineryModel.h"
#import "WineryTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];

    /************************************************************************************
     * Creamos modelo
     *************************************************************************************/
    WineryModel* wineryModel = [[WineryModel alloc]init];
    
    /************************************************************************************
     * Creamos el controlador
     *************************************************************************************/
    WineryTableViewController* wineryTableVC = [[WineryTableViewController alloc] initWithModel:wineryModel tableStyle:UITableViewStylePlain];
    
    /************************************************************************************
     * Creamos el navegador
     *************************************************************************************/
    UINavigationController* wineryNC = [[UINavigationController alloc]initWithRootViewController:wineryTableVC];
    
    
    self.window.rootViewController = wineryNC;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}


- (void)applicationDidEnterBackground:(UIApplication *)application {}


- (void)applicationWillEnterForeground:(UIApplication *)application {}


- (void)applicationDidBecomeActive:(UIApplication *)application {}


- (void)applicationWillTerminate:(UIApplication *)application {}

@end













