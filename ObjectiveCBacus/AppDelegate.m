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
     * Creamos los controladores
     *************************************************************************************/
    WineryTableViewController* wineryTableVC = [[WineryTableViewController alloc] initWithModel:wineryModel tableStyle:UITableViewStylePlain];
    WineViewController* wineVC = [[WineViewController alloc]initWithModel: [wineryModel redWineAtIndex:0]];
    
    /************************************************************************************
     * Creamos el navegador
     *************************************************************************************/
    UINavigationController* wineryNC = [[UINavigationController alloc]initWithRootViewController:wineryTableVC];
    UINavigationController* wineNC = [[UINavigationController alloc] initWithRootViewController:wineVC];
    
    /************************************************************************************
     * Combinador SplitVC
     *************************************************************************************/
    UISplitViewController* mainSplitVC = [[UISplitViewController alloc] init];
    mainSplitVC.viewControllers = @[wineryNC, wineNC];
    
    /************************************************************************************
     * Asignar delegados
     *************************************************************************************/    
    mainSplitVC.delegate = wineVC;
    
    self.window.rootViewController = mainSplitVC;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}


- (void)applicationDidEnterBackground:(UIApplication *)application {}


- (void)applicationWillEnterForeground:(UIApplication *)application {}


- (void)applicationDidBecomeActive:(UIApplication *)application {}


- (void)applicationWillTerminate:(UIApplication *)application {}

@end













