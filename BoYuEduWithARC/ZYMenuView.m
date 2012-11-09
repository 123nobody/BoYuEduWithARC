//
//  ZYMenuView.m
//  BoYuEducation
//
//  Created by Wei on 12-10-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYMenuView.h"

@implementation ZYMenuView

@synthesize delegate = _delegate;
@synthesize currentCellIndex = _currentCellIndex;

- (id)init
{
    _cellArray = [[NSArray alloc]initWithObjects:@"title_1.png", @"title_2.png", @"title_3.png", @"title_4.png", nil];
    _currentCellIndex = 0;
    
    //这种高度为菜单按钮的总高度
//    CGRect frame = CGRectMake(BY_MENUVIEW_MARGIN_LEFT, BY_MENUVIEW_MARGIN_TOP, BY_MENUCELL_WIDTH + BY_MENUCELL_MARGIN_LEFT, (BY_MENUCELL_HEIGHT * _cellArray.count + BY_MENUCELL_MARGIN_TOP * (_cellArray.count - 1)));
    //这种高度为(屏幕高度 - 菜单上边距)
    CGRect frame = CGRectMake(BY_MENUVIEW_MARGIN_LEFT, BY_MENUVIEW_MARGIN_TOP, BY_MENUCELL_WIDTH + BY_MENUCELL_MARGIN_LEFT, (748 - BY_MENUVIEW_MARGIN_TOP));
    
    self = [super initWithFrame:frame];
    if (self) {
        UIControl *cellView;
        for (int i = 0; i < _cellArray.count; i++) {
            CGFloat x, y, width, height;
            x = BY_MENUCELL_MARGIN_LEFT;
            //如果是第一个按钮，默认选中，左移。
            if (i == 0) {
                x -= BY_MENUCELL_MOVE_LENGHT;
            }
            y = (BY_MENUCELL_MARGIN_TOP * i + BY_MENUCELL_HEIGHT * i);
            width = BY_MENUCELL_WIDTH;
            height = BY_MENUCELL_HEIGHT;
            
            cellView = [[UIControl alloc]initWithFrame:CGRectMake(x, y, width, height)];
            cellView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[_cellArray objectAtIndex:i]]];
            cellView.tag = i;
            cellView.exclusiveTouch = YES;
            
            [cellView addTarget:self action:@selector(pressMenuCell:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:cellView];
        }
        
        UIImage *image;
        UIButton *button;
        
        image = [UIImage imageNamed:@"refresh.png"];
        frame = CGRectMake(20, 530, image.size.width, image.size.height);
        button = [[UIButton alloc]initWithFrame:frame];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(pressRefreshButton:) forControlEvents:UIControlEventTouchUpInside];
        button.exclusiveTouch = YES;
        [self addSubview:button];
        
        image = [UIImage imageNamed:@"set-up.png"];
        frame = CGRectMake(20, (530 + 15 + frame.size.height), image.size.width, image.size.height);
        button = [[UIButton alloc]initWithFrame:frame];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(pressSetupButton:) forControlEvents:UIControlEventTouchUpInside];
        button.exclusiveTouch = YES;
        [self addSubview:button];
        
    }
    return self;
}

- (void)pressMenuCell:sender
{
    UIView *view = (UIView *)sender;
    if (view.tag == _currentCellIndex) {
        return;
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    CGRect frame;
    
    frame = view.frame;
    frame.origin.x -= BY_MENUCELL_MOVE_LENGHT;
    [view setFrame:frame];
    
    UIView *currentView = [[self subviews] objectAtIndex:_currentCellIndex];
    frame = currentView.frame;
    frame.origin.x += BY_MENUCELL_MOVE_LENGHT;
    [currentView setFrame:frame];
    
    [UIView commitAnimations];
    
    //切换centerView
    [_delegate didSelectMenuCellAtIndex:view.tag];
    
    _currentCellIndex = view.tag;
}

- (void)pressRefreshButton:sender
{
    NSLog(@"press refreshButton");
}

- (void)pressSetupButton:sender
{
    NSLog(@"press setupButton");
    [_delegate ZYMenuView:self PressSetupButton:(UIButton *)sender];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
