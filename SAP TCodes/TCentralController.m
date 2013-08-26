//
//  TCentralController.m
//  SAP TCodes
//
//  Created by rulong on 6/1/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import "TCentralController.h"
#import "CategoryViewController.h"
#import "CoolTableViewController.h"
#import "SQLiteTools.h"
#import "AddNewViewController.h"
#import "AdvanceViewController.h"
@interface TCentralController ()

@end

@implementation TCentralController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIScreen mainScreen] bounds].size.height == 568)
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"idxbg-568h@2x.png"]];

    }
    else
    {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"idxbg.png"]];

    }
    
    
   
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onActionBrow:(id)sender {
  //  BrowseTableViewController *btcontroller = [[BrowseTableViewController alloc]init];
    CategoryViewController *catController = [[CategoryViewController alloc]init];
    
    [self.navigationController pushViewController:catController animated:YES];

    NSLog(@"BrowClick");
}

- (IBAction)onActionSearch:(id)sender {
    NSLog(@"SearchClick");
    AdvanceViewController *searchController = [[AdvanceViewController alloc]init];
    searchController.ntitle = @"Advance Search";
    [self.navigationController pushViewController:searchController animated:YES];

}

- (IBAction)onActionFav:(id)sender {
    NSLog(@"FavClick");
    CoolTableViewController *searchController = [[CoolTableViewController alloc]initWithFrame:self.view.frame];
    NSMutableArray *tcodelist = [SQLiteTools queryTcodesByFav];
    searchController.tcodelist = tcodelist;
    searchController.ntitle = @"Favourite Transactions";
    [self.navigationController pushViewController:searchController animated:YES];

}

- (IBAction)onActionAdd:(id)sender {
    NSLog(@"addClick");
    AddNewViewController  *addNewController = [[AddNewViewController alloc]initWithNibName:@"AddNewViewController" bundle:nil];
    [self.navigationController pushViewController:addNewController animated:YES];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

@end
