//
//  WineryModel.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineryModel.h"

@interface WineryModel ()

@property (strong, nonatomic) NSArray* redWines;
@property (strong, nonatomic) NSArray* whiteWines;
@property (strong, nonatomic) NSArray* othersWines;

@end

@implementation WineryModel

-(int) redWineCount {
    return [self.redWines count];
}

-(int) whiteWineCount {
    return [self.whiteWines count];
}

-(int) otherWineCount {
    return [self.othersWines count];
}

-(id) init {
    if (self = [super init]) {
        
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
        
        self.redWines = @[bembibre];
        self.whiteWines = @[albarino];
        self.othersWines = @[guzman];
        
    }
    
    return self;
}

-(WineryModel*) redWineAtIndex: (int) redIndex{
    return [self.redWines objectAtIndex:redIndex];
}
-(WineryModel*) whiteWineCount: (int) whiteIndex{
    return [self.whiteWines objectAtIndex:whiteIndex];
}
-(WineryModel*) otherWineCount: (int) otherIndex{
    return [self.othersWines objectAtIndex:otherIndex];
}

@end
