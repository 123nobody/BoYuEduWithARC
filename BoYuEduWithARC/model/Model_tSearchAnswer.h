//
//  Model_tSearchAnswer.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tSearchAnswer : NSObject
{
    int _id;
    
    int _trainid;
    int _questionid;
    int _studentid;
    NSString *_answer;
    NSString *_answer2;
    double _score;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, assign) int trainid;
@property (nonatomic, assign) int questionid;
@property (nonatomic, assign) int studentid;
@property (nonatomic, strong) NSString *answer;
@property (nonatomic, strong) NSString *answer2;
@property (nonatomic, assign) double score;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
