//
//  TCentralController.h
//  SAP TCodes
//
//  Created by rulong on 6/1/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCentralController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *browButton;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIButton *favButton;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)onActionBrow:(id)sender;
- (IBAction)onActionSearch:(id)sender;
- (IBAction)onActionFav:(id)sender;
- (IBAction)onActionAdd:(id)sender;

@end
