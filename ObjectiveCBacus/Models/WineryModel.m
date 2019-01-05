//
//  WineryModel.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineryModel.h"

@interface WineryModel ()

@property (strong, nonatomic) NSMutableArray* redWines;
@property (strong, nonatomic) NSMutableArray* whiteWines;
@property (nonatomic,strong) NSMutableArray* champagneWines;
@property (nonatomic,strong) NSMutableArray* roseWines;

@end

@implementation WineryModel

-(NSUInteger) redWineCount {
    return [self.redWines count];
}

-(NSUInteger) whiteWineCount {
    return [self.whiteWines count];
}

-(NSUInteger) champagneWineCount {
    return [self.champagneWines count];
}

-(NSUInteger) roseWineCount {
    return [self.roseWines count];
}


-(id) init {
    if (self = [super init]) {
        
        NSError* customError = nil;
        NSString* errorDefaultMessage = @"Ha habido un error al intentar hacer la conversion de JSON e inicializarlo dentro de los vinos";
        
        NSString* urlString = @"http://static.keepcoding.io/baccus/wines.json";
        
        NSURL* url = [NSURL URLWithString:urlString];
        
        NSData* dataJsonResult = [NSData dataWithContentsOfURL:url];
        
        if (!dataJsonResult) {
            customError = [NSError errorWithDomain:@"Baccus.Model"
                                              code:42
                                          userInfo:@{NSLocalizedDescriptionKey: errorDefaultMessage}];
        } else {
            if (dataJsonResult != nil) {
                
                NSArray* JSONObjects = [NSJSONSerialization JSONObjectWithData:dataJsonResult
                                                                       options:nil
                                                                         error:&customError];
                
                if (JSONObjects != nil) {
                    
                    NSDictionary *jsonWineDictionary = nil;
                    
                    for (jsonWineDictionary in JSONObjects) {
                        
                        WineModel* wineFromJson = [[WineModel alloc]initWithDictionary: jsonWineDictionary];
                        
                        if (wineFromJson.name != nil) {
                            
                            if ([wineFromJson.type isEqualToString:RED_WINE_KEY]) {
                                if (!self.redWines){
                                    self.redWines = [NSMutableArray arrayWithObject:wineFromJson];
                                }else{
                                    [self.redWines addObject:wineFromJson];
                                }
                            } else if ([wineFromJson.type isEqualToString:WHITE_WINE_KEY]) {
                                if (!self.whiteWines){
                                    self.whiteWines = [NSMutableArray arrayWithObject:wineFromJson];
                                }else{
                                    [self.whiteWines addObject:wineFromJson];
                                }
                            } else if ([wineFromJson.type isEqualToString: ROSE_WINE_KEY]) {
                                if (!self.roseWines){
                                    self.roseWines = [NSMutableArray arrayWithObject:wineFromJson];
                                }else{
                                    [self.roseWines addObject:wineFromJson];
                                }
                            } else if ([wineFromJson.type isEqualToString:CHAMPAGNE_WINE_KEY]) {
                                if (!self.champagneWines){
                                    self.champagneWines = [NSMutableArray arrayWithObject:wineFromJson];
                                }else{
                                    [self.champagneWines addObject:wineFromJson];
                                }
                            }
                        }
                    }
                    
                    
                } else {
                    NSLog(@"Lo sentimos ha habido un error al parsear el JSON %@", customError.localizedDescription);
                }
                
            } else {
                
                //Error al descargar
                NSLog(@"Lo sentimos ha habido un error al descargar %@", customError.localizedDescription);
            }
        }
        
    }
    
    return self;
}

-(WineryModel*) redWineAtIndex: (NSUInteger) redIndex{
    return [self.redWines objectAtIndex:redIndex];
}
-(WineryModel*) whiteWineAtIndex: (NSUInteger) whiteIndex{
    return [self.whiteWines objectAtIndex:whiteIndex];
}
-(WineryModel*) roseWineAtIndex: (NSUInteger) roseIndex{
    return [self.roseWines objectAtIndex:roseIndex];
}
-(WineryModel*) champagneWineAtIndex: (NSUInteger) champagneIndex{
    return [self.champagneWines objectAtIndex:champagneIndex];
}


@end

















