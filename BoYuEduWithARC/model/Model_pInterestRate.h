//
//  Model_pInterestRate.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_pInterestRate : NSObject
{
    int _id;
    
    NSString *_type;
    NSString *_infoDate;
    NSString *_subType;
    NSString *_days;
    NSString *_value;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *infoDate;
@property (nonatomic, strong) NSString *subType;
@property (nonatomic, strong) NSString *days;
@property (nonatomic, strong) NSString *value;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
