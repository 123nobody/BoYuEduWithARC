//
//  BaseDao.m
//  BocCustomerMgrTool
//
//  Created by  on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BaseDao.h"
#import "ZYAppDelegate.h"


@implementation BaseDao


@synthesize db = _db;

- (id)init{
    if(self = [super init]){
        // 打开的数据库
        
        ZYAppDelegate *appDelegate = (ZYAppDelegate *)[[UIApplication sharedApplication] delegate];
        self.db = appDelegate.boyuDB;
//        _db = [appDelegate.boyuDB retain];
    }
    [self.db open];
    return self;
}

// 子类中实现
-(NSString *)setTable:(NSString *)sql{
    return NULL;
}

-(NSMutableDictionary *) copyDicForStore:(NSMutableDictionary *) srcDic desDicKeys:(NSArray *) desDicKeys{
    
    NSMutableDictionary *desDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    for (NSString *key in desDicKeys) {
        [desDic setValue:[srcDic objectForKey:key] forKey:key];
    }
    
    return desDic;
}
@end
