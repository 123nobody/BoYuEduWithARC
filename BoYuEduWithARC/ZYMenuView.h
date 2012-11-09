//
//  ZYMenuView.h
//  BoYuEducation
//
//  Created by Wei on 12-10-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//菜单table宽高
//#define BY_MENU_HEIGHT 50.f
//#define BY_MENU_WIDTH 315.f
//菜单table cell宽高
#define BY_MENUCELL_HEIGHT 92.f
#define BY_MENUCELL_WIDTH 315.f
//菜单cell平移步长
#define BY_MENUCELL_MOVE_LENGHT 10.f
//菜单table cell tab宽高
#define BY_MENUCELL_TAB_HEIGHT 22.f
#define BY_MENUCELL_TAB_WIDTH 315.f
//menutable 左上边距
#define BY_MENUVIEW_MARGIN_LEFT 0.f
#define BY_MENUVIEW_MARGIN_TOP 70.f
//menutable cell 左上边距
#define BY_MENUCELL_MARGIN_LEFT 10.f
#define BY_MENUCELL_MARGIN_TOP -38.f

@protocol ZYMenuViewDelegate <NSObject>

- (void)didSelectMenuCellAtIndex: (NSInteger)index;
- (void)ZYMenuView: (UIView *)menuView PressSetupButton: (UIButton *)setupButton;

@end

@interface ZYMenuView : UIView
{
    id<ZYMenuViewDelegate> _delegate;
    NSArray *_cells;
    NSArray *_cellArray;
    NSInteger _currentCellIndex;
}

@property (nonatomic, strong) id<ZYMenuViewDelegate> delegate;
@property (nonatomic, assign) NSInteger currentCellIndex;

@end
