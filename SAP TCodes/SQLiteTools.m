//
//  SQLiteTools.m
//  SAP TCodes
//
//  Created by rulong on 6/2/13.
//  Copyright (c) 2013 rulong.org. All rights reserved.
//
#define dbname @"Tcode.db"
#import "SQLiteTools.h"
#import <sqlite3.h>
#import "ZTcode.h"
@implementation SQLiteTools





+ (NSMutableArray *)queryTcodesAll{
    NSMutableArray *tcodelistall = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    
    NSString *query = @"select * from tcodes";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *czfav = (char*)sqlite3_column_text(statment, 0);
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            if (czfav != NULL) {
                ztcode.fav = [[NSString alloc]initWithUTF8String:czfav];
            }
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            [tcodelistall addObject:ztcode];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return tcodelistall;
}

//return Tcodes by Module
+(NSMutableArray *)queryTcodesByModule:(NSString *)module{
    NSMutableArray *tcodelistall = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSString *query =[[NSString alloc]initWithFormat:@"select * from tcodes where module like %@%@%@;",@"'",module,@"'"];
    
  //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *czfav = (char*)sqlite3_column_text(statment, 0);
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            if (czfav != NULL) {
                ztcode.fav = [[NSString alloc]initWithUTF8String:czfav];
            }
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            
            [tcodelistall addObject:ztcode];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return tcodelistall;
}



+ (NSString *)dataFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:dbname];
}




+(NSMutableArray *) queryModules{
    NSMutableArray *modulelist = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    
    NSString *query = @"select distinct module from tcodes order by module asc";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *cmodule = (char*)sqlite3_column_text(statment, 0);
            [modulelist addObject:[[NSString alloc]initWithUTF8String:cmodule]];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return modulelist;
}

+ (NSMutableArray *)queryTcodesByDesc:(NSString *)desc{
    NSMutableArray *tcodelistall = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSString *query =[[NSString alloc]initWithFormat:@"select * from tcodes where desc like %@%@%@;",@"'%",desc,@"%'"];
    
    //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *czfav = (char*)sqlite3_column_text(statment, 0);
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            if (czfav != NULL) {
                ztcode.fav = [[NSString alloc]initWithUTF8String:czfav];
            }
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            
            [tcodelistall addObject:ztcode];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return tcodelistall;
}

+ (NSMutableArray *)queryTcodesByDescAndModule:(NSString *)desc  withModule:(NSString *)module{
    NSMutableArray *tcodelistall = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSString *query =[[NSString alloc]initWithFormat:@"select * from tcodes where desc like %@%@%@ and module like '%@%@%@';",@"'%",desc,@"%'",@"%",module,@"%"];
    
    //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *czfav = (char*)sqlite3_column_text(statment, 0);
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            if (czfav != NULL) {
                ztcode.fav = [[NSString alloc]initWithUTF8String:czfav];
            }
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            
            [tcodelistall addObject:ztcode];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return tcodelistall;
}
+ (NSMutableArray *)queryTcodesByTcodeAndModule:(NSString *)tcode  withModule:(NSString *)module{
    NSMutableArray *tcodelistall = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSString *query =[[NSString alloc]initWithFormat:@"select * from tcodes where tcode like %@%@%@ and module like '%@%@%@';",@"'",tcode,@"%'",@"%",module,@"%"];
    
    //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *czfav = (char*)sqlite3_column_text(statment, 0);
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            if (czfav != NULL) {
                ztcode.fav = [[NSString alloc]initWithUTF8String:czfav];
            }
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            
            [tcodelistall addObject:ztcode];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return tcodelistall;

}

+ (NSMutableArray *)queryTcodesByTcodeAndDesc:(NSString *)tcode  withModule:(NSString *)desc{
    NSMutableArray *tcodelistall = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSString *query =[[NSString alloc]initWithFormat:@"select * from tcodes where tcode like %@%@%@ and desc like '%@%@%@';",@"'",tcode,@"%'",@"%",desc,@"%"];
    
    //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *czfav = (char*)sqlite3_column_text(statment, 0);
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            if (czfav != NULL) {
                ztcode.fav = [[NSString alloc]initWithUTF8String:czfav];
            }
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            
            [tcodelistall addObject:ztcode];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return tcodelistall;
    
}

