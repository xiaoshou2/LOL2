//
//  LOLHomeViewController.m
//  LOL
//
//  Created by feibai on 16/1/6.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLHomeViewController.h"
#import "dddViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface LOLHomeViewController ()

@end

@implementation LOLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
     self.fd_prefersNavigationBarHidden = YES;
    self.title = @"首页";
    self.backButton.hidden = YES;
    [self setupCustomNavBar];
    
    UIButton *BB = [UIButton buttonWithFrame:CGRectMake(100, 100, 100, 100)];
    [BB addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
    BB.backgroundColor = [UIColor redColor];
    [self.view addSubview:BB];
}

-(void)aaa
{
    dddViewController *vv = [[dddViewController alloc] init];
    //[SharedDelegate.lcNavigationController pushViewController:vv animated:YES];
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [[appdelegate getRootNav] pushViewController:vv animated:YES];
}
-(void)setupCustomNavBar
{
//    UIView *topView =  [[UIView alloc] initWithFrame:CGRectMake(0,IsIOS7 ? 20 : 0, self.view.width,44.)];
////    [topView addSubview:l_view_search];
////    [topView addSubview:l_view_leftBar];
////    [topView addSubview:rightButton];
//    self.titleView.backgroundColor = [UIColor colorWithRed:1.0/255.0 green:147.0/255.0 blue:232.0/255.0 alpha:0.0];
//    [self.titleView addSubview:topView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.fd_prefersNavigationBarHidden = NO;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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
