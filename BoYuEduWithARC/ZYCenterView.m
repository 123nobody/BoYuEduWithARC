//
//  ZYCenterView.m
//  BoYuEducation
//
//  Created by Wei on 12-10-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYCenterView.h"
#import <QuartzCore/QuartzCore.h>
#import "DAO_tTrain.h"
#import "DAO_tTrainday.h"

@implementation ZYCenterView

@synthesize delegate = _delegate;
@synthesize isLocked = _isLocked;
@synthesize dataCache = _dataCache;

- (id)init
{
    _currentViewIndex = 0;
    return [self initWithMenuCellIndex:_currentViewIndex];
}

- (id)initWithMenuCellIndex: (NSInteger)index
{
    CGRect frame = CGRectMake((BY_MENUVIEW_MARGIN_LEFT + BY_MENUCELL_WIDTH - BY_CENTERVIEW_OVER_LENGHT), 0, BY_CENTERVIEW_WIDTH, BY_CENTERVIEW_HEIGHT);
    self = [super initWithFrame:frame];
    
    if (self) {
        //设置圆角
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [UIColor clearColor];
        self.exclusiveTouch = YES;
        
        _currentViewIndex = index;
        _isLocked = NO;
        
        _contentView = [self getContentViewWithMenuCellIndex:_currentViewIndex];
        [self addSubview:_contentView];
        _leftShadowView = [self getLeftShadowView];
        [self addSubview:_leftShadowView];
        _rightShadowView = [self getRightShadowView];
        [self addSubview:_rightShadowView];
        
        self.dataCache = [[ZYDataCache alloc]init];
//        NSMutableDictionary *dic = [dataCache getMenu_1_Dic];
    }
    
    return self;
}

- (UIView *)getTopView
{
    UIView *topView;
    UIImage *image;
    CGRect frame = CGRectMake(0, 0, (BY_CENTERVIEW_WIDTH - BY_CENTERVIEW_SHADOW_WIDTH * 2), BY_CENTERVIEW_TOP_HEIGHT);
    topView = [[UIView alloc]initWithFrame:frame];
    topView.exclusiveTouch = YES;
    image = [UIImage imageNamed:@"background01_top.png"];
    topView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    UIView *view;
    
    image = [UIImage imageNamed:@"course.png"];
    view = [[UIView alloc]initWithFrame:CGRectMake(20, ((BY_CENTERVIEW_TOP_HEIGHT - image.size.height) / 2), image.size.width, image.size.height)];
    view.backgroundColor = [UIColor colorWithPatternImage:image];
    [topView addSubview:view];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 17, 300, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17.f];
    
    switch (_currentViewIndex) {
        case 0:
        {
            DAO_tTrain *trainDao = [[DAO_tTrain alloc]init];
            titleLabel.text = [trainDao selectTrainName];
//            titleLabel.text = @"课程安排";
        }
            break;
            
        case 1:
            titleLabel.text = @"在线调查";
            break;
            
        case 2:
            titleLabel.text = @"在线考试";
            break;
            
        case 3:
            titleLabel.text = @"金融资讯";
            break;
            
        default:
            break;
    }
    
    [topView addSubview:titleLabel];
    
    return topView;
}

- (UIView *)getBottomView
{
    UIView *bottomView;
    CGRect frame = CGRectMake(0, (BY_CENTERVIEW_HEIGHT - BY_CENTERVIEW_BOTTOM_HEIGHT), (BY_CENTERVIEW_WIDTH - BY_CENTERVIEW_SHADOW_WIDTH * 2), BY_CENTERVIEW_BOTTOM_HEIGHT);
    bottomView = [[UIView alloc]initWithFrame:frame];
    bottomView.exclusiveTouch = YES;
    bottomView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01_bottom.png"]];
    
    return bottomView;
}

