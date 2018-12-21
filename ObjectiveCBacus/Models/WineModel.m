//
//  WineModel.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 21/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineModel.h"

@implementation WineModel

#pragma mark - Init

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
             notes: (NSString *) aNotes
            origin: (NSString *) anOrigin
             photo: (UIImage *) aPhoto
    wineCompanyWeb: (NSURL *) aWineCompanyWeb
            grapes: (NSArray *) aGrapes
            rating: (int) rating {
    
    if (self = [super init]) {
        _name = aName;
        _wineCompanyName = awineCompanyName;
        _type = aType;
        _notes = aNotes;
        _origin = anOrigin;
        _photo = aPhoto;
        _wineCompanyWeb = aWineCompanyWeb;
        _grapes = aGrapes;
        _rating = rating;
    }
    return self;
}

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin {
    
    return [self initWithName:aName
              wineCompanyName:awineCompanyName
                         type:aType
                        notes:nil
                       origin:anOrigin
                        photo:nil
               wineCompanyWeb:nil
                       grapes:nil
                       rating:NO_RATING];
    
}

@end
