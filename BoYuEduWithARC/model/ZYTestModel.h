//
//  ZYTestModel.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYTestModel : NSObject
{
    int _id;
    NSString *_name;
    NSString *_value;
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;


@end
