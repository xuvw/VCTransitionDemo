//
//  ViewController.m
//  VCTransitionDemo
//
//  Created by heke on 13/11/15.
//  Copyright (c) 2015 mhk. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

#import "ModalTransitionAnimation.h"
#import "ModalInterActiveTransitionAnimation.h"
#import "ModalMoveTransitionAnimation.h"

@interface ViewController ()

@property (nonatomic, strong) ModalTransitionAnimation *animation;

@property(nonatomic,strong)ModalInterActiveTransitionAnimation *interActive;
@property(nonatomic,strong)ModalMoveTransitionAnimation *interActiveAnimation;

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _animation = [[ModalTransitionAnimation alloc] init];
    _interActive = [[ModalInterActiveTransitionAnimation alloc] init];
    _interActiveAnimation = [[ModalMoveTransitionAnimation alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor= [UIColor whiteColor];
    
    UIButton *p = [UIButton buttonWithType:UIButtonTypeCustom];
    p.frame = CGRectMake(10, 40, 80, 30);
    p.backgroundColor = [UIColor grayColor];
    [p addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:p];
}

- (void)present:(id)sender {
    ModalViewController *vc = [[ModalViewController alloc] init];
//    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    vc.transitioningDelegate = self;
    [_interActive wireToViewController:vc];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _animation;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.interActive.interacting ? _interActiveAnimation : _animation;
    
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interActive.interacting ? self.interActive : nil;
}
@end
