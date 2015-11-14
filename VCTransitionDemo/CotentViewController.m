//
//  CotentViewController.m
//  VCTransitionDemo
//
//  Created by heke on 15/11/14.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "CotentViewController.h"

@interface CotentViewController ()

@end

@implementation CotentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIButton *p = [UIButton buttonWithType:UIButtonTypeCustom];
    p.frame = CGRectMake(10, 90, 80, 30);
    p.backgroundColor = [UIColor grayColor];
    [p addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:p];
}

- (void)present:(id)sender {
    CotentViewController *vc = [[CotentViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
