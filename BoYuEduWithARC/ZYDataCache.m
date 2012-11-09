//
//  ZYDataCache.m
//  BoYuEducation
//
//  Created by Wei on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYDataCache.h"
#import "DAO_tTrain.h"

@implementation ZYDataCache

@synthesize trainId = _trainId;

//@synthesize menu_1_Dic = _menu_1_Dic;
@synthesize menu_1_Titles = _menu_1_Titles;
//@synthesize menu_1_Ids = _menu_1_Ids;
@synthesize menu_2_Titles = _menu_2_Titles;
@synthesize menu_2_Ids = _menu_2_Ids;
@synthesize menu_3_Titles = _menu_3_Titles;
@synthesize menu_3_Ids = _menu_3_Ids;
@synthesize menu_4_Titles = _menu_4_Titles;
@synthesize menu_4_Ids = _menu_4_Ids;

- (id)init
{
    self = [super init];
    if (self) {
//        _menu_1_Dic = [[NSMutableDictionary alloc]init];
//        _menu_2_Array = [[NSMutableArray alloc]init];
//        _menu_3_Array = [[NSMutableArray alloc]init];
//        _menu_4_Array = [[NSMutableArray alloc]init];
        
        //取得培训id
        DAO_tTrain *trainDAO = [[DAO_tTrain alloc]init];
        self.trainId = [trainDAO selectTrainId];
        
//        self.menu_1_Dic = [self getMenu_1_Dic];
        [self initMenu_1_TitlesAndIds];
        [self initMenu_2_TitlesAndIds];
        [self initMenu_3_TitlesAndIds];
        [self initMenu_4_TitlesAndIds];
    }
    
    return self;
}

- (void)initMenu_1_TitlesAndIds
{
//    NSMutableDictionary *dic = [[[NSMutableDictionary alloc]init]autorelease];
    
//    //取得培训id
//    DAO_tTrain *trainDAO = [[DAO_tTrain alloc]init];
//    int trainId = [trainDAO selectTrainId];
//    [trainDAO release];
    
    _menu_1_Titles = [[NSMutableDictionary alloc]init];
//    _menu_1_Ids = [[NSMutableDictionary alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT d.id, l.lessonName FROM t_trainday d left outer join t_lesson l ON d.id = l.traindayid WHERE d.trainid = %d ORDER BY d.id,l.id", self.trainId];
    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"getMenu_1_Dic is nil!");
    }
    NSString *key = nil;
    NSString *title = nil;
    NSMutableArray *titleArray;
    while ([rs next]) {
        key = [NSString stringWithFormat:@"%d", [rs intForColumn:@"ID"]];
        if ([_menu_1_Titles objectForKey:key]) {
            titleArray = [_menu_1_Titles objectForKey:key];
            title = [rs stringForColumn:@"lessonName"];
            [titleArray addObject:title];
        } else {
            title = [rs stringForColumn:@"lessonName"];
            titleArray = [[NSMutableArray alloc]initWithObjects:title, nil];
            [_menu_1_Titles setObject:titleArray forKey:key];
        }
    }
    [rs close];
    [self.db close];
}

- (void)initMenu_2_TitlesAndIds
{
    _menu_2_Titles = [[NSMutableArray alloc]init];
    _menu_2_Ids = [[NSMutableArray alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT ID, searchName FROM t_search_topic WHERE state = 1 AND type = 1"];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"getMenu_2_Array is nil!");
    }
    NSLog(@"rs.columnCount = %d", rs.columnCount);
    
    NSNumber *id_;
    NSString *title = nil;
    
    while ([rs next]) {
        title = [rs stringForColumn:@"searchName"];
        [_menu_2_Titles addObject:title];
        id_ = [NSNumber numberWithInt:[rs intForColumn:@"ID"]];
        [_menu_2_Ids addObject:id_];
    }
    [rs close];
    [self.db close];
}

- (void)initMenu_3_TitlesAndIds
{
    _menu_3_Titles = [[NSMutableArray alloc]init];
    _menu_3_Ids = [[NSMutableArray alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT ID, searchName FROM t_search_topic WHERE state = 1 AND type = 2"];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"getMenu_3_Array is nil!");
    }
    NSLog(@"rs.columnCount = %d", rs.columnCount);
    
    NSNumber *id_;
    NSString *title = nil;
    
    while ([rs next]) {
        title = [rs stringForColumn:@"searchName"];
        [_menu_3_Titles addObject:title];
        id_ = [NSNumber numberWithInt:[rs intForColumn:@"ID"]];
        [_menu_3_Ids addObject:id_];
    }
    [rs close];
    [self.db close];
}

- (void)initMenu_4_TitlesAndIds
{
    _menu_4_Titles = [[NSMutableArray alloc]init];
    _menu_4_Ids = [[NSMutableArray alloc]init];
    
    [self.db open];
    NSString *sql = [NSString stringWithFormat:@"SELECT ID, topic FROM t_news"];
    //    NSLog(@"sql = %@", sql);
    FMResultSet *rs = [self.db executeQuery:sql];
    if (rs.columnCount == 0) {
        NSLog(@"getMenu_4_Array is nil!");
    }
    NSLog(@"rs.columnCount = %d", rs.columnCount);
    
    NSNumber *id_;
    NSString *title = nil;
    
    while ([rs next]) {
        title = [rs stringForColumn:@"topic"];
        NSLog(@"title:%@", title);
        [_menu_4_Titles addObject:title];
        id_ = [NSNumber numberWithInt:[rs intForColumn:@"ID"]];
        [_menu_4_Ids addObject:id_];
    }
    [rs close];
    [self.db close];
}

@end
