//
//  CoolTableViewController.m
//  SAP TCodes
//
//  Created by rulong on 6/2/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//
#define dbname @"Tcode.db"
#import "CoolTableViewController.h"
#import "DoubleLineSeparatorCell.h"
#import <sqlite3.h>
#import "ZTcode.h"
#import "SQLiteTools.h"
#import "DetailViewScreenControllerViewController.h"
#import "MBHUDView.h"
@interface CoolTableViewController (){
    }
@end

@implementation CoolTableViewController
@synthesize tcodelist,searchBar,copiedlist,ntitle,nmodule;
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super init]) {
        tcodelist = [[NSMutableArray alloc]init];
          }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // copiedlist = [[NSArray alloc] initWithArray:tcodelist copyItems:YES];
   
    //[self queryModules];
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    [header setBackgroundColor:[UIColor grayColor]];
    
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [tableView setTableHeaderView:header];
    
    //   UIView* footerView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    //   [tableView setTableFooterView:footerView];
    
    self.tableView = tableView;
    
    
    // Add search Bar
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    searchBar.showsSearchResultsButton = YES;
   // searchBar.showsBookmarkButton = YES;
    
//    UILabel *nPrompte = [[UILabel alloc]initWithFrame:CGRectMake(35, 10, 150, 20)];
//    nPrompte.text = @"Keyword in description";
//    nPrompte.font = [UIFont boldSystemFontOfSize:10.0];
//    nPrompte.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
//    [searchBar addSubview:nPrompte];
    
    searchBar.showsCancelButton = YES;
    
    searchBar.delegate = self;
    
    self.tableView.tableHeaderView = searchBar;
    

    
    
    //消除TableView 滑动时上下边的白色延伸区域 
    UIView *topview = [[UIView alloc] initWithFrame:CGRectMake(0,-480,self.view.frame.size.width,480)];
    topview.backgroundColor = [UIColor grayColor];
  //  UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height+20,self.view.frame.size.width,480)];
    topview.backgroundColor = [UIColor grayColor];
  //  bottomview.backgroundColor = [UIColor grayColor];
    [self.tableView addSubview:topview];
   // [self.tableView addSubview:bottomview];
    //End of 延伸区域代码

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.title = ntitle;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    if ([ntitle isEqualToString:@"Favourite Transactions"]) {
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // [self.tableView setContentOffset:CGPointMake(0, 44)];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tcodelist count];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = indexPath.row;
    ZTcode *temp = [[ZTcode alloc]init];
    temp = [self.tcodelist objectAtIndex:row];
    [SQLiteTools deleteFavourite:temp];
    [self.tcodelist removeObjectAtIndex:row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (UITableViewCell *)tableView:(UITableView *)tableViewGO cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
   // DoubleLineSeparatorCell *cell = [tableViewGO dequeueReusableCellWithIdentifier:CellIdentifier];
    DoubleLineSeparatorCell *cell;
    if (cell == nil) {
        cell = [[DoubleLineSeparatorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     
   // NSString *text = [tcodelist objectAtIndex:indexPath.row];
    UIColor *upperLineColor,*lowerLineColor,*viewColor;
    
    upperLineColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    lowerLineColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    viewColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:5];

    
    //[cell.textLabel setText:text];
    //[cell.textLabel setTextColor:[UIColor colorWithRed:170 green:170 blue:170 alpha:0.8]];
     
    [cell.upperLine setBackgroundColor:upperLineColor];
    [cell.lowerLine setBackgroundColor:lowerLineColor];
   
    UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 277, 58)];
    av.backgroundColor = [UIColor clearColor];
    av.opaque = NO;
  //  av.image = [UIImage imageNamed:@"cellbg.png"];
    cell.backgroundView = av;
    cell.opaque = 0.8;
    
    
   // cell.imageView.image = [UIImage imageNamed:@"flagNew.png"];
    UILabel *flag = [[UILabel alloc]initWithFrame:CGRectMake(10, 12.5, 60, 20)];
    flag.backgroundColor = [UIColor clearColor];
    ZTcode *temp = [[ZTcode alloc]init];
    temp = [tcodelist objectAtIndex:indexPath.row];
    flag.text = temp.tcode;
    flag.font = [UIFont boldSystemFontOfSize:12];
    flag.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    flag.shadowColor = [UIColor grayColor];
    [cell.contentView addSubview:flag];
    
    
    UILabel *longDesc = [[UILabel alloc]initWithFrame:CGRectMake(70, 12.5, 260, 20)];
    longDesc.text = temp.desc;
    longDesc.font = [UIFont boldSystemFontOfSize:10];
    longDesc.backgroundColor = [UIColor clearColor];
    longDesc.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    flag.shadowColor = [UIColor grayColor];

    [cell.contentView addSubview:longDesc];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     DetailViewScreenControllerViewController *detailViewController = [[DetailViewScreenControllerViewController alloc] initWithNibName:@"DetailViewScreenControllerViewController" bundle:nil];
     // ...
    detailViewController.tcode = [tcodelist objectAtIndex:indexPath.row];
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}
#pragma mark - searchBar Delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar*)searchBar {
//    NSString *filterString = searchBar.text;
//    // NSArray *temp = [self.copiedlist filteredArrayUsingPredicate:filterPredicate];
//    // tcodelist = [[NSMutableArray alloc]initWithArray:temp];
//    tcodelist = [SQLiteTools queryTcodesByTcodeAndModule:filterString withModule:nmodule];
//    if ([tcodelist count]==0) {
//        [self.tableView reloadData];
////        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"MESSAGE" message:@"NO RESULT FOUND"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////        [alert show];
//        
//    }else{
//        [self.tableView reloadData];
//        
//    }
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];

    [self.tableView setContentOffset:CGPointMake(0, 44) animated:YES];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
    
}// called when text ends editing

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *filterString = searchBar.text;
   // NSArray *temp = [self.copiedlist filteredArrayUsingPredicate:filterPredicate];
   // tcodelist = [[NSMutableArray alloc]initWithArray:temp];
    tcodelist = [SQLiteTools queryTcodesByTcodeAndModule:filterString withModule:nmodule];
    if ([tcodelist count]==0) {
        [self.tableView reloadData];
        [MBHUDView hudWithBody:@"No Data Found..." type:MBAlertViewHUDTypeExclamationMark hidesAfter:2.0 show:YES];
        
    }else{
        [self.tableView reloadData];

    }
    [self.searchBar resignFirstResponder];
}// called when keyboard search button pressed

- (NSString *)dataFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:dbname];
}

#pragma mark - query Modules
-(void) queryModules{
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    
    NSString *query = @"select distinct module from tcodes order by module asc";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            int i = 1;
            char *cmodule = (char*)sqlite3_column_text(statment, 0);
            NSLog(@"Module is %@ at %i",[[NSString alloc]initWithUTF8String:cmodule],i);
            [tcodelist addObject:[[NSString alloc]initWithUTF8String:cmodule]];
            i++;
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    
}


@end
