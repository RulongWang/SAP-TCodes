//
//  DoubleLineSeparatorCell.m
//  SAP TCodes
//
//  Created by rulong on 6/2/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import "DoubleLineSeparatorCell.h"

@implementation DoubleLineSeparatorCell
@synthesize upperLine,lowerLine;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.upperLine = [[UIView alloc] init];
        self.lowerLine = [[UIView alloc] init];
        [self.contentView addSubview:self.upperLine];
        [self.contentView addSubview:self.lowerLine];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.upperLine setFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 1)];
    [self.lowerLine setFrame:CGRectMake(0, self.contentView.frame.size.height - 1, self.frame.size.width, 1)];
}

@end
