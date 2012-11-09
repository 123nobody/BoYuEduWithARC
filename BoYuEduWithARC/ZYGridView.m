//
//  ZYGridView.m
//  BoYuEducation
//
//  Created by Wei on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYGridView.h"

@implementation ZYGridView

@synthesize delegate = _delegate;
@synthesize isInitStatic = _isInitStatic;

- (id)initWithZYAppViews:(NSArray *)appViews
{
    CGRect frame;
    frame = CGRectMake(30, 40, (BY_APP_IMAGE_WIDTH * 3 + BY_GRIDVIEW_HORIZONTAL_PADDING * (3 - 1)), (748 - 40 * 2));
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor lightGrayColor];
        [self addAppViews:appViews];
        _isInitStatic = YES;
    }
    return self;
}

- (void)addAppViews:(NSArray *)appViews
{
    CGFloat x, y;
    CGRect frame;
    ZYAppView *aView;
    for (int i = 0; i < appViews.count; i++) {        
        x = (BY_APP_IMAGE_WIDTH + BY_GRIDVIEW_HORIZONTAL_PADDING) * (i % 3);
        y = (BY_APP_IMAGE_HEIGHT + BY_APP_PADDING_OF_IMAGE_AND_NAME + BY_APP_NAME_HEIGHT + BY_GRIDVIEW_VERTICAL_PADDING) * (i / 3);
        aView = [appViews objectAtIndex:i];
        frame = CGRectMake(x, y, aView.frame.size.width, aView.frame.size.height);
//        NSLog(@"appframe_%d:%@", i, NSStringFromCGRect(frame));
        [aView setFrame:frame];
        aView.delegate = self;
        [self addSubview:aView];
    }
}

- (void)pressButton:(NSString *)buttonName
{
    [_delegate pressButton:buttonName];
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
