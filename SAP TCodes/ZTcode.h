//
//  ZTcode.h
//  SAP TCodes
//
//  Created by rulong on 6/1/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ZTcode : NSObject{
    NSString *fav;
    NSString *tcode;
    NSString *desc;
    NSString *module;
}
@property(nonatomic,strong) NSString *fav;
@property(nonatomic,strong) NSString *tcode;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSString *module;
@end
