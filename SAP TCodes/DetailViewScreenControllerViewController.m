//
//  DetailViewScreenControllerViewController.m
//  SAP TCodes
//
//  Created by rulong on 6/4/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import "DetailViewScreenControllerViewController.h"
#import "SQLiteTools.h"
#import "MBHUDView.h"
@interface DetailViewScreenControllerViewController ()

@end

@implementation DetailViewScreenControllerViewController
@synthesize tcode;
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
    self.tcodeText.text = tcode.tcode;
    self.tcodeText.enabled = NO;
    
    self.tcodeModule.text = tcode.module;
    self.tcodeModule.enabled =NO;
    self.descTextView.text = tcode.desc;
    [self.descTextView setEditable:FALSE];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onActionFav:(id)sender {
    BOOL result = [SQLiteTools updateFavourite:tcode];
    if (result) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Saved"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
    [MBHUDView hudWithBody:@"Saving..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:2.0 show:YES];
    }
    
}
@end
