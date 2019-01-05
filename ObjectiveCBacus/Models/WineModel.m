//
//  WineModel.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 21/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineModel.h"

@implementation WineModel

@synthesize winePhoto = _winePhoto;

-(UIImage*)winePhoto {
    if (_winePhoto == nil){
        _winePhoto = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL]];
    }
    return _winePhoto;
}

#pragma mark - Class Methods
+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
             notes: (NSString *) aNotes
            origin: (NSString *) anOrigin
    wineCompanyWeb: (NSURL *) aWineCompanyWeb
            grapes: (NSArray *) aGrapes
            rating: (int) rating
         photoURL:(NSURL*)aPhotoURL{

    return [[self alloc] initWithName:aName
                      wineCompanyName:awineCompanyName
                                 type:aType
                                notes:aNotes
                               origin:anOrigin
                       wineCompanyWeb:aWineCompanyWeb
                               grapes:aGrapes
                               rating:rating
                             photoURL: aPhotoURL
            ];
}

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin {
    return [[self alloc] initWithName:aName wineCompanyName:awineCompanyName type:aType origin:anOrigin];
}


#pragma mark - Init

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
             notes: (NSString *) aNotes
            origin: (NSString *) anOrigin
    wineCompanyWeb: (NSURL *) aWineCompanyWeb
            grapes: (NSArray *) aGrapes
            rating: (int) rating
          photoURL:(NSURL*)aPhotoURL{
    
    if (self = [super init]) {
        _name = aName;
        _wineCompanyName = awineCompanyName;
        _type = aType;
        _notes = aNotes;
        _origin = anOrigin;
        _wineCompanyWeb = aWineCompanyWeb;
        _grapes = aGrapes;
        _rating = rating;
        _photoURL = aPhotoURL;
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
               wineCompanyWeb:nil
                       grapes:nil
                       rating:NO_RATING
                     photoURL: nil
            ];
    
}

-(id)initWithDictionary:(NSDictionary *)aDictionary{
    
    return [self initWithName:[aDictionary objectForKey:@"name"]
              wineCompanyName:[aDictionary objectForKey:@"wineCompaneName"]
                         type:[aDictionary objectForKey:@"type"]
                        notes:[aDictionary objectForKey:@"notes"]
                       origin:[aDictionary objectForKey:@"origin"]
               wineCompanyWeb:[aDictionary objectForKey:@"wine_web"]
                       grapes:[self extractGrapesFromJSONArray:[aDictionary objectForKey:@"grapes"]]
                       rating:[[aDictionary objectForKey:@"rating"] intValue]
                     photoURL:[NSURL URLWithString:[aDictionary objectForKey:@"picture"]]];
    
}

-(NSDictionary*)proxyForJSON{
    
    return @{@"name" : self.name,
             @"wineCompaneName": self.wineCompanyName,
             @"notes" :self.notes,
             @"origin":self.origin,
             @"type":self.type,
             @"grapes":self.grapes,
             @"wineComanyWeb":self.wineCompanyWeb,
             @"rating":@(self.rating),
             @"picture":[self.photoURL path]};
}


-(NSArray*)extractGrapesFromJSONArray:(NSArray*)JSONArray{
    
    NSMutableArray* grapes = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for (NSDictionary* dictionary in JSONArray){
        
        [grapes addObject:[dictionary objectForKey:@"grape"]];
        
    }
    
    return grapes;
    
}

@end
