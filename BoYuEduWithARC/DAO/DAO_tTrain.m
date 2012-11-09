//
//  DAO_tTrain.m
//  BoYuEducation
//
//  Created by Wei on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAO_tTrain.h"
#import "Model_tTrain.h"

@implementation DAO_tTrain

- (Model_tTrain *)selectTrain
{
    Model_tTrain *trainModel = [[Model_tTrain alloc]init];
    
    [self.db open];
    FMResultSet *rs = [self.db executeQuery:@"SELECT * FROM t_train WHERE state = 1"];
    while ([rs next]) {
        trainModel._id = [rs intForColumn:@"ID"];
        trainModel.trainName = [rs stringForColumn:@"trainName"];
        trainModel.startDate = [rs stringForColumn:@"startDate"];
    }
    [rs close];
    [self.db close];
    return trainModel;
}

- (NSInteger)selectTrainId
{
    int trainId;
    [_db open];
    FMResultSet *rs = [_db executeQuery:@"SELECT ID FROM t_train WHERE state = 1"];
    while ([rs next]) {
        trainId = [rs intForColumn:@"ID"];
    }
    [rs close];
    [_db close];
    return trainId;
}

- (NSString *)selectTrainName
{
    NSString *trainName = nil;
    [_db open];
    FMResultSet *rs = [_db executeQuery:@"SELECT trainName FROM t_train WHERE state = 1"];
    //    NSLog(@"count:%d", rs.columnCount);
    while ([rs next]) {
        trainName = [rs stringForColumn:@"trainName"];
    }
    [rs close];
    [_db close];
    return trainName;
}

@end
