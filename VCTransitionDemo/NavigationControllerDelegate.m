//
//  NavigationControllerDelegate.m
//  VCTransitionDemo
//
//  Created by heke on 15/11/13.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "NavigationTransitionAnimation.h"

@interface NavigationControllerDelegate()

@property (nonatomic, strong) NavigationTransitionAnimation *animation;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;
@property (nonatomic,assign)  BOOL interActiving;

@end

@implementation NavigationControllerDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.animation = [[NavigationTransitionAnimation alloc] init];
        self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

- (void)setNaviVC:(UINavigationController *)naviVC {
    _naviVC = naviVC;
    _naviVC.interactivePopGestureRecognizer.enabled = NO;
    
    [self.naviVC.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)]];
}

-(void)handleGesture:(UIPanGestureRecognizer *)gesture {
    UIView* view = self.naviVC.view;
    CGPoint location = [gesture locationInView:gesture.view];
    CGPoint translation = [gesture translationInView:gesture.view];
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            _interActiving = YES;
            if (location.x < CGRectGetMidX(view.bounds) && self.naviVC.viewControllers.count > 1) {
                [self.naviVC popViewControllerAnimated:YES];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = fabs(translation.x / view.bounds.size.width);
            NSLog(@"%f",fraction);
            [_interactionController updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            _interActiving = NO;
            CGFloat fraction = fabs(translation.x / view.bounds.size.width);
            if (fraction < 0.5 || [gesture velocityInView:view].x < 0 || gesture.state == UIGestureRecognizerStateCancelled) {
                [_interactionController cancelInteractiveTransition];
            } else {
                [_interactionController finishInteractiveTransition];
            }
            
            break;
        }
        default:
            break;
    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{

    if (operation == UINavigationControllerOperationPop) {
        return _animation;
    }
    
    return nil;
    
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interActiving ? self.interactionController : nil;
}

@end
