//
//  Model_tAttch.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tAttch : NSObject
{
    int _id;
    
    int lessonid;
    NSString *attchname;
    NSString *attchurl;
    int attchsize;
    int attchtype;
    NSString *realfilename;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, assign) int lessonid;
@property (nonatomic, strong) NSString *attchname;
@property (nonatomic, strong) NSString *attchurl;
@property (nonatomic, assign) int attchsize;
@property (nonatomic, assign) int attchtype;
@property (nonatomic, strong) NSString *realfilename;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
