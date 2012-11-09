//
//  ZYGridView.h
//  BoYuEducation
//
//  Created by Wei on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYAppView.h"

//小应用水平垂直间距
#define BY_GRIDVIEW_HORIZONTAL_PADDING 30.f
#define BY_GRIDVIEW_VERTICAL_PADDING 30.f

@protocol ZYGridViewDelegate <NSObject>

- (void) pressButton: (NSString *)buttonName;

@end

@interface ZYGridView : UIView <ZYAppViewDelegate>
{
    id<ZYGridViewDelegate> _delegate;
    BOOL _isInitStatic;
}

@property (nonatomic, strong) id<ZYGridViewDelegate> delegate;
@property (nonatomic, assign) BOOL isInitStatic;

- (id)initWithZYAppViews:(NSArray *)appViews;

@end
