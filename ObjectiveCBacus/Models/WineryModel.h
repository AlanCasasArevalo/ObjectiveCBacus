//
//  WineryModel.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineModel.h"

@interface WineryModel : NSObject

@property (readonly, nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;

-(WineryModel*) redWineAtIndex: (int) redIndex;
-(WineryModel*) whiteWineAtIndex: (int) whiteIndex;
-(WineryModel*) otherWineAtIndex: (int) otherIndex;

@end
