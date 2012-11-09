//
//  ZYViewController.h
//  BoYuEducation
//
//  Created by Wei on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ZYMenuView.h"
#import "ZYCenterView.h"
#import "ZYAppView.h"
#import "ZYGridView.h"
//#import "ZYRightView.h"
#import "ZYRightViewController.h"
#import "ZYSettingViewController.h"
#import "ZYLessonCell.h"
#import "ZYLessonView.h"

@interface ZYViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ZYGridViewDelegate, ZYMenuViewDelegate, ZYCenterViewDelegate, ZYRightViewControllerDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate> 
{
    NSArray *_cellContents;
    
    ZYMenuView *_menuView;
    ZYCenterView *_centerView;
    UIView *_backView;
    ZYGridView *_gridView;
    ZYRightViewController *_rightViewController;
    UIView *_backgroundMaskView;
    
    
    CGPoint _beginPoint;
    
    NSMutableArray *_cellTabViews;
    
    NSInteger _skinId;
    //模态背景蒙板
    UIView *_maskView;
    
    NSUserDefaults *_userDefaults;
    
    
}

//@property(nonatomic, strong) NSArray *cellContents;
//@property(nonatomic, strong) NSMutableArray *cellTabViews;
//@property(nonatomic, strong) UIView *backView;
//@property(nonatomic, strong) UIView *gridView;
@property (nonatomic,strong) ZYRightViewController *rightViewController;
@end
