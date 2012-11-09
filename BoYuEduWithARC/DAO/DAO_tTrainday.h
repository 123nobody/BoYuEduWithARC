//
//  DAO_tTrainday.h
//  BoYuEducation
//
//  Created by Wei on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BaseDao.h"

@interface DAO_tTrainday:BaseDao

- (NSMutableArray *)selectDayNames;
- (NSMutableArray *)selectDayIds;
- (NSInteger)count;

@end
