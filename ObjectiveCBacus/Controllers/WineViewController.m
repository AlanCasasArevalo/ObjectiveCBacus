//
//  WineViewController.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 21/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineViewController.h"

@implementation WineViewController

-(id)initWithModel: (WineModel *)aWineModel{
    
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        _wineModel = aWineModel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
