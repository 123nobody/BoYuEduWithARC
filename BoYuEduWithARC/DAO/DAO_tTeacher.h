//
//  DAO_tTeacher.h
//  BoYuEducation
//
//  Created by Wei on 12-11-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BaseDao.h"

@interface DAO_tTeacher : BaseDao

- (NSString *)selectTeacherNameByTeacherId: (NSInteger)teacherId;

@end
