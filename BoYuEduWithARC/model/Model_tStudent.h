//
//  Model_tStudent.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tStudent : NSObject
{
    int _id;
    
    int _trainid;
    NSString *_studentName;
    NSString *_sex;
    NSString *_unit;
    NSString *_job;
    NSString *_telphone;
    NSString *_email;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, assign) int trainid;
@property (nonatomic, strong) NSString *studentName;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *job;
@property (nonatomic, strong) NSString *telphone;
@property (nonatomic, strong) NSString *email;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
