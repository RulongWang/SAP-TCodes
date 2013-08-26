//
//  AddNewViewController.m
//  SAP TCodes
//
//  Created by rulong on 6/4/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import "AddNewViewController.h"
#import "ZTcode.h"
#import "SQLiteTools.h"
#import "MBAlertView.h"
#import "MBHUDView.h"
@interface AddNewViewController ()

@end

@implementation AddNewViewController
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
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"style:UIBarButtonItemStyleDone target:self action:@selector(saveTcode)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onActionSave:(id)sender {
    [self saveTcode];

}

- (IBAction)dissmissEditing:(id)sender {
    [self.tcodeDescTextView endEditing:YES];
    [self.categoryText endEditing:YES];

    [self.tcodeText endEditing:YES];
}

- (void)saveTcode{
    ZTcode *ztode = [[ZTcode alloc]init];
    ztode.tcode = self.tcodeText.text;
    ztode.desc = self.tcodeDescTextView.text;
    ztode.module = self.categoryText.text;
    
    BOOL  flag = [SQLiteTools addNewTcode:ztode];
    if (flag) {
        
        
        
        //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Saved"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //  MBAlertView *alert = [MBAlertView a
        //[alert addButtonWithText:@"Saved" type:MBAlertViewItemTypeDestructive block:^{}];
        [MBHUDView hudWithBody:@"Saving..." type:MBAlertViewHUDTypeActivityIndicator hidesAfter:2.0 show:YES];
    }
}

@end
