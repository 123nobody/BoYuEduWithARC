//
//  BaseDao.h
//  BocCustomerMgrTool
//
//  Created by  on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

static const NSTimeInterval oneDaySeconds = 60*60*24;

@interface BaseDao : NSObject {
    FMDatabase *_db;
}

@property (nonatomic, strong) FMDatabase *db;

-(NSString *)setTable:(NSString *)sql;

-(NSMutableDictionary *) copyDicForStore:(NSMutableDictionary *) srcDic desDicKeys:(NSArray *) desDicKeys;
@end
