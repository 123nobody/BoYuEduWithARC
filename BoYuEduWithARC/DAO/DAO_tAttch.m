//
//  DAO_tAttch.m
//  BoYuEducation
//
//  Created by Wei on 12-11-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAO_tAttch.h"

@implementation DAO_tAttch

- (NSMutableArray *)selectFileNameArrayByLessonId: (NSInteger)lessonId
{
    NSMutableArray *fileNameArray = [[NSMutableArray alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT attchname  FROM t_attch WHERE lessonid = %d", lessonId];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"selectTeacherNameByTeacherId is nil!");
    }
    while ([rs next]) {
        [fileNameArray addObject:[rs stringForColumn:@"attchname"]];
    }
    [rs close];
    [self.db close];
    
    return fileNameArray;
}

@end
