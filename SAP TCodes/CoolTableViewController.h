//
//  CoolTableViewController.h
//  SAP TCodes
//
//  Created by rulong on 6/2/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolTableViewController : UITableViewController <UISearchBarDelegate>{
    UITableView *tableView;
    NSMutableArray *tcodelist;
    UISearchBar *searchBar;
    NSArray *copiedlist;
    NSString *ntitle;
    NSString *nmodule;

}
@property(strong,nonatomic) NSMutableArray *tcodelist;
@property(strong,nonatomic) NSArray *copiedlist;
@property(strong,nonatomic) NSString *ntitle;
@property(strong,nonatomic) NSString *nmodule;

@property(strong,nonatomic) UISearchBar *searchBar;

- (id)initWithFrame:(CGRect)frame;

@end
