//
//  ZYSettingViewController.m
//  BoYuEducation
//
//  Created by Wei on 12-10-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYSettingViewController.h"

@interface ZYSettingViewController ()

@end

@implementation ZYSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [closeButton setFrame:CGRectMake(100, 100, 200, 50)];
        [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(pressSettingCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closeButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)pressSettingCloseButton:sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
