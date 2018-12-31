//
//  WineryTableViewController.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineViewController.h"
#import "WineryModel.h"
#import "WineModel.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

@interface WineryTableViewController : UITableViewController

@property (strong, nonatomic) WineryModel* wineryModel;

-(id) initWithModel: (WineryModel *) aWineryModel
         tableStyle: (UITableViewStyle) aTableStyle;

@end
