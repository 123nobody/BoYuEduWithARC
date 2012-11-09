//
//  Model_tDic.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tDic : NSObject
{
    int _id;
    
    NSString *_dicName;
    int _sort;
    NSString *_type;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, strong) NSString *dicName;
@property (nonatomic, assign) int sort;
@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
