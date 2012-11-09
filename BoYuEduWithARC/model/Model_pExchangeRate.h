//
//  Model_pExchangeRate.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_pExchangeRate : NSObject
{
    int _id;
    
    NSString *_cuy;
    NSString *_rateTime;
    double _value1;
    double _value2;
    double _value3;
    double _value4;
    double _value5;
    double _value6;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, strong) NSString *cuy;
@property (nonatomic, strong) NSString *rateTime;
@property (nonatomic, assign) double value1;
@property (nonatomic, assign) double value2;
@property (nonatomic, assign) double value3;
@property (nonatomic, assign) double value4;
@property (nonatomic, assign) double value5;
@property (nonatomic, assign) double value6;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
