//
//  AdvanceViewController.h
//  SAP TCodes
//
//  Created by rulong on 6/8/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvanceViewController : UIViewController{
    NSString *ntitle;
}
@property (strong, nonatomic) IBOutlet UITextField *tcode;
@property (strong, nonatomic) IBOutlet UITextField *desc;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) NSString *ntitle;
- (IBAction)onActionSearch:(id)sender;
- (IBAction)dismissEditing:(id)sender;

@end
