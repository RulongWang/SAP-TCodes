//
//  AddNewViewController.h
//  SAP TCodes
//
//  Created by rulong on 6/4/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewViewController : UIViewController<UITextViewDelegate>{
}
@property (strong, nonatomic) IBOutlet UITextField *tcodeText;
@property (strong, nonatomic) IBOutlet UITextField *categoryText;
@property (strong, nonatomic) IBOutlet UITextView *tcodeDescTextView;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property(strong,nonatomic) NSMutableArray *pickerData;
- (IBAction)onActionSave:(id)sender;
- (IBAction)dissmissEditing:(id)sender;

@end
