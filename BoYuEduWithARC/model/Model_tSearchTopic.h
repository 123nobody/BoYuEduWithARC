//
//  Model_tSearchTopic.h
//  BoYuEducation
//
//  Created by Wei on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model_tSearchTopic : NSObject
{
    int _id;
    
    int _type;
    int _type2;
    NSString *_searchName;
    int _state;
    
    NSString *_modifyTime;
    int _isDelete;
}

@property (nonatomic, assign) int _id;

@property (nonatomic, assign) int type;
@property (nonatomic, assign) int type2;
@property (nonatomic, strong) NSString *searchName;
@property (nonatomic, assign) int state;

@property (nonatomic, strong) NSString *modifyTime;
@property (nonatomic, assign) int isDelete;

@end
