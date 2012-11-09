//
//  ZYDataCache.h
//  BoYuEducation
//
//  Created by Wei on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BaseDao.h"


@interface ZYDataCache : BaseDao
{
    NSInteger _trainId;
    
//    NSMutableDictionary *_menu_1_Dic;
    NSMutableDictionary *_menu_1_Titles;
//    NSMutableDictionary *_menu_1_Ids;
    NSMutableArray *_menu_2_Titles;
    NSMutableArray *_menu_2_Ids;
    NSMutableArray *_menu_3_Titles;
    NSMutableArray *_menu_3_Ids;
    NSMutableArray *_menu_4_Titles;
    NSMutableArray *_menu_4_Ids;
}

@property (nonatomic, assign) NSInteger trainId;

//@property (nonatomic, strong) NSMutableDictionary *menu_1_Dic;
@property (nonatomic, strong) NSMutableDictionary *menu_1_Titles;
//@property (nonatomic, strong) NSMutableDictionary *menu_1_Ids;
@property (nonatomic, strong) NSMutableArray *menu_2_Titles;
@property (nonatomic, strong) NSMutableArray *menu_2_Ids;
@property (nonatomic, strong) NSMutableArray *menu_3_Titles;
@property (nonatomic, strong) NSMutableArray *menu_3_Ids;
@property (nonatomic, strong) NSMutableArray *menu_4_Titles;
@property (nonatomic, strong) NSMutableArray *menu_4_Ids;


//- (NSMutableDictionary *)getMenu_1_Dic;
//- (NSMutableArray *)getMenu_2_Array;
//- (NSMutableArray *)getMenu_3_Array;
//- (NSMutableArray *)getMenu_4_Array;

@end
