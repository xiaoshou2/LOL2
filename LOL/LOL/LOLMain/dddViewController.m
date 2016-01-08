//
//  dddViewController.m
//  LOL
//
//  Created by feibai on 16/1/7.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "dddViewController.h"
#import "CCCCViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface dddViewController ()

@end

@implementation dddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"第二页面";
    self.backButton.hidden = NO;
    
    UIButton *BB = [UIButton buttonWithFrame:CGRectMake(100, 100, 100, 100)];
    [BB addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
    BB.backgroundColor = [UIColor redColor];
    [self.view addSubview:BB];
    // Do any additional setup after loading the view.
}
-(void)aaa
{
    CCCCViewController *vv = [[CCCCViewController alloc] init];
    //[SharedDelegate.lcNavigationController pushViewController:vv animated:YES];
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [[appdelegate getRootNav] pushViewController:vv animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.navigationController.fd_prefersNavigationBarHidden = YES;
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
