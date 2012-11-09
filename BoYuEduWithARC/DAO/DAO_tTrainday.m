//
//  DAO_tTrainday.m
//  BoYuEducation
//
//  Created by Wei on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAO_tTrainday.h"
#import "DAO_tTrain.h"

@implementation DAO_tTrainday

- (NSMutableArray *)selectDayIds
{
    DAO_tTrain *trainDAO = [[DAO_tTrain alloc]init];
    int trainId = [trainDAO selectTrainId];
    
    NSMutableArray *idsArray = [[NSMutableArray alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT ID FROM t_trainday WHERE trainid = %d", trainId];
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"IDs is nil!");
    }
    while ([rs next]) {
        [idsArray addObject:[NSNumber numberWithInt:[rs intForColumn:@"ID"]]];
    }
    [rs close];
    [self.db close];
    
    return idsArray;
}

- (NSMutableArray *)selectDayNames
{
    DAO_tTrain *trainDAO = [[DAO_tTrain alloc]init];
    int trainId = [trainDAO selectTrainId];
    
    NSMutableArray *dayNameArray = [[NSMutableArray alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT dayName FROM t_trainday WHERE trainid = %d", trainId];
//    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"dayNames is nil!");
    }
    while ([rs next]) {
        [dayNameArray addObject:[rs stringForColumn:@"dayName"]];
    }
    [rs close];
    [self.db close];
    
    return dayNameArray;
}

- (NSInteger)count
{
    int count;
    
    DAO_tTrain *trainDAO = [[DAO_tTrain alloc]init];
    int trainId = [trainDAO selectTrainId];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"select count(dayName) as count from t_trainday where trainid = %d", trainId];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"trainday count is 0!");
    }
    while ([rs next]) {
        count = [rs intForColumn:@"count"];
    }
    [rs close];
    [self.db close];
    
    return count;
}

@end
