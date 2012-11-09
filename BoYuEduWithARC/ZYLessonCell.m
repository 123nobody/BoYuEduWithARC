//
//  ZYLessonCell.m
//  BoYuEducation
//
//  Created by Wei on 12-11-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYLessonCell.h"

@implementation ZYLessonCell

@synthesize backView = _backView;
//@synthesize teacherImage = _teacherImage;
//@synthesize teacherName = _teacherName;
@synthesize teacherNameLabel = _teacherNameLabel;
@synthesize lessonNameLabel = _lessonNameLabel;
@synthesize lessonTimeLabel = _lessonTimeLabel;
@synthesize contentLabel = _contentLabel;
@synthesize fileNameLabelArray = _fileNameLabelArray;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(15, 5, (tableView.frame.size.width - 15 * 2), (250 - 15 - 50))];
        self.backView.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1.0];
        
        
        UIImage *image;
        UIImageView *imageView;
//        UILabel *label;
        CGRect frame;
        
        //小人图标
        image = [UIImage imageNamed:@"head.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        frame = CGRectMake(25, 15, image.size.width, image.size.height);
        [imageView setFrame:frame];
        [self.backView addSubview:imageView];
        
        //姓名
        frame = CGRectMake(60, 15, 200, 30);
        _teacherNameLabel = [[UILabel alloc]initWithFrame:frame];
//        label.text = self.teacherName;
//        label.text = @"张建国123";
        _teacherNameLabel.font = [UIFont boldSystemFontOfSize:18];
        _teacherNameLabel.textAlignment = UITextAlignmentLeft;
        _teacherNameLabel.backgroundColor = [UIColor clearColor];
        [self.backView addSubview:_teacherNameLabel];
//        [_teacherNameLabel release];
        
        //课程名
        frame = CGRectMake(25, (frame.origin.y + frame.size.height + 15), 350, 20);
        _lessonNameLabel = [[UILabel alloc]initWithFrame:frame];
//        _lessonNameLabel.text = @"金融理财概述和CFP制度";
        _lessonNameLabel.textAlignment = UITextAlignmentLeft;
        _lessonNameLabel.backgroundColor = [UIColor clearColor];
        [self.backView addSubview:_lessonNameLabel];
//        [label release];
        
        //课程时间
        frame = CGRectMake(25, (frame.origin.y + frame.size.height + 15), 350, 20);
        _lessonTimeLabel = [[UILabel alloc]initWithFrame:frame];
//        _lessonTimeLabel.text = @"09:15 ~ 10:00";
        _lessonTimeLabel.textAlignment = UITextAlignmentLeft;
        _lessonTimeLabel.backgroundColor = [UIColor clearColor];
        [self.backView addSubview:_lessonTimeLabel];
//        [label release];
        
        //分割线
        image = [UIImage imageNamed:@"background02_line.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        frame = CGRectMake(15, (frame.origin.y + frame.size.height + 15), (self.backView.frame.size.width - 15 * 2), image.size.height);
        [imageView setFrame:frame];
        [self.backView addSubview:imageView];
        
        //课程介绍
        frame = CGRectMake(25, (frame.origin.y + frame.size.height + 10), 350, 20);
        _contentLabel = [[UILabel alloc]initWithFrame:frame];
//        _contentLabel.text = @"课程介绍999";
        _contentLabel.textAlignment = UITextAlignmentLeft;
        _contentLabel.backgroundColor = [UIColor clearColor];
        [self.backView addSubview:_contentLabel];
//        [label release];
        
//        //需要用循环
//        self.tag = 2;
//        
//        //文件背景蓝
//        image = [UIImage imageNamed:@"file_br.png"];
//        frame = CGRectMake(20, (frame.origin.y + frame.size.height + 10), image.size.width, image.size.height);
//        UIButton *fileButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [fileButton setBackgroundImage:image forState:UIControlStateNormal];
//        [fileButton setFrame:frame];
//        //需要把点击事件抛出去 用代理
//        [fileButton addTarget:self action:@selector(pressFileButton:) forControlEvents:UIControlEventTouchUpInside];
//        [self.backView addSubview:fileButton];
//        
//        //课件
//        frame = CGRectMake(60, frame.origin.y, 400, 30);
//        label = [[UILabel alloc]initWithFrame:frame];
//        label.text = @"金融理财概述和CFP制度.xls";
//        label.textAlignment = UITextAlignmentLeft;
//        label.backgroundColor = [UIColor clearColor];
//        [self.backView addSubview:label];
//        [label release];
//        
//        //文件背景蓝
//        image = [UIImage imageNamed:@"file_br.png"];
//        frame = CGRectMake(20, (frame.origin.y + frame.size.height + 10), image.size.width, image.size.height);
//        fileButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [fileButton setBackgroundImage:image forState:UIControlStateNormal];
//        [fileButton setFrame:frame];
//        //需要把点击事件抛出去 用代理
//        [fileButton addTarget:self action:@selector(pressFileButton:) forControlEvents:UIControlEventTouchUpInside];
//        [self.backView addSubview:fileButton];
//        
//        //课件
//        frame = CGRectMake(60, frame.origin.y, 400, 30);
//        label = [[UILabel alloc]initWithFrame:frame];
//        label.text = @"金融理财概述和CFP制度.xls";
//        label.textAlignment = UITextAlignmentLeft;
//        label.backgroundColor = [UIColor clearColor];
//        [self.backView addSubview:label];
//        [label release];
        
        

    }
    [self addSubview:_backView];
    
    //下弧形阴影
    UIImage *shadowImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"background02_br" ofType:@"png"]];
    UIImageView *shadowImageView = [[UIImageView alloc] initWithImage:shadowImage];
    _bottomShadowView = [[UIView alloc]initWithFrame:CGRectMake(15, (self.backView.frame.origin.y + self.backView.frame.size.height), self.backView.frame.size.width, shadowImage.size.height)];
    [shadowImageView setFrame:CGRectMake(0, 0, _bottomShadowView.frame.size.width, shadowImage.size.height)];
    [_bottomShadowView addSubview:shadowImageView];
    [self addSubview:_bottomShadowView];
    
    return self;
}

