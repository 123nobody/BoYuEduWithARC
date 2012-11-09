//
//  Model_pForwardExchangeRate.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_pForwardExchangeRate : NSObject
{
    int _id;
    
    NSString *_days;
    NSString *_type;
    NSString *_subType;
    NSString *_rateTime;
    NSString *_cuy1;
    NSString *_cuy2;
    NSString *_cuy3;
    NSString *_cuy4;
    NSString *_cuy5;
    NSString *_cuy6;
    NSString *_cuy7;
    NSString *_cuy8;
    NSString *_cuy9;
    NSString *_cuy10;
    NSString *_cuy11;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, strong) NSString *days;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *subType;
@property (nonatomic, strong) NSString *rateTime;
@property (nonatomic, strong) NSString *cuy1;
@property (nonatomic, strong) NSString *cuy2;
@property (nonatomic, strong) NSString *cuy3;
@property (nonatomic, strong) NSString *cuy4;
@property (nonatomic, strong) NSString *cuy5;
@property (nonatomic, strong) NSString *cuy6;
@property (nonatomic, strong) NSString *cuy7;
@property (nonatomic, strong) NSString *cuy8;
@property (nonatomic, strong) NSString *cuy9;
@property (nonatomic, strong) NSString *cuy10;
@property (nonatomic, strong) NSString *cuy11;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
