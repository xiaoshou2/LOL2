//
//  LOLBaseViewController.m
//  LOL
//
//  Created by feibai on 16/1/6.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"

@interface LOLBaseViewController ()

@end

@implementation LOLBaseViewController

- (void)viewDidLoad {
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    
    [self.view addSubview:self.titleView];
    [super viewDidLoad];
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, self.titleView.frame.size.height-44, ScreenWidth-130, 44)];
        _titleLabel.font=[UIFont boldSystemFontOfSize:16];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textColor =[UIColor whiteColor];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        [self.titleView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIView *)titleView{
    
    if(_titleView == nil){
        
        _titleView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, (IsIOS7 ? 64 : 44))];
        
        _titleView.backgroundColor = KNavBarColor;
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, _titleView.frame.size.height-44, ScreenWidth-130, 44)];
        
        _titleLabel.font=[UIFont boldSystemFontOfSize:16];
        _titleLabel.backgroundColor=[UIColor clearColor];
        _titleLabel.textColor =[UIColor whiteColor];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        [_titleView addSubview:_titleLabel];
        
        _backButton = [UIButton buttonWithFrame:CGRectMake(0, _titleView.frame.size.height-44, 60, 44) image:IMAGENAMED(@"yw_nav_button_arrow.png")];
        
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _backButton.titleLabel.font=[UIFont systemFontOfSize:16];
        
        [_backButton addTarget:self action:@selector(onButtonActionBack:) forControlEvents:UIControlEventTouchUpInside];
        [_titleView addSubview:_backButton];
        
    }
    return _titleView;
}

#pragma -
#pragma mark 返回上一个视图
-(void)onButtonActionBack:(id)sender{
    
    if (YWBasePresentType == self.loadType)
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _titleLabel.text = self.title;
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
