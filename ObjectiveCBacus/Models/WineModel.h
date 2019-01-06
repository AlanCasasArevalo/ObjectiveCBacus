//
//  WineModel.h
//  ObjectiveCBacus
//
//  Created by Alan Casas on 21/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NO_RATING -1

@interface WineModel : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* wineCompanyName;
@property (strong, nonatomic) NSString* type;
@property (strong, nonatomic) NSString* notes;
@property (strong, nonatomic) NSString* origin;
@property (strong, nonatomic) UIImage* winePhoto;
@property (strong, nonatomic) NSString* wineCompanyWeb;
@property (strong, nonatomic) NSArray* grapes;
@property (nonatomic,strong) NSURL* photoURL;
@property (nonatomic) int rating;

// Classes methods
+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
             notes: (NSString *) aNotes
            origin: (NSString *) anOrigin
    wineCompanyWeb: (NSString *) aWineCompanyWeb
            grapes: (NSArray *) aGrapes
            rating: (int) rating
          photoURL:(NSURL*)aPhotoURL;


+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin;

// Designed
-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
             notes: (NSString *) aNotes
            origin: (NSString *) anOrigin
    wineCompanyWeb: (NSString *) aWineCompanyWeb
            grapes: (NSArray *) aGrapes
            rating: (int) rating
         photoURL:(NSURL*)aPhotoURL;

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) awineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin;

-(id)initWithDictionary:(NSDictionary*)aDictionary;

@end
