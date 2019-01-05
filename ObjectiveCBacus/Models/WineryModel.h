//
//  WineryModel.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineModel.h"

#define RED_WINE_KEY        @"Tinto"
#define WHITE_WINE_KEY      @"Blanco"
#define ROSE_WINE_KEY       @"Rosado"
#define CHAMPAGNE_WINE_KEY  @"Cava"

@interface WineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWineCount;
@property (readonly, nonatomic) NSUInteger whiteWineCount;
@property (nonatomic,readonly) NSUInteger champagneWineCount;
@property (nonatomic,readonly) NSUInteger roseWineCount;

-(WineryModel*) redWineAtIndex: (NSUInteger) redIndex;
-(WineryModel*) whiteWineAtIndex: (NSUInteger) whiteIndex;
-(WineModel*) champagneWineAtIndex:(NSUInteger)index;
-(WineModel*) roseWineAtIndex:(NSUInteger)index;

@end
