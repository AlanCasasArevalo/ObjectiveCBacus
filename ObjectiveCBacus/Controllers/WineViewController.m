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
    [self syncronizeViewWithModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)displayWineCompanyWeb:(id)sender{
    
    NSLog(@"Go to %@", self.wineModel.wineCompanyWeb);
}

-(void)syncronizeViewWithModel{
    
    self.nameLabel.text = self.wineModel.name;
    self.wineCompanyNameLabel.text = self.wineModel.wineCompanyName;
    self.typeLabel.text = self.wineModel.type;
    self.notesLabel.text = self.wineModel.notes;
    self.originLabel.text = self.wineModel.origin;
    self.grapes.text = [self arrayToString: self.wineModel.grapes];
    self.photoImage.image = self.wineModel.photo;
    [self displayRating: self.wineModel.rating];
    
}

-(NSString *)arrayToString: (NSArray *) anArray{
    NSString* representationGrapes = nil;
    if ([anArray count] == 1) {
        representationGrapes = [@"100% " stringByAppendingString: [anArray lastObject]];
    }else{
        representationGrapes = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    
    return representationGrapes;
}

-(void)displayRating: (int) aRating{
    [self clearAllRatingViews];
    
    UIImage* glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i = 0; i < aRating; i++) {
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
    
}

-(void) clearAllRatingViews{
    for (UIImageView* imageView in self.ratingViews) {
        imageView.image = nil;
    }
}

@end




















