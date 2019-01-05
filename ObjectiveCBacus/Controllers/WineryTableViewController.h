//
//  WineryTableViewController.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineryModel.h"
#import "WineModel.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2
#define DID_SELECT_WINE_NOTIFICATION_NAME @"newWineSelected"
#define WINE_KEY @"WINE_KEY"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_WINE_KEY @"lastWineSelected"

@class WineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>
-(void)wineryTableViewController:(WineryTableViewController*)wineryVC
                 didSelectedWine:(WineModel*)aWineModel;
@end

@interface WineryTableViewController : UITableViewController <WineryTableViewControllerDelegate>

@property (strong, nonatomic) WineryModel* wineryModel;
@property (weak, nonatomic) id <WineryTableViewControllerDelegate> delegate;

-(id) initWithModel: (WineryModel *) aWineryModel
         tableStyle: (UITableViewStyle) aTableStyle;

-(WineModel *)lastSelectedWine;

@end


