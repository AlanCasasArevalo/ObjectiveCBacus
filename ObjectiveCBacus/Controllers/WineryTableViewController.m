//
//  WineryTableViewController.m
//  ObjectiveCBacus
//
//  Created by Alan Casas on 27/12/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

#import "WineryTableViewController.h"

@interface WineryTableViewController ()

@end

@implementation WineryTableViewController

-(id) initWithModel: (WineryModel *) aWineryModel
         tableStyle: (UITableViewStyle) aTableStyle{
    
    self = [super initWithStyle:aTableStyle];
    
    if (self) {
        _wineryModel = aWineryModel;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    
    if (cell == nil) {
        UITableViewCell* wineryCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                                            reuseIdentifier:CELL_REUSE_IDENTIFIER];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
