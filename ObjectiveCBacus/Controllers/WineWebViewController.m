//
//  WineWebViewController.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 24/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineWebViewController.h"

@interface WineWebViewController ()

@end

@implementation WineWebViewController

-(id) initWithModel: (WineModel*) aModel{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _wineModel = aModel;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayWineWeb: self.wineModel.wineCompanyWeb];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)displayWineWeb: (NSURL *) anUrl{

    self.wineBrowser.delegate = self;
    
    NSURLRequest* wineRequest = [NSURLRequest requestWithURL: anUrl];
    [self startActivityIndicator];
    [self.wineBrowser loadRequest:wineRequest];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self stopActivityIndicator];
}

-(void) startActivityIndicator {
    [[self activityIndicator]setHidden:false];
    [[self activityIndicator] startAnimating];
}

-(void) stopActivityIndicator {
    [[self activityIndicator]setHidden: true];
    [[self activityIndicator] stopAnimating];
}

@end
































