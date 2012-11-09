//
//  Model_tSearchQuestion.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tSearchQuestion : NSObject
{
    int _id;
    
    int _topicid;
    NSString *_question;
    int _type;
    NSString *_answer;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, assign) int topicid;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSString *answer;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
