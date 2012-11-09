//
//  ZYAppView.h
//  BoYuEducation
//
//  Created by Wei on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//小应用图片宽高
#define BY_APP_IMAGE_WIDTH 85.f
#define BY_APP_IMAGE_HEIGHT 85.f

//图片与名称间距
#define BY_APP_PADDING_OF_IMAGE_AND_NAME 0.f

//小应用名称宽高
#define BY_APP_NAME_WIDTH 76.f
#define BY_APP_NAME_HEIGHT 26.f

@protocol ZYAppViewDelegate <NSObject>

- (void)pressButton: (NSString *)buttonName;

@end

@interface ZYAppView : UIView 
{
    id<ZYAppViewDelegate> _delegate;
//    UIImageView *_image;
    UIButton *_button;
    UILabel *_name;
}

@property (nonatomic, strong) id<ZYAppViewDelegate> delegate;
//@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *name;


- (id)initWithImage:(UIImage *)image Name:(NSString *)name;

@end
