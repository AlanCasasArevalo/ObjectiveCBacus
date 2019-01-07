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
     * Creamos un Controllador por defecto vacio
     *************************************************************************************/
    UIViewController* rootVC = nil;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        rootVC = [self rootViewControllerForPadWithModel:wineryModel];
    } else {
        rootVC = [self rootViewControllerForPhoneWithModel:wineryModel];
    }
    
    self.window.rootViewController = rootVC;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}


- (void)applicationDidEnterBackground:(UIApplication *)application {}


- (void)applicationWillEnterForeground:(UIApplication *)application {}


- (void)applicationDidBecomeActive:(UIApplication *)application {}


- (void)applicationWillTerminate:(UIApplication *)application {}

#pragma mark - iPhone Controller
-(UIViewController*)rootViewControllerForPhoneWithModel:(WineryModel*) aModel{
    WineryTableViewController* wineryVC = [[WineryTableViewController alloc] initWithModel:aModel tableStyle:UITableViewStylePlain];
    UINavigationController* wineryNavVC = [[UINavigationController alloc]initWithRootViewController:wineryVC];
    wineryVC.delegate = wineryVC;
    return wineryNavVC;
}

#pragma mark - iPad Controller
-(UIViewController*)rootViewControllerForPadWithModel:(WineryModel*)aModel{
    /************************************************************************************
     * Creamos los controladores
     *************************************************************************************/
    WineryTableViewController* wineryTableVC = [[WineryTableViewController alloc] initWithModel:aModel tableStyle:UITableViewStylePlain];
    WineViewController* wineVC = [[WineViewController alloc]initWithModel: [wineryTableVC lastSelectedWine]];
    
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
    wineryTableVC.delegate = wineVC;
    
    return mainSplitVC;
    
}


@end













