//
//  ModalInterActiveTransitionAnimation.h
//  VCTransitionDemo
//
//  Created by heke on 15/11/14.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalInterActiveTransitionAnimation : UIPercentDrivenInteractiveTransition

@property(nonatomic,assign)BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController;

@end
