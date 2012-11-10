//
//  ZYTestViewController.m
//  BoYuEducation
//
//  Created by Wei on 12-11-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYTestViewController.h"

@interface ZYTestViewController ()

@end

@implementation ZYTestViewController

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
//        [self.view setFrame:CGRectMake(20, 70, 100, 100)];
        self.view.backgroundColor = [UIColor blueColor];
        UIButton *commit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [commit setFrame:CGRectMake(50, 50, 200, 50)];
        [self.view addSubview:commit];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
