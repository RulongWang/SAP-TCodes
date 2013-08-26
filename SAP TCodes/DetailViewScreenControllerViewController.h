//
//  DetailViewScreenControllerViewController.h
//  SAP TCodes
//
//  Created by rulong on 6/4/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTcode.h"
@interface DetailViewScreenControllerViewController : UIViewController
{
    ZTcode *tcode;
}
@property (strong, nonatomic) IBOutlet UITextField *tcodeText;
@property (strong, nonatomic) IBOutlet UITextView *descTextView;
@property (strong, nonatomic) IBOutlet UITextField *tcodeModule;
@property (strong, nonatomic) IBOutlet UIButton *favButton;
@property (strong, nonatomic) ZTcode *tcode;
- (IBAction)onActionFav:(id)sender;

@end
