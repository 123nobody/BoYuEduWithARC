//
//  Model_tTrain.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tTrain : NSObject
{
    int _id;
    
    NSString *_trainName;
    NSString *_startDate;
    int _state;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, strong) NSString *trainName;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, assign) int state;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
