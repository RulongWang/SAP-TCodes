//
//  AdvanceViewController.m
//  SAP TCodes
//
//  Created by rulong on 6/8/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import "AdvanceViewController.h"
#import "SQLiteTools.h"
#import "CoolTableViewController.h"
@interface AdvanceViewController ()

@end

@implementation AdvanceViewController
@synthesize ntitle;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onActionSearch:(id)sender {
    
    NSMutableArray *tcodelist = [SQLiteTools queryTcodesByTcodeAndDesc:self.tcode.text withModule:self.desc.text];
    CoolTableViewController *searchController = [[CoolTableViewController alloc]initWithFrame:self.view.frame];
    searchController.ntitle = @"Advance Search";
    searchController.tcodelist = tcodelist;
    searchController.nmodule =@"";
    [self.navigationController pushViewController:searchController animated:YES];

}

- (IBAction)dismissEditing:(id)sender {
    [self.tcode endEditing:YES];
    [self.desc endEditing:YES];
}
@end
