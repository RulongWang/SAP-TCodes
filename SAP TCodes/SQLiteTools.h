//
//  SQLiteTools.h
//  SAP TCodes
//
//  Created by rulong on 6/2/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZTcode.h"
@interface SQLiteTools : NSObject


//Query API
+ (NSMutableArray *) queryModules;
+ (NSMutableArray *)queryTcodesAll;
+ (NSMutableArray *)queryTcodesByModule:(NSString *)module;
+ (NSMutableArray *)queryTcodesByDesc:(NSString *)desc;// Search by keyword in descritpion
+ (NSMutableArray *)queryTcodesByFav;
+ (NSMutableArray *)queryTcodesByDescAndModule:(NSString *)desc  withModule:(NSString *)module;
+ (NSMutableArray *)queryTcodesByTcodeAndModule:(NSString *)desc  withModule:(NSString *)module;
+ (NSMutableArray *)queryTcodesByTcodeAndDesc:(NSString *)tcode  withModule:(NSString *)desc;

//Update API

+ (BOOL)updateFavourite:(ZTcode*)ztcode;//update Ztode with fav field
+ (BOOL)deleteFavourite:(ZTcode*)ztcode;//update Ztode with fav field

+ (BOOL)addNewTcode:(ZTcode *)ztcode;


@end
