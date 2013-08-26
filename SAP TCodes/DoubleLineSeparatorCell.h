//
//  DoubleLineSeparatorCell.h
//  SAP TCodes
//
//  Created by rulong on 6/2/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleLineSeparatorCell : UITableViewCell{
    UIView *upperLine;
    UIView *lowerLine;
}

@property (nonatomic ,retain) UIView *upperLine;
@property (nonatomic ,retain) UIView *lowerLine;

@end
