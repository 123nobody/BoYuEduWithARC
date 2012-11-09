//
//  Model_tSearchOption.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tSearchOption : NSObject
{
    int _id;
    
    int _questionid;
    NSString *_sort;
    NSString *_optiondesc;
    double _score;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, assign) int questionid;
@property (nonatomic, strong) NSString *sort;
@property (nonatomic, strong) NSString *optiondesc;
@property (nonatomic, assign) double score;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
