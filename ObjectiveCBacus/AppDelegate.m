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
    UIImage* bembibrePhoto = [UIImage imageNamed:@"bembibre.jpg"];
    UIImage* albarinoPhoto = [UIImage imageNamed:@"zarate.jpg"];
    UIImage* guzmanPhoto = [UIImage imageNamed:@"guzman.jpg"];

    NSURL* bembibreCompanyWeb = [NSURL URLWithString:@"https://www.dominiodetares.com/portfolio/bembibre/"];
    NSURL* albarinoCompanyWeb = [NSURL URLWithString:@"https://www.bodeboca.com/vino/zarate-tras-da-vina-2015"];
    NSURL* guzmanCompanyWeb = [NSURL URLWithString:@"https://www.vinopremier.com/vino-rosado-raiz-de-guzman-2015.html"];

    WineModel* bembibre = [WineModel wineWithName:@"Bembibre"
                                  wineCompanyName:@"Dominio de Tares"
                                             type:@"tinto"
                                            notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                           origin:@"El Bierzo"
                                            photo:bembibrePhoto
                                   wineCompanyWeb:bembibreCompanyWeb
                                           grapes:@[@"Mencía"]
                                           rating:5];
    
    
    WineModel* albarino = [WineModel wineWithName:@"Zarate"
                              wineCompanyName:@"Zarate"
                                         type:@"Blanco"
                                        notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                       origin:@"Rias Bajas"
                                        photo:albarinoPhoto
                               wineCompanyWeb:albarinoCompanyWeb
                                       grapes:@[@"Albariño"]
                                       rating:5];
    
    WineModel* guzman = [WineModel wineWithName:@"Raiz de Guzman"
                              wineCompanyName:@"Raiz de Guzman"
                                         type:@"Rosado"
                                        notes:@"Raíz de Guzmán son vinos con denominación de origen Ribera del Duero elaborados con uva 100% tempranillo en la localidad burgalesa de Roa de Duero. Tradición e innovación se funden en su elaboración y se traducen, al término del proceso, en productos exclusivos y de altísima calidad, la seña de identidad de la casa."
                                       origin:@"Ribera del Duero"
                                        photo:guzmanPhoto
                               wineCompanyWeb:guzmanCompanyWeb
                                       grapes:@[@"Chardonnay"]
                                       rating:5];
    
    WineViewController* bembibreMainController = [[WineViewController alloc] initWithModel: bembibre];
    WineViewController* albarinoMainController = [[WineViewController alloc] initWithModel: albarino];
    WineViewController* guzmanMainController = [[WineViewController alloc] initWithModel: guzman];

    UINavigationController* bembibreNavigationController = [[UINavigationController alloc] initWithRootViewController:bembibreMainController];
    UINavigationController* albarinoNavigationController = [[UINavigationController alloc] initWithRootViewController:albarinoMainController];
    UINavigationController* guzmanNavigationController = [[UINavigationController alloc] initWithRootViewController:guzmanMainController];

    UITabBarController* wineryTabBarController = [[UITabBarController alloc] init];
    
    wineryTabBarController.viewControllers =  @[bembibreNavigationController, albarinoNavigationController, guzmanNavigationController];
    
    self.window.rootViewController = wineryTabBarController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}


- (void)applicationDidEnterBackground:(UIApplication *)application {}


- (void)applicationWillEnterForeground:(UIApplication *)application {}


- (void)applicationDidBecomeActive:(UIApplication *)application {}


- (void)applicationWillTerminate:(UIApplication *)application {}

@end













