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

@interface ViewController ()

@property (nonatomic, strong) ModalTransitionAnimation *animation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animation = [[ModalTransitionAnimation alloc] init];
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
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _animation;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return _animation;
    
}

@end
