//
//  DAO_tAttch.h
//  BoYuEducation
//
//  Created by Wei on 12-11-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BaseDao.h"

@interface DAO_tAttch : BaseDao

- (NSMutableArray *)selectFileNameArrayByLessonId: (NSInteger)lessonId;

@end
