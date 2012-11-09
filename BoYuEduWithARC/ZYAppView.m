//
//  ZYAppView.m
//  BoYuEducation
//
//  Created by Wei on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYAppView.h"

@implementation ZYAppView

@synthesize delegate = _delegate;
//@synthesize image = _image;
@synthesize button = _button;
@synthesize name = _name;


- (id)initWithImage:(UIImage *)image Name:(NSString *)name
{
    CGRect frame;
    
    frame = CGRectMake(0, 0, BY_APP_IMAGE_WIDTH, (BY_APP_IMAGE_HEIGHT + BY_APP_PADDING_OF_IMAGE_AND_NAME));
    self = [super initWithFrame:frame];
    if (self) {
        
//        _image = [[UIImageView alloc]initWithImage:image];
        frame = CGRectMake(0, 0, BY_APP_IMAGE_WIDTH, BY_APP_IMAGE_HEIGHT);
//        [_image setFrame:frame];
//        _image.backgroundColor = [UIColor brownColor];
//        [self addSubview:_image];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:frame];
        [_button setBackgroundImage:image forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        _button.accessibilityValue = name;
        [self addSubview:_button];
        
        _name = [[UILabel alloc]initWithFrame:CGRectMake(0, (BY_APP_IMAGE_HEIGHT + BY_APP_PADDING_OF_IMAGE_AND_NAME), BY_APP_NAME_WIDTH, BY_APP_NAME_HEIGHT)];
        if ([name isEqualToString:@""]) {
            _name.backgroundColor = [UIColor clearColor];
        } else {
            _name.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"button_word.png"]];
        }
        _name.text = name;
        _name.textColor = [UIColor whiteColor];
        _name.font = [UIFont fontWithName:@"Verdana-Bold" size:14.f];
        _name.textAlignment = UITextAlignmentCenter;
        CGRect frame = _name.frame;
        frame.origin.x = (self.frame.size.width - frame.size.width) / 2;
        [_name setFrame:frame];
        [self addSubview:_name];
    }
    return self;
}

- (void)pressButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSString *buttonName = button.accessibilityValue;
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
