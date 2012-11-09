//
//  ZYLessonView.h
//  BoYuEducation
//
//  Created by Wei on 12-11-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYLessonView : UIView
{
    UIView *_backView;
    
    UILabel *_teacherNameLabel;
    UILabel *_lessonNameLabel;
    UILabel *_lessonTimeLabel;
    UILabel *_contentLabel;
    NSArray *_fileNameLabelArray;
    UIView *_bottomShadowView;
}

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UILabel *teacherNameLabel;
@property (nonatomic, strong) UILabel *lessonNameLabel;
@property (nonatomic, strong) UILabel *lessonTimeLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) NSArray *fileNameLabelArray;


- (id)initWithTarget: (id)target teacherName: (NSString *)teacherName lessonName: (NSString *)lessonName lessonTime: (NSString *)lessonTime content: (NSString *)content fileNameArray: (NSArray *)fileNameArray;
- (CGRect)addFilesWithFileNameArray: (NSMutableArray *)fileNameArray target:(id)target;

@end
