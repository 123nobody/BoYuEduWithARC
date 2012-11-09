//
//  ZYLessonCell.h
//  BoYuEducation
//
//  Created by Wei on 12-11-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYLessonCell : UITableViewCell
{
    UIView *_backView;
    
//    UIImage *_teacherImage;
//    NSString *_teacherName;
    UILabel *_teacherNameLabel;
    UILabel *_lessonNameLabel;
    UILabel *_lessonTimeLabel;
    UILabel *_contentLabel;
    NSArray *_fileNameLabelArray;
    UIView *_bottomShadowView;
}

@property (nonatomic, strong) UIView *backView;

//@property (nonatomic, strong) UIImage *teacherImage;
@property (nonatomic, strong) UILabel *teacherNameLabel;
//@property (nonatomic, strong) NSString *teacherName;
@property (nonatomic, strong) UILabel *lessonNameLabel;
@property (nonatomic, strong) UILabel *lessonTimeLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) NSArray *fileNameLabelArray;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView;
- (void)addFilesWithFileNameArray: (NSMutableArray *)fileNameArray target:(id)target;

//- (void) setTeacherName:(NSString *)teacherName;

@end
