//
//  CategoryViewController.h
//  SAP TCodes
//
//  Created by rulong on 6/1/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <UIKit/UIKit.h>
    
@interface CategoryViewController : UIViewController{
    NSMutableArray *tcodelist;
}
@property(strong,nonatomic) NSMutableArray *tcodelist;
@property (strong, nonatomic) IBOutlet UIButton *hrButton;
@property (strong, nonatomic) IBOutlet UIButton *coButton;
@property (strong, nonatomic) IBOutlet UIButton *fiButton;
@property (strong, nonatomic) IBOutlet UIButton *sdButton;
@property (strong, nonatomic) IBOutlet UIButton *mmButton;
@property (strong, nonatomic) IBOutlet UIButton *ppButton;
@property (strong, nonatomic) IBOutlet UIButton *pmButton;
@property (strong, nonatomic) IBOutlet UIButton *psButton;
@property (strong, nonatomic) IBOutlet UIButton *pyButton;
@property (strong, nonatomic) IBOutlet UIButton *qmButton;
@property (strong, nonatomic) IBOutlet UIButton *wmButton;
@property (strong, nonatomic) IBOutlet UIButton *imButton;
@property (strong, nonatomic) IBOutlet UIButton *bwButton;
@property (strong, nonatomic) IBOutlet UIButton *sysButton;
- (IBAction)onActionHR:(id)sender;
- (IBAction)onActionCO:(id)sender;
- (IBAction)onActionFI:(id)sender;
- (IBAction)onActionSD:(id)sender;
- (IBAction)onActionMM:(id)sender;
- (IBAction)onActionPP:(id)sender;
- (IBAction)onActionPM:(id)sender;
- (IBAction)onActionPS:(id)sender;
- (IBAction)onActionPY:(id)sender;
- (IBAction)onActionQM:(id)sender;
- (IBAction)onActionWM:(id)sender;
- (IBAction)onActionIM:(id)sender;
- (IBAction)onActionBW:(id)sender;
- (IBAction)onActionSYS:(id)sender;




@end
