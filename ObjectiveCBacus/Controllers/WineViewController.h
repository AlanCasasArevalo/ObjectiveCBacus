//
//  WineViewController.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 21/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"
#import "WineryTableViewController.h"

@interface WineViewController : UIViewController <UISplitViewControllerDelegate, WineryTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* wineCompanyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel* typeLabel;
@property (weak, nonatomic) IBOutlet UILabel* notesLabel;
@property (weak, nonatomic) IBOutlet UILabel* originLabel;
@property (weak, nonatomic) IBOutlet UILabel* grapes;
@property (weak, nonatomic) IBOutlet UIImageView* photoImage;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray* ratingViews;

@property (strong, nonatomic) WineModel* wineModel;

-(id)initWithModel: (WineModel *)aModel;

-(IBAction)displayWineCompanyWeb:(id)sender;

@end
