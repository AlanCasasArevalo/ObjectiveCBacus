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

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    
    // Creamos un modelo
    UIImage* winePhoto = [UIImage imageNamed:@"bembibre.jpg"];
    
    NSURL* wineCompanyWeb = [NSURL URLWithString:@"https://www.dominiodetares.com/portfolio/bembibre/"];
    
    WineModel* bembibre = [WineModel wineWithName:@"Bembibre"
                                  wineCompanyName:@"Dominio de Tares"
                                             type:@"tinto"
                                            notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                           origin:@"El Bierzo"
                                            photo:winePhoto
                                   wineCompanyWeb:wineCompanyWeb
                                           grapes:@[@"Mencía"]
                                           rating:5];
    
    WineViewController* wineMainController = [[WineViewController alloc] initWithModel: bembibre];
    
    WineWebViewController* webViewController = [[WineWebViewController alloc] initWithModel:bembibre];
    
    self.window.rootViewController = webViewController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}


- (void)applicationDidEnterBackground:(UIApplication *)application {}


- (void)applicationWillEnterForeground:(UIApplication *)application {}


- (void)applicationDidBecomeActive:(UIApplication *)application {}


- (void)applicationWillTerminate:(UIApplication *)application {}

@end













