//
//  DAO_tTeacher.m
//  BoYuEducation
//
//  Created by Wei on 12-11-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAO_tTeacher.h"

@implementation DAO_tTeacher

- (NSString *)selectTeacherNameByTeacherId: (NSInteger)teacherId
{
    NSString *teacherName = nil;
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT teacherName  FROM t_teacher WHERE ID = %d", teacherId];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"selectTeacherNameByTeacherId is nil!");
    }
    while ([rs next]) {
        teacherName = [rs stringForColumn:@"teacherName"];
    }
    [rs close];
    [self.db close];
    
    return teacherName;
}

@end
