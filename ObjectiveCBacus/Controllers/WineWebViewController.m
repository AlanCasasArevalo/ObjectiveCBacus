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
    
    self.title = @"Web";
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _wineModel = aModel;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayWineWeb: self.wineModel.wineCompanyWeb];
    
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(wineDidChanged:)
                   name:DID_SELECT_WINE_NOTIFICATION_NAME
                 object:nil];
}

-(void)wineDidChanged: (NSNotification*) notification {
    
    NSDictionary* myWineModelDictionary = [notification userInfo];
    
    WineModel* wineModelUpdated = [myWineModelDictionary objectForKey:WINE_KEY];
    
    self.wineModel = wineModelUpdated;
    
    [self displayWineWeb: self.wineModel.wineCompanyWeb];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)displayWineWeb: (NSString *) anUrlString{

    self.wineBrowser.delegate = self;
    
    NSURL *url = [NSURL URLWithString:anUrlString];
    
    NSURLRequest* wineRequest = [NSURLRequest requestWithURL: url];
    
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
































