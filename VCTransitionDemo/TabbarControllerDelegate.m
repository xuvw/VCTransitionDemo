//
//  TabbarControllerDelegate.m
//  VCTransitionDemo
//
//  Created by heke on 15/11/14.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "TabbarControllerDelegate.h"
#import "TabbarTransitionAnimation.h"

@interface TabbarControllerDelegate()

@property (nonatomic, strong) TabbarTransitionAnimation *animation;

@end

@implementation TabbarControllerDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.animation = [[TabbarTransitionAnimation alloc] init];
    }
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
    return self.animation;
}

@end
