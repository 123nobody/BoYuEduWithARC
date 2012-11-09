//
//  ZYAppDelegate.m
//  BoYuEducation
//
//  Created by Wei on 12-10-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZYAppDelegate.h"

@interface ZYAppDelegate (Private)
- (BOOL)initDatabase;

@end

@implementation ZYAppDelegate

@synthesize window = _window;
@synthesize boyuDB = _boyuDB;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.viewController = [[ZYViewController alloc]initWithNibName:nil bundle:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController =self.viewController;
    
    // Override point for customization after application launch.
    //初始化数据库,连接数据库
    if (![self initDatabase]) {
        NSLog(@"Failed to init Database.");
    }
    [self.window makeKeyAndVisible];
    return YES;
}

// 初始化数据库
- (BOOL)initDatabase{
    BOOL success;
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    // 本地可写数库路径
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"BoYuEdu.sqlite"];
    
    success = [fm fileExistsAtPath:writableDBPath];
    if(!success){
        // 本地可写数库路径不存在，新建
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"BoYuEdu.sqlite"];
        
        success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if(!success){
            NSLog(@"Failed to copy database '%@'.", [error localizedDescription]);
        }
        //success = NO;
    }
    if(success){
        //本地可写数库路径存在，读取数据库文件
        _boyuDB = [FMDatabase databaseWithPath:writableDBPath];
    }
    return success;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