//Query by fav
+ (NSMutableArray *)queryTcodesByFav{
    NSMutableArray *tcodelistall = [[NSMutableArray alloc]init];
    sqlite3 *database;
    NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSString *query =[[NSString alloc]initWithFormat:@"select * from tcodes where fav like '%@yes%@'",@"%",@"%"];
    
    //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",query);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        NSLog(@"number of sqlite3_step is %i",sqlite3_step(statment));
        while (sqlite3_step(statment) == SQLITE_ROW) {
            char *czfav = (char*)sqlite3_column_text(statment, 0);
            char *cztcode = (char*)sqlite3_column_text(statment, 1);
            char *cdesc = (char*)sqlite3_column_text(statment, 2);
            char *cmodule = (char*)sqlite3_column_text(statment, 3);
            ZTcode *ztcode = [[ZTcode alloc]init];
            if (czfav != NULL) {
                ztcode.fav = [[NSString alloc]initWithUTF8String:czfav];
            }
            ztcode.tcode = [[NSString alloc]initWithUTF8String:cztcode];
            ztcode.desc = [[NSString alloc]initWithUTF8String:cdesc];
            ztcode.module = [[NSString alloc]initWithUTF8String:cmodule];
            
            [tcodelistall addObject:ztcode];
            
            
        }
        sqlite3_finalize(statment);
    }
    sqlite3_close(database);
    return tcodelistall;
}


#pragma mark -update record with favourite filed yes
+ (BOOL)updateFavourite:(ZTcode *)ztcode{
    BOOL flag = TRUE;
    sqlite3 *database;
 //   NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSMutableString *temp = [[NSMutableString alloc]initWithString:ztcode.tcode];
    
    NSString *newUpdateTcode = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
 //   NSString *update =[[NSString alloc]initWithFormat:@"update tcodes set fav = 'yes' where tcode like '%@%@%@'",@"%",ztcode.tcode,@"%"];
    NSString *update =[[NSString alloc]initWithFormat:@"update tcodes set fav = 'yes' where tcode like '%@%@%@'",@"%",newUpdateTcode,@"%"];
  
    //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",update);
    sqlite3_stmt *statment;
    NSLog(@"display update log %i",sqlite3_prepare_v2(database, [update UTF8String], -1, &statment, nil));
    if (sqlite3_prepare_v2(database, [update UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        if (sqlite3_step(statment)!=SQLITE_DONE) {
            flag = FALSE;
        }
        

    }
        sqlite3_finalize(statment);
    
        sqlite3_close(database);

    return flag;
}

// add new Transaction to table tcodes
+ (BOOL)addNewTcode:(ZTcode *)ztcode{
    BOOL flag = TRUE;
    sqlite3 *database;
    //   NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
 
   const char *insert =[[NSString stringWithFormat:@"insert into tcodes values('%@','%@','%@','%@')",@"yes",ztcode.tcode,ztcode.desc,ztcode.module]UTF8String];
    
    NSString *log = [[NSString alloc]initWithUTF8String:insert];
    NSLog(@"SQL Statement: %@",log) ;
    sqlite3_stmt *statment;
    int i =sqlite3_prepare_v2(database, insert, -1, &statment, nil);
    NSLog(@"log is %i ",i);
    if (sqlite3_prepare_v2(database, insert, -1, &statment, nil) == SQLITE_OK) {
        
    }
    if (sqlite3_step(statment)!=SQLITE_DONE) {
        flag = FALSE;
       // NSAssert(0, @"Insert new tcode failed ");
    }
    sqlite3_finalize(statment);
    
    sqlite3_close(database);
    
    return flag;
}
//update Ztode with fav field

+ (BOOL)deleteFavourite:(ZTcode*)ztcode{
    BOOL flag = TRUE;
    sqlite3 *database;
    //   NSLog(@"dataFilePath is %@",[self dataFilePath]);
    
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Failed to open database");
    }
    NSMutableString *temp = [[NSMutableString alloc]initWithString:ztcode.tcode];
    
    NSString *newUpdateTcode = [temp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //   NSString *update =[[NSString alloc]initWithFormat:@"update tcodes set fav = 'yes' where tcode like '%@%@%@'",@"%",ztcode.tcode,@"%"];
    NSString *update =[[NSString alloc]initWithFormat:@"update tcodes set fav = 'no' where tcode like '%@%@%@'",@"%",newUpdateTcode,@"%"];
    
    //  NSString *query = @"select * from tcodes where module like ";
    NSLog(@"SQL Statement: %@",update);
    sqlite3_stmt *statment;
    
    if (sqlite3_prepare_v2(database, [update UTF8String], -1, &statment, nil) == SQLITE_OK) {
        
        if (sqlite3_step(statment)!=SQLITE_DONE) {
            flag = FALSE;
        }
        
        
    }
    sqlite3_finalize(statment);
    
    sqlite3_close(database);
    
    return flag;

}
@end