- (ZYCenterTableView *)getTableView
{
//    UITableView *tableView;
    CGRect frame = CGRectMake(0, BY_CENTERVIEW_TOP_HEIGHT, (BY_CENTERVIEW_WIDTH - BY_CENTERVIEW_SHADOW_WIDTH * 2), (BY_CENTERVIEW_HEIGHT - BY_CENTERVIEW_TOP_HEIGHT - BY_CENTERVIEW_BOTTOM_HEIGHT));
//    tableView = [[[UITableView alloc]initWithFrame:frame]autorelease];
    
    ZYCenterTableView *tableView;
    switch (_currentViewIndex) {
        case 0:
        {
            tableView = [[ZYCenterTableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        }
            break;
            
        case 1:
        {
            tableView = [[ZYCenterTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        }
            break;
            
        case 2:
        {
            tableView = [[ZYCenterTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        }
            break;
            
        case 3:
        {
            tableView = [[ZYCenterTableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        }
            break;
            
        default:
            break;
    }
    
    tableView.delegate = self;
    tableView.dataSource = self;
//    tableView.touchDelegate = self;
    
    UIView *tmpView = [[UIView alloc]init];
    tmpView.backgroundColor = [UIColor whiteColor];
    tableView.backgroundView = tmpView;
    
//    _tableViewController = tableViewController;
//    [tableViewController release];
    
    return tableView;
}

- (UIView *)getContentViewWithMenuCellIndex: (NSInteger)index
{
    UIView *contentView;
    CGRect frame = CGRectMake(BY_CENTERVIEW_SHADOW_WIDTH, 0, (BY_CENTERVIEW_WIDTH - BY_CENTERVIEW_SHADOW_WIDTH * 2), BY_CENTERVIEW_HEIGHT);
    contentView = [[UIView alloc]initWithFrame:frame];
    contentView.backgroundColor = [UIColor whiteColor];
    
    //设置圆角
    contentView.layer.cornerRadius = 6;
    contentView.layer.masksToBounds = YES;
    
    switch (index) {
        case 0:
        {
            _topView = [self getTopView];
            [contentView addSubview:_topView];
            _tableView = [self getTableView];
            [contentView addSubview:_tableView];
            _bottomView = [self getBottomView];
            [contentView addSubview: _bottomView];
        }
            break;
            
        case 1:
        {
            _topView = [self getTopView];
            [contentView addSubview:_topView];
            _tableView = [self getTableView];
            [contentView addSubview:_tableView];
            _bottomView = [self getBottomView];
            [contentView addSubview: _bottomView];
        }
            break;
            
        case 2:
        {
            _topView = [self getTopView];
            [contentView addSubview:_topView];
            _tableView = [self getTableView];
            [contentView addSubview:_tableView];
            _bottomView = [self getBottomView];
            [contentView addSubview: _bottomView];
        }
            break;
            
        default:
            break;
    }
    
    return contentView;
}

- (UIView *)getLeftShadowView
{
    UIView *leftShadowView;
    CGRect frame = CGRectMake(0, 6, BY_CENTERVIEW_SHADOW_WIDTH, (BY_CENTERVIEW_HEIGHT - 6));
    leftShadowView = [[UIView alloc]initWithFrame:frame];
    leftShadowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01_left.png"]];
    
    return leftShadowView;
}

- (UIView *)getRightShadowView
{
    UIView *rightShadowView;
    CGRect frame = CGRectMake((BY_CENTERVIEW_WIDTH - BY_CENTERVIEW_SHADOW_WIDTH), 6, BY_CENTERVIEW_SHADOW_WIDTH, (BY_CENTERVIEW_HEIGHT - 6));
    rightShadowView = [[UIView alloc]initWithFrame:frame];
    rightShadowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01_right.png"]];
    
    return rightShadowView;
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"centerView touch began.");
//    _beginPoint = [[touches anyObject] locationInView:self];
////    if (_beginPoint.x > 0 && _beginPoint.x < self.frame.size.width) {
//        //记录第一个点，以便计算移动距离
//        self.tag = 1;
////    }
//    
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"centerView touch moved.");
////    if (self.tag == 1) {
//        CGPoint pt = [[touches anyObject] locationInView:self];
//        // 计算移动距离，并更新图像的frame
//        CGRect frame = self.frame;
//        frame.origin.x += pt.x - _beginPoint.x;
//        //    frame.origin.y += pt.y - _beginPoint.y;
//        [self setFrame:frame]; 
//        //设置tableView不可滚动、不可选中
//        _tableView.scrollEnabled = NO;
//        _tableView.allowsSelection = NO;
////    }
////    self.tag = 2;
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"centerView touch ended.");
////    if (self.tag == 2) {
//        if (self.frame.origin.x >= 150) {
//            [self moveCenterViewToDirection:@"right"];
////            [_delegate didMoveCenterViewToDirection:@"right"];
//            NSLog(@"doright!!!!!");
//        } else {
//            [self moveCenterViewToDirection:@"left"];
////            [_delegate didMoveCenterViewToDirection:@"left"];
//            NSLog(@"doleft!!!!!");
//        }
//        
//        self.tag = 0;
////    }        
//}

- (void)moveCenterViewToDirection: (NSString *)direction
{
    //当tableView可选的时候，视为点击了cell，不移动它。
//    if (_tableView.allowsSelection && (self.tag != 2)) {
//        return;
//    }
    CGRect frame = self.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    
    if ([direction isEqualToString:@"right"]) {
        frame.origin.x = BY_MENUVIEW_MARGIN_LEFT + BY_MENUCELL_WIDTH - BY_CENTERVIEW_OVER_LENGHT;
        [self setFrame:frame];
        [_delegate didMoveCenterViewToDirection:@"right"];
        NSLog(@"doright!!!!!123123");
    } else {
        frame.origin.x = BY_MENUVIEW_MARGIN_LEFT + BY_MENUCELL_WIDTH - BY_CENTERVIEW_MOVE_LENGHT - BY_CENTERVIEW_OVER_LENGHT;
        [self setFrame:frame];
        [_delegate didMoveCenterViewToDirection:@"left"];
        NSLog(@"doleft!!!!!123123");
    }
    [UIView commitAnimations];
    _tableView.scrollEnabled = YES;
    _tableView.allowsSelection = YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    UIImageView *imageView;
    UILabel *label;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        imageView = [[UIImageView alloc]init];
        imageView.tag = 11;
        [cell addSubview:imageView];
        label = [[UILabel alloc]init];
        label.tag = 22;
        [cell addSubview:label];
    }
    
    //清除cell的背景边框
    UIView *tempView = [[UIView alloc] init];
    [cell setBackgroundView:tempView];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //定义一些要用到的控件
    CGFloat cellHeight;
    CGRect frame;
    UIImage *image;
    imageView = (UIImageView *)[cell viewWithTag:11];
    
    label = (UILabel *)[cell viewWithTag:22];
    label.backgroundColor = [UIColor clearColor];

    
    switch (_currentViewIndex) {
        case 0:
        {
            cellHeight = 40.f;
            //添加cell图片
            image = [UIImage imageNamed:@"icon01.png"];
            imageView.image = image;
            frame = CGRectMake(20, ((cellHeight - image.size.height) / 2), image.size.width, image.size.height);
            [imageView setFrame:frame];
            
            frame = CGRectMake(45, ((cellHeight - 20) / 2), 300, 20);
            [label setFrame:frame];
            
//            DAO_tLesson *lessonDAO = [[DAO_tLesson alloc]init];
//            label.text = [lessonDAO nameOfLessonsWithIndexPath:indexPath];
//            NSLog(@"dd %@",label.text);
//            [lessonDAO release];
            
            NSString *key = [[self.dataCache.menu_1_Titles allKeys] objectAtIndex:indexPath.section];
            NSArray *titles = [self.dataCache.menu_1_Titles objectForKey:key];
            label.text = [titles objectAtIndex:indexPath.row];
            cell.tag = [key intValue];
            
            
//            label.text = @"金融理财概述和CFP制度";
        }
            break;
            
        case 1:
        {
            cellHeight = 100.f;
            //添加cell图片
            image = [UIImage imageNamed:@"在线调查.png"];
            imageView.image = image;
            frame = CGRectMake(20, ((cellHeight - image.size.height) / 2), image.size.width, image.size.height);
            [imageView setFrame:frame];
            
            frame = CGRectMake(100, ((cellHeight - 20) / 2), 300, 20);
            [label setFrame:frame];
            
            label.text = [self.dataCache.menu_2_Titles objectAtIndex:indexPath.row];
            cell.tag = [[self.dataCache.menu_2_Ids objectAtIndex:indexPath.row] intValue];
//            label.text = @"倾向时间价值与财务计算器操作";
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
            
        case 2:
        {
            cellHeight = 100.f;
            //添加cell图片
            image = [UIImage imageNamed:@"在线考试.png"];
            imageView.image = image;
            frame = CGRectMake(20, ((cellHeight - image.size.height) / 2), image.size.width, image.size.height);
            [imageView setFrame:frame];
            
            frame = CGRectMake(100, ((cellHeight - 20) / 2), 300, 20);
            [label setFrame:frame];
            
            label.text = [self.dataCache.menu_3_Titles objectAtIndex:indexPath.row];
            cell.tag = [[self.dataCache.menu_3_Ids objectAtIndex:indexPath.row] intValue];
            
//            label.text = @"居住规划与房间投资";
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
            
        case 3:
        {
            cellHeight = 150.f;
            //添加cell图片
            image = [UIImage imageNamed:@""];
            imageView.image = image;
            frame = CGRectMake(20, ((cellHeight - image.size.height) / 2), image.size.width, image.size.height);
            [imageView setFrame:frame];
            
            UILabel *titleLabel = (UILabel *)[cell viewWithTag:44];
            if (titleLabel == nil) {
                titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 13, 400, 20)];
                titleLabel.tag = 44;
                [cell addSubview:titleLabel];
            }
            
            titleLabel.text = [self.dataCache.menu_4_Titles objectAtIndex:indexPath.row];
            cell.tag = [[self.dataCache.menu_4_Ids objectAtIndex:indexPath.row] intValue];
            
//            titleLabel.text = @"金融资讯";
            
            frame = CGRectMake(100, ((cellHeight - 20) / 2), 300, 20);
            [label setFrame:frame];
            label.text = @"内容内容内容内容123内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内asda容内容内容内容内容内gfgg787容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内4564容内容内容内容";
            label.textColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:14];
            [label setFrame:CGRectMake(15, 40, 400, 90)];
            label.lineBreakMode = UILineBreakModeWordWrap;
            label.numberOfLines = 0;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
            
        default:
            break;
    }
    
    if (_currentViewIndex != 0 && [cell viewWithTag:33] == nil) {
        UIView *shadowView = [[UIView alloc]initWithFrame:CGRectMake(0, (cellHeight - 12), BY_CENTERVIEW_WIDTH, 12)];
        shadowView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01_column2.png"]];
        shadowView.tag = 33;
        [cell addSubview:shadowView];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentViewIndex == 1 || _currentViewIndex == 2) {
        return 100.f;
    } else if (_currentViewIndex == 3) {
        return 150.f;
    }
    return 40.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int num = 2;
    switch (_currentViewIndex) {
        case 0:
        {
            DAO_tLesson *lessonDAO = [[DAO_tLesson alloc]init];
            num = [lessonDAO numberOfLessonsWithTraindayId:(section + 1)];//section从0开始，traindayid从1开始。
        }
            break;
            
        case 1:
        {
            
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    return num;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_currentViewIndex == 0) {
        DAO_tTrainday *traindayDAO = [[DAO_tTrainday alloc]init];
        int count = [traindayDAO count];
        return count;
    }
    return 1;
}

//Section View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_currentViewIndex != 0) {
        return nil;
    }
    
    //!@#!@# 修改培训课程的group header标题
    
    UIView *headerView;
    CGRect frame;
    UILabel *label;
    
    frame = CGRectMake(0, 0, (BY_CENTERVIEW_WIDTH - BY_CENTERVIEW_SHADOW_WIDTH * 2), 40);
    headerView = [[UIView alloc]initWithFrame:frame];
    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01_column.png"]];
    
    frame = CGRectMake(50, 10, 200, 20);
    label = [[UILabel alloc]initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"DATE 2012 10 25";
    [headerView addSubview:label];
    
    frame = CGRectMake(330, 10, 80, 20);
    label = [[UILabel alloc]initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    
    DAO_tTrainday *traindayDAO = [[DAO_tTrainday alloc]init];
    NSArray *dayNames = [traindayDAO selectDayNames];
    label.text = [dayNames objectAtIndex:section];
    
//    label.text = @"第一天";
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_currentViewIndex == 0) {
        return 40.f;
    }
    return 0.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (_currentViewIndex != 0) {
        return [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    UIView *footerView;
    CGRect frame;
    
    frame = CGRectMake(0, 0, (BY_CENTERVIEW_WIDTH - BY_CENTERVIEW_SHADOW_WIDTH * 2), 2);
    footerView = [[UIView alloc]initWithFrame:frame];
    footerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01_column2.png"]];
    
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 12.f;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"will will");
    self.tag = 2;
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"press button section:%d, row:%d", indexPath.section, indexPath.row);
    [self moveCenterViewToDirection:@"left"];
//    [_delegate didMoveCenterViewToDirection:@"left"];
    [_delegate centerTableView:(ZYCenterTableView *)tableView didDeselectRowAtIndexPath:indexPath];

//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)changeContentViewWithMenuIndex:(NSInteger)index
{
    _currentViewIndex = index;
//    [_contentView removeFromSuperview];
//    _contentView = [self getContentViewWithMenuCellIndex:index];
//    [self addSubview:_contentView];
//    return;
    
    //移除view
    [_topView removeFromSuperview];
    [_tableView removeFromSuperview];
//    [_bottomView removeFromSuperview];
    //    
    _topView = [self getTopView];
    _tableView  = [self getTableView];
    
    NSLog(@"changeContentView");
//    CGRect frame;
//    frame = self.frame;
//    frame.origin.x = BY_CENTERVIEW_SHADOW_WIDTH;
//    frame.size.width -= BY_CENTERVIEW_SHADOW_WIDTH * 2;
//    UIView *tmpView = [[UIView alloc]initWithFrame:frame];
//    tmpView.backgroundColor = [UIColor whiteColor];
    
    // 准备动画
    CATransition *animation = [CATransition animation];
    //动画播放持续时间
    [animation setDuration:0.5f];
    //动画速度,何时快、慢
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    /*动画效果
     kCATransitionFade      淡出
     kCATransitionMoveIn    覆盖原图
     kCATransitionPush      推出
     kCATransitionReveal    底部显出来
     */
    [animation setType:kCATransitionFade];
    [self.layer addAnimation:animation forKey:nil];
    
    //变更
    [_contentView addSubview:_topView];
    [_contentView addSubview:_tableView];
//    [_contentView addSubview:_bottomView];
    [_tableView reloadData];
    
    // 结束动画
    [UIView commitAnimations];
    
//    [self easeOut];
}

- (void)easeOut
{
    NSLog(@"easeOut");
    // 准备动画
    CATransition *animation = [CATransition animation];
    //动画播放持续时间
    [animation setDuration:0.5f];
    //动画速度,何时快、慢
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    /*动画效果
     kCATransitionFade      淡出
     kCATransitionMoveIn    覆盖原图
     kCATransitionPush      推出
     kCATransitionReveal    底部显出来
     */
    [animation setType:kCATransitionFade];
    [self.layer addAnimation:animation forKey:nil];
    
    //变更
    //    [self addSubview:tmpView];
    _topView = [self getTopView];
    [_contentView addSubview:_topView];
//    [self addSubview:_tableView];
//    [self addSubview:_bottomView];
    
    // 结束动画
    [UIView commitAnimations];
}

- (void)addPanGesture
{
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handelPan:)];
    [self addGestureRecognizer:panGes];
}

- (void)handelPan: (UIPanGestureRecognizer*)gestureRecognizer
{
    if (_isLocked) {
        return;
    }
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        _beginPoint = [gestureRecognizer locationInView:self];
    }
    CGPoint curPoint = [gestureRecognizer locationInView:self];
    CGRect frame = self.frame;
    frame.origin.x += curPoint.x - _beginPoint.x;
    //    frame.origin.y += curPoint.y - _beginPoint.y;
    [self setFrame:frame];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (self.frame.origin.x >= 150) {
            [self moveCenterViewToDirection:@"right"];
//            [_delegate didMoveCenterViewToDirection:@"right"];
            NSLog(@"doright!!!!!");
        } else {
            [self moveCenterViewToDirection:@"left"];
//            [_delegate didMoveCenterViewToDirection:@"left"];
            NSLog(@"doleft!!!!!");
        }
    }
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
