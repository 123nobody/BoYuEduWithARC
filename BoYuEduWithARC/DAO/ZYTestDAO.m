//
//  ZYTestDAO.m
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYTestDAO.h"
#import "ZYTestModel.h"

@implementation ZYTestDAO

- (NSString *)testing
{
    NSString *s = nil;
    
    ZYTestModel *testModel = nil;
    
    [self.db open];
    FMResultSet *rs = [self.db executeQuery:@"SELECT * FROM T_PARA"];
    
    while ([rs next]) {
        testModel = [[ZYTestModel alloc]init];
        
        testModel._id = [rs intForColumn:@"ID"];
        testModel.name = [rs stringForColumn:@"NAME"];
        testModel.value = [rs stringForColumn:@"VALUE"];
        testModel.modifyTime = [rs stringForColumn:@"MODIFYTIME"];
        testModel.isDelete = [rs intForColumn:@"ISDELETE"];
        
        NSLog(@"name = %@", testModel.name);
        s = testModel.name;
    }
    [rs close];
    [self.db close];
    return s;
}

@end
