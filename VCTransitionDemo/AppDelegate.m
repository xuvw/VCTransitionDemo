//
//  AppDelegate.m
//  VCTransitionDemo
//
//  Created by heke on 13/11/15.
//  Copyright (c) 2015 mhk. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CotentViewController.h"
#import "NavigationControllerDelegate.h"

#import "TabbarControllerDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) NavigationControllerDelegate *naviD;
@property (nonatomic, strong) TabbarControllerDelegate *tabBarD;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
//    //自定义模态视图切换动画
//    ViewController *vc = [[ViewController alloc] init];
//    self.window.rootViewController = vc;
    
    //自定义导航控制器切换动画
    self.naviD = [[NavigationControllerDelegate alloc] init];
    CotentViewController *vc = [[CotentViewController alloc] init];
    UINavigationController *rootVC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.naviD.naviVC = rootVC;
    
    rootVC.delegate = self.naviD;
    self.window.rootViewController = rootVC;
    
    
    //自定义tabbar切换动画：
//    ViewController *vc = [[ViewController alloc] init];
//    ViewController *vc1 = [[ViewController alloc] init];
//    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
//    tabbarVC.viewControllers = @[vc,vc1];
//    self.tabBarD = [[TabbarControllerDelegate alloc] init];
//    tabbarVC.delegate = self.tabBarD;
//    [tabbarVC setSelectedIndex:0];
//    self.window.rootViewController = tabbarVC;
    
//    UIPercentDrivenInteractiveTransition;
    
    [self.window makeKeyAndVisible];
    return YES;
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
