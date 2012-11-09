//
//  DAO_tLesson.m
//  BoYuEducation
//
//  Created by Wei on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAO_tLesson.h"
#import "Model_tLesson.h"
#import "DAO_tAttch.h"
#import "DAO_tTeacher.h"
#import "DAO_tTrain.h"
#import "DAO_tTrainday.h"

@implementation DAO_tLesson

- (NSInteger)numberOfLessonsWithTraindayId: (NSInteger)traindayid
{
    DAO_tTrain *trainDAO = [[DAO_tTrain alloc]init];
    int trainid = [trainDAO selectTrainId];
    
    NSString *sql = [NSString stringWithFormat:@"select count(lessonName) as count from t_lesson where trainid = %d and traindayid = %d", trainid, traindayid];
    
    NSInteger count;
    [self.db open];
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"Lesson count is 0!");
    }
    while ([rs next]) {
        count = [rs intForColumn:@"count"];
    }
    [rs close];
    [self.db close];

    return count;
}

- (NSString *)nameOfLessonsWithIndexPath: (NSIndexPath *)indexPath
{
    NSString *name = nil;
    
    DAO_tTrain *trainDAO = [[DAO_tTrain alloc]init];
    int trainid = [trainDAO selectTrainId];
    
    DAO_tTrainday *traindayDAO = [[DAO_tTrainday alloc]init];
    NSArray *traindayIds = [traindayDAO selectDayIds];
    
    NSNumber *number = (NSNumber *)[traindayIds objectAtIndex:indexPath.section];
    int traindayid = [number intValue];
    
     NSString *sql = [NSString stringWithFormat:@"select lessonName from t_lesson where trainid = %d and traindayid = %d", trainid, traindayid];
    
    NSMutableArray *lessonNames = [[NSMutableArray alloc]init];
    
    [self.db open];
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"lessonNames is nil!");
    }
    while ([rs next]) {
        [lessonNames addObject:[rs stringForColumn:@"lessonName"]];
    }
    [rs close];
    [self.db close];
    
    name = [lessonNames objectAtIndex:indexPath.row];
    
    return name;
}

- (Model_tLesson *)selectLessonModelByLessonId:(NSInteger)lessonId
{
    Model_tLesson *lessonModel = [[Model_tLesson alloc]init];
    int teacherId;
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT *  FROM t_lesson WHERE ID = %d", lessonId];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"selectLessonModelByLessonId is nil!");
    }
    
    while ([rs next]) {
        lessonModel._id = [rs intForColumn:@"ID"];
        lessonModel.lessonName = [rs stringForColumn:@"lessonName"];
        lessonModel.lessonTime = [rs stringForColumn:@"lessonTime"];
        lessonModel.content = [rs stringForColumn:@"content"];
        
        teacherId = [rs intForColumn:@"teacherId"];
        DAO_tTeacher *teacherDAO = [[DAO_tTeacher alloc]init];
        lessonModel.teacherName = [teacherDAO selectTeacherNameByTeacherId:teacherId];
        
        DAO_tAttch *attchDAO = [[DAO_tAttch alloc]init];
        lessonModel.fileNameArray = [attchDAO selectFileNameArrayByLessonId:lessonModel._id];
        
        lessonModel.trainid = [rs intForColumn:@"trainid"];
        lessonModel.traindayid = [rs intForColumn:@"traindayid"];
        lessonModel.modifyTime = [rs stringForColumn:@"modifyTime"];
        lessonModel.isDelete = [rs intForColumn:@"isDelete"];
        
    }
    [rs close];
    [self.db close];
    
    return lessonModel;
}

- (NSMutableArray *)selectLessonModelsByTraindayId:(NSInteger)traindayId
{
    NSMutableArray *lessonModelsArray = [[NSMutableArray alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT ID FROM t_lesson WHERE traindayid = %d", traindayId];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"selectLessonModelsByTraindayId is nil!");
    }
    Model_tLesson *lessonModel;
    while ([rs next]) {
        int lessonid = [rs intForColumn:@"ID"];
        lessonModel = [self selectLessonModelByLessonId:lessonid];
        
        [lessonModelsArray addObject:lessonModel];
    }
    [rs close];
    [self.db close];
    
    return lessonModelsArray;
}

@end
