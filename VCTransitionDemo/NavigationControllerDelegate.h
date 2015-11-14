//
//  NavigationControllerDelegate.h
//  VCTransitionDemo
//
//  Created by heke on 15/11/13.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationControllerDelegate : NSObject
<UINavigationControllerDelegate>

@property (nonatomic, weak) UINavigationController *naviVC;

@end
