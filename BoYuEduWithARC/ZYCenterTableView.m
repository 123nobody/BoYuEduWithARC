//
//  ZYCenterTableView.m
//  BoYuEducation
//
//  Created by Wei on 12-10-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYCenterTableView.h"

@implementation ZYCenterTableView

@synthesize touchDelegate = _touchDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //    NSLog(@"tableView touchesBegan.");
//    [super touchesBegan:touches withEvent:event];
//    [_touchDelegate ZYCenterTableViewTouchesBegan:touches withEvent:event];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //    NSLog(@"tableView touchesMoved.");
//    [super touchesMoved:touches withEvent:event];
//    [_touchDelegate ZYCenterTableViewTouchesMoved:touches withEvent:event];
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //    NSLog(@"tableView touchesEnded.");
//    [super touchesEnded:touches withEvent:event];
//    [_touchDelegate ZYCenterTableViewTouchesEnded:touches withEvent:event];
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