- (void)addFilesWithFileNameArray: (NSMutableArray *)fileNameArray target:(id)target
{
    UIView *filesView = [self viewWithTag:666];
    if (!filesView) {
        [filesView removeFromSuperview];
    }
    int count = fileNameArray.count;
    [_backView setFrame:CGRectMake(_backView.frame.origin.x, _backView.frame.origin.y, _backView.frame.size.width, (185 + count * 44))];
    if (count == 0) {
        NSLog(@"fileNameArray.count is 0 !!!!");
        return;
    }
    filesView = [[UIView alloc]init];
    filesView.tag = 666;
    
    UIImage *image;
    CGRect frame = self.contentLabel.frame;
    UIButton *fileButton;
    UILabel *label;
    NSString *fileName;
    
    for (int i = 0; i < count; i++) {
        fileName = [fileNameArray objectAtIndex:i];
        //文件背景蓝
        image = [UIImage imageNamed:@"file_br.png"];
        frame = CGRectMake(20, ((image.size.height + 10) * i), image.size.width, image.size.height);
        fileButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [fileButton setBackgroundImage:image forState:UIControlStateNormal];
        [fileButton setFrame:frame];
        //需要把点击事件抛出去 用代理
        [fileButton addTarget:target action:@selector(pressFileButton:) forControlEvents:UIControlEventTouchUpInside];
        [filesView addSubview:fileButton];
        
        //课件
        frame = CGRectMake(60, frame.origin.y, 400, 30);
        label = [[UILabel alloc]initWithFrame:frame];
        label.text = fileName;
        label.textAlignment = UITextAlignmentLeft;
        label.backgroundColor = [UIColor clearColor];
        [filesView addSubview:label];
    }
    
    [filesView setFrame:CGRectMake(0, 175, _backView.frame.size.width, ((image.size.height + 10) * count - 10))];
    [_backView addSubview:filesView];
    
   
//    self.tag = fileNameArray.count;
//    [self.backView setFrame:CGRectMake(self.backView.frame.origin.x, self.backView.frame.origin.y, self.backView.frame.size.width, (self.backView.frame.size.height + fileNameArray.count * 40))];
    [_bottomShadowView setFrame:CGRectMake(15, (self.backView.frame.origin.y + self.backView.frame.size.height), self.backView.frame.size.width, 14)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
