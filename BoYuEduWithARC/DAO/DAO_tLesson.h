//
//  DAO_tLesson.h
//  BoYuEducation
//
//  Created by Wei on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BaseDao.h"

@class Model_tLesson;

@interface DAO_tLesson : BaseDao

- (NSInteger)numberOfLessonsWithTraindayId: (NSInteger)traindayid;
- (NSString *)nameOfLessonsWithIndexPath: (NSIndexPath *)indexPath;

- (Model_tLesson *)selectLessonModelByLessonId: (NSInteger)lessonId;
- (NSMutableArray *)selectLessonModelsByTraindayId: (NSInteger)traindayId;

@end
