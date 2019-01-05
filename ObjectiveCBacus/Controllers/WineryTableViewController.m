//
//  WineryTableViewController.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineryTableViewController.h"
#import "WineViewController.h"

@interface WineryTableViewController ()

@end

@implementation WineryTableViewController

-(id) initWithModel: (WineryModel *) aWineryModel
         tableStyle: (UITableViewStyle) aTableStyle{
    
    self = [super initWithStyle:aTableStyle];
    
    if (self) {
        _wineryModel = aWineryModel;
        self.title = @"Baccus";
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case RED_WINE_SECTION:
            return self.wineryModel.redWineCount;
            break;
            
        case WHITE_WINE_SECTION:
            return self.wineryModel.whiteWineCount;
            break;
            
        case OTHER_WINE_SECTION:
            return self.wineryModel.otherWineCount;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        UITableViewCell* wineryCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                                            reuseIdentifier:CellIdentifier];
    }
    
    WineModel* wineModel = nil;
    
    switch (indexPath.section) {
        case RED_WINE_SECTION:
            wineModel = [self.wineryModel redWineAtIndex:indexPath.row];
            break;
        case WHITE_WINE_SECTION:
            wineModel = [self.wineryModel whiteWineAtIndex:indexPath.row];
            break;
        case OTHER_WINE_SECTION:
            wineModel = [self.wineryModel otherWineAtIndex:indexPath.row];
            break;

        default:
            wineModel = [self.wineryModel redWineAtIndex:indexPath.row];
            break;
    }
    
    cell.imageView.image = wineModel.photo;
    cell.textLabel.text = wineModel.name;
    cell.detailTextLabel.text = wineModel.wineCompanyName;
           
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case RED_WINE_SECTION:
            return @"Red wines";
            break;
        case WHITE_WINE_SECTION:
            return @"White wines";
            break;
        case OTHER_WINE_SECTION:
            return @"Other wines";
            break;
            
        default:
            return @"Red wines";
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Suponemos que estamos en un navigation controller
    
    //Averiguamos el vino
    WineModel* wineModel = nil;
    switch (indexPath.section) {
        case RED_WINE_SECTION:
            wineModel = [self.wineryModel redWineAtIndex:indexPath.row];
            break;
            
        case WHITE_WINE_SECTION:
            wineModel = [self.wineryModel whiteWineAtIndex:indexPath.row];
            break;
            
        case OTHER_WINE_SECTION:
            wineModel = [self.wineryModel otherWineAtIndex:indexPath.row];
            break;
    }
    
    [self.delegate wineryTableViewController:self didSelectedWine:wineModel];
    
    NSDictionary* wineDictionary = [[NSDictionary alloc]init];
    
    wineDictionary = @{WINE_KEY: wineModel};
    
    NSNotification* notification = [NSNotification notificationWithName:DID_SELECT_WINE_NOTIFICATION_NAME
                                                                     object:self
                                                                   userInfo:wineDictionary];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    [self saveLastSelectedWineAtIndexSection:indexPath.section row:indexPath.row];
    
}

-(void) wineryTableViewController: (WineryTableViewController*) wineryVC
                  didSelectedWine:(WineModel*) aWineModel{
    
    WineViewController* wineVC = [[WineViewController alloc] initWithModel:aWineModel];
    
    [self.navigationController pushViewController:wineVC animated:YES];
}

-(void)saveLastSelectedWineAtIndexSection:(NSUInteger)section row:(NSUInteger)row{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:@{SECTION_KEY : @(section),
                          ROW_KEY     : @(row)}
                 forKey:LAST_WINE_KEY];
    
    [defaults synchronize];
    
}

-(WineModel*)lastSelectedWine{
    
    NSIndexPath* index = nil;
    
    NSDictionary* coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults]objectForKey:LAST_WINE_KEY];
    
    if (coords == nil){
        coords = [self setDefaults];
    }
    
    index = [NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY]integerValue]
                               inSection:[[coords objectForKey:SECTION_KEY]integerValue]];
    
    return [self wineForIndexPath:index];
}

-(NSDictionary*) setDefaults{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    //Con la sintaxis @Int hacemos que el numero se quede empaquetado en un nsnumber
    NSDictionary* defaultWineCoordinates = @{SECTION_KEY: @(RED_WINE_SECTION),
                                             ROW_KEY:@0};
    
    [defaults setObject:defaultWineCoordinates
                 forKey:LAST_WINE_KEY];
    
    [defaults synchronize];
    
    return defaultWineCoordinates;
}

-(WineModel*)wineForIndexPath:(NSIndexPath*)indexPath{
    
    WineModel* wineIndex = nil;
    
    switch (indexPath.section) {
        case RED_WINE_SECTION:
            wineIndex = [self.wineryModel redWineAtIndex:indexPath.row];
            break;
            
        case WHITE_WINE_SECTION:
            wineIndex = [self.wineryModel whiteWineAtIndex:indexPath.row];
            break;
            
        case OTHER_WINE_SECTION:
            wineIndex = [self.wineryModel otherWineAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    return wineIndex;
    
}

@end




































