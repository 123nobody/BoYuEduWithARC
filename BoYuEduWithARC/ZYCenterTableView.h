//
//  ZYCenterTableView.h
//  BoYuEducation
//
//  Created by Wei on 12-10-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZYCenterTableViewDelegate <NSObject>

- (void)ZYCenterTableViewTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ZYCenterTableViewTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)ZYCenterTableViewTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@interface ZYCenterTableView : UITableView
{
    id<ZYCenterTableViewDelegate> _touchDelegate;
}

@property (nonatomic, strong) id<ZYCenterTableViewDelegate> touchDelegate;

@end
