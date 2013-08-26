//
//  CategoryViewController.m
//  SAP TCodes
//
//  Created by rulong on 6/1/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//
#define dbname @"Tcode.db"

#import "CategoryViewController.h"
#import <sqlite3.h>
#import "ZTcode.h"
#import "CoolTableViewController.h"
@interface CategoryViewController ()

@end

@implementation CategoryViewController
@synthesize tcodelist;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        tcodelist = [[NSMutableArray alloc]init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([[UIScreen mainScreen] bounds].size.height == 568)
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"idxbg-568h@2x.png"]];
        
    }
    else
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"idxbg.png"]];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onActionHR:(id)sender {
    [self queryTcodesAll:@"'%HR%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]initWithFrame:self.view.frame];
    
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"HR Tcodes";
    btcontroller.nmodule = @"HR";
    [self.navigationController pushViewController:btcontroller animated:YES];
}

- (IBAction)onActionCO:(id)sender{
    [self queryTcodesAll:@"'%CO%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"CO Tcodes";
    btcontroller.nmodule = @"CO";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionFI:(id)sender{
    [self queryTcodesAll:@"'%FI%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"FI Tcodes";
    btcontroller.nmodule = @"FI";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionSD:(id)sender{
    [self queryTcodesAll:@"'%SD%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"SD Tcodes";
    btcontroller.nmodule = @"SD";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionMM:(id)sender{
    [self queryTcodesAll:@"'%MM%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"MM Tcodes";
    btcontroller.nmodule = @"MM";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionPP:(id)sender{
    [self queryTcodesAll:@"'%PP%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"PP Tcodes";
    btcontroller.nmodule = @"PP";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionPM:(id)sender{
    [self queryTcodesAll:@"'%PM%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"PM Tcodes";
    btcontroller.nmodule = @"PM";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionPS:(id)sender{
    [self queryTcodesAll:@"'%PS%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"PS Tcodes";
    btcontroller.nmodule = @"PS";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionPY:(id)sender{
    [self queryTcodesAll:@"'%PY%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"PY Tcodes";
    btcontroller.nmodule = @"PY";

    
    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionQM:(id)sender{
    [self queryTcodesAll:@"'%QM%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"QM Tcodes";
    btcontroller.nmodule = @"QM";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionWM:(id)sender{
    [self queryTcodesAll:@"'%WM%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"WM Tcodes";
    btcontroller.nmodule = @"WM";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionIM:(id)sender{
    [self queryTcodesAll:@"'%IM%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"IM Tcodes";
    btcontroller.nmodule = @"IM";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionBW:(id)sender{
    [self queryTcodesAll:@"'%BW%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"BW Tcodes";
    btcontroller.nmodule = @"BW";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (IBAction)onActionSYS:(id)sender{
    [self queryTcodesAll:@"'%SYS%'"];
    CoolTableViewController *btcontroller = [[CoolTableViewController alloc]init];
    NSLog(@"Passing Tcodelist to  BrowTableView with size of %i",[tcodelist count]);
    btcontroller.tcodelist = tcodelist;
    btcontroller.ntitle = @"SYS Tcodes";
    btcontroller.nmodule = @"SYS";

    [self.navigationController pushViewController:btcontroller animated:YES];
}
- (NSString *)dataFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:dbname];
}

-(void) queryTcodesAll:(NSString *)queryByModule{
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    
    NSString *query =[[NSString alloc]initWithFormat:@"select * from tcodes where module like %@;",queryByModule];
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        if ([tcodelist count]>0) {
            [tcodelist removeAllObjects];
        }
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            [tcodelist addObject:ztcode];
            
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    
}


@end
