//
//  AppDelegate.m
//  WPTabBarVC
//
//  Created by huangweipeng on 16/5/14.
//  Copyright © 2016年 HWP. All rights reserved.
//

#import "AppDelegate.h"
#import "WPTabBarController.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) WPTabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UINavigationController *)navigationController {
    if (_navigationController == nil) {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.tabBarController];
        navigationController.navigationBar.tintColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:1];
        _navigationController = navigationController;
    }
    return _navigationController;
}

- (WPTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        WPTabBarController *tabBarController = [[WPTabBarController alloc] init];
        
        UIViewController *mainframeViewController = ({
            UIViewController *mainframeViewController = [[UIViewController alloc] init];
            
            UIImage *mainframeImage   = [UIImage imageNamed:@"tabbar_icon_news_normal"];
            UIImage *mainframeHLImage = [UIImage imageNamed:@"tabbar_icon_news_highlight"];
            
            mainframeViewController.title = @"新闻";
            mainframeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:mainframeImage selectedImage:mainframeHLImage];
            mainframeViewController.view.backgroundColor = [UIColor colorWithRed:100 / 255.0 green:67 / 255.0 blue:78 / 255.0 alpha:1];
            mainframeViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tabbar_setting_up"]
                                                                                                         style:UIBarButtonItemStylePlain
                                                                                                        target:self
                                                                                                        action:@selector(didClickAddButton:)];
            
            mainframeViewController;
        });
        
        UIViewController *contactsViewController = ({
            UIViewController *contactsViewController = [[UIViewController alloc] init];
            
            UIImage *contactsImage   = [UIImage imageNamed:@"tabbar_icon_bar_normal"];
            UIImage *contactsHLImage = [UIImage imageNamed:@"tabbar_icon_bar_highlight"];
            
            contactsViewController.title = @"通讯录";
            contactsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"通讯录" image:contactsImage selectedImage:contactsHLImage];
            contactsViewController.view.backgroundColor = [UIColor colorWithRed:115 / 255.0 green:15 / 255.0 blue:6 / 255.0 alpha:1];
            
            contactsViewController;
        });
        
        UIViewController *discoverViewController = ({
            UIViewController *discoverViewController = [[UIViewController alloc] init];
            
            UIImage *discoverImage   = [UIImage imageNamed:@"tabbar_icon_found_normal"];
            UIImage *discoverHLImage = [UIImage imageNamed:@"tabbar_icon_found_highlight"];
            
            discoverViewController.title = @"发现";
            discoverViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:discoverImage selectedImage:discoverHLImage];
            discoverViewController.view.backgroundColor = [UIColor colorWithRed:32 / 255.0 green:85 / 255.0 blue:60 / 255.0 alpha:1];
            
            discoverViewController;
        });
        
        UIViewController *meViewController = ({
            UIViewController *meViewController = [[UIViewController alloc] init];
            
            UIImage *meImage   = [UIImage imageNamed:@"tabbar_icon_me_normal"];
            UIImage *meHLImage = [UIImage imageNamed:@"tabbar_icon_me_highlight"];
            
            meViewController.title = @"我";
            meViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:meImage selectedImage:meHLImage];
            meViewController.view.backgroundColor = [UIColor colorWithRed:19 / 255.0 green:135 / 255.0 blue:56 / 255.0 alpha:1];
            
            meViewController;
        });
        
        tabBarController.title = @"网易新闻";
        tabBarController.tabBar.tintColor = [UIColor redColor];
        
        tabBarController.viewControllers = @[
                                             [[UINavigationController alloc] initWithRootViewController:mainframeViewController],
                                             [[UINavigationController alloc] initWithRootViewController:contactsViewController],
                                             [[UINavigationController alloc] initWithRootViewController:discoverViewController],
                                             [[UINavigationController alloc] initWithRootViewController:meViewController],
                                             ];
        
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (void)didClickAddButton:(id)sender {
    ViewController *viewController = [[ViewController alloc] init];
    
    viewController.title = @"设置";
    viewController.view.backgroundColor = [UIColor colorWithRed:26 / 255.0 green:178 / 255.0 blue:10 / 255.0 alpha:1];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
