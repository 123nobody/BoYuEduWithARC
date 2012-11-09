//
//  ZYCenterView.h
//  BoYuEducation
//
//  Created by Wei on 12-10-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYMenuView.h"
#import "ZYCenterTableView.h"

#import "DAO_tLesson.h"
#import "ZYDataCache.h"

//centerView宽高
#define BY_CENTERVIEW_HEIGHT 748.f
#define BY_CENTERVIEW_WIDTH 450.f
//centerView平移步长
#define BY_CENTERVIEW_MOVE_LENGHT 110.f
//centerView覆盖menuView的长度
#define BY_CENTERVIEW_OVER_LENGHT 117.f
//topView高
#define BY_CENTERVIEW_TOP_HEIGHT 54.f
//bottomView高
#define BY_CENTERVIEW_BOTTOM_HEIGHT 46.f
//阴影宽度
#define BY_CENTERVIEW_SHADOW_WIDTH 7.f

@protocol ZYCenterViewDelegate <NSObject>

- (void)didMoveCenterViewToDirection: (NSString *)direction;
- (void)centerTableView:(ZYCenterTableView *)centerTableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZYCenterView : UIView <UITableViewDelegate, UITableViewDataSource>
{
    id<ZYCenterViewDelegate> _delegate;
    
    UIView *_topView;
    ZYCenterTableView *_tableView;
    UIView *_bottomView;
    //contentView包含了_topView,_tableView,_bottomView
    UIView *_contentView;
    UIView *_leftShadowView;
    UIView *_rightShadowView;
    
    //当前显示内容的菜单index
    NSInteger _currentViewIndex;
    
    //是否锁定位置，用于rightView出现时
    BOOL _isLocked;
    
    CGPoint _beginPoint;
    
    ZYDataCache *_dataCache;
}

@property (nonatomic, strong) id<ZYCenterViewDelegate> delegate;
@property (nonatomic, strong) ZYDataCache *dataCache;

@property (nonatomic, assign) BOOL isLocked;

- (id)initWithMenuCellIndex: (NSInteger)index;
- (void)changeContentViewWithMenuIndex: (NSInteger)index;
- (void)addPanGesture;

@end
