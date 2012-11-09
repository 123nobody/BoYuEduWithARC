//
//  Model_pFund.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_pFund : NSObject
{
    int _id;
    
    NSString *type;
    NSString *code;
    NSString *name;
    NSString *state;
    NSString *infoDate;
    NSString *value1;
    NSString *value2;
    NSString *value3;
    NSString *value4;
    NSString *value5;
    NSString *value6;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *infoDate;
@property (nonatomic, strong) NSString *value1;
@property (nonatomic, strong) NSString *value2;
@property (nonatomic, strong) NSString *value3;
@property (nonatomic, strong) NSString *value4;
@property (nonatomic, strong) NSString *value5;
@property (nonatomic, strong) NSString *value6;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;


@end
