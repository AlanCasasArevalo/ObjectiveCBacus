//
//  WineViewController.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 21/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"

@interface WineViewController : UIViewController

@property (strong, nonatomic) WineModel* wineModel;

-(id)initWithModel: (WineModel *)aModel;

@end
