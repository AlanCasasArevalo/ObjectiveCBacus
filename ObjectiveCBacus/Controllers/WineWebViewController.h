//
//  WineWebViewController.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 24/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"
#import "WineryTableViewController.h"

@interface WineWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) WineModel* wineModel;
@property (weak, nonatomic) IBOutlet UIWebView* wineBrowser;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* activityIndicator;
-(id) initWithModel: (WineModel*) aModel; 

@end
