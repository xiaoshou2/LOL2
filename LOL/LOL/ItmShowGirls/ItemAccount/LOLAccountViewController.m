//
//  ViewController.m
//  WKViewController
//
//  Created by macairwkcao on 15/10/30.
//  Copyright © 2015年 CWK. All rights reserved.
//

#import "LOLAccountViewController.h"
#import "WKSectionView.h"
#import "LoginVCNew.h"
#import "LOLForgetPasswordFirVC.h"
#import "LOLUserMessageVC.h"
#define TABLEVIEW_CONTENTINSET_TOP 170
#define PANVIEW_SIZE_HEIGHT TABLEVIEW_CONTENTINSET_TOP+12
#define TABLEVIEW_HIDE_CONTENTSETOFFY -TABLEVIEW_CONTENTINSET_TOP-30
#define DEVICE_SCREEN_HEIGHT self.view.frame.size.height
#define DEVICE_SCREEN_WIDTH self.view.frame.size.width
#define TABLEVIEW_HIDE_ANIMATIONS_NSTIMEINTERVAL 0.2



@interface LOLAccountViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,EveryFrameDelegate>
{
    UIImageView  *_backImageView;
    UITableView *_tableView;
    UIView *_panView;
    BOOL _hide;
    CGFloat _lastPosition;
}
@end

@implementation LOLAccountViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
    if (_hide) {
        _panView.hidden = NO;
        _hide = NO;
        [_tableView setContentOffset:CGPointMake(0, -TABLEVIEW_CONTENTINSET_TOP) animated:YES];
        [UIView animateWithDuration:TABLEVIEW_HIDE_ANIMATIONS_NSTIMEINTERVAL animations:^{
            UIEdgeInsets edgeInset = UIEdgeInsetsMake(TABLEVIEW_CONTENTINSET_TOP, 0, 0, 0);
            _tableView.contentInset = edgeInset;
            [_tableView setContentOffset:CGPointMake(0, -TABLEVIEW_CONTENTINSET_TOP) animated:YES];
            [_tableView scrollsToTop];
            _panView.frame = CGRectMake(0, 0,ScreenWidth, PANVIEW_SIZE_HEIGHT);
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.titleView.hidden = YES;
    [self tableView];
    _hide = NO;
}

-(void)tableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIEdgeInsets edgeInset = UIEdgeInsetsMake(TABLEVIEW_CONTENTINSET_TOP, 0, 0, 0);
    _tableView.contentInset = edgeInset;
    
    //_tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = [self backViewForTableView];
   // _tableView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_tableView];
    UIView *footview = [[UIView alloc] init];
    footview.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = footview;
    
}

-(UIView *)backViewForTableView
{
    UIView * backView = [[UIView alloc] initWithFrame:self.view.bounds];
    _backImageView = [[UIImageView alloc] initWithFrame:backView.bounds];
    _backImageView.image = [UIImage imageNamed:@"bgimg.jpg"];
    _backImageView.userInteractionEnabled = YES;
    _panView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_SCREEN_WIDTH, PANVIEW_SIZE_HEIGHT)];
    self.userHeadImageView = [[UIImageView alloc] init];
    self.userHeadImageView.frame = CGRectMake(DEVICE_SCREEN_WIDTH/2-40,60,80,80);
    self.userHeadImageView.backgroundColor = [UIColor yellowColor];
    [_panView addSubview:self.userHeadImageView];
    self.userHeadImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headClicked)];
    [self.userHeadImageView addGestureRecognizer:tap];
    self.userHeadImageView.layer.masksToBounds =YES;
    self.userHeadImageView.layer.cornerRadius =80/2;
    self.userNameLb = [[UILabel alloc] init];
    self.userNameLb.frame = CGRectMake(DEVICE_SCREEN_WIDTH/2-40,145,80,20);
    //self.userNameLb.backgroundColor = [UIColor blackColor];
    self.userNameLb.textAlignment = NSTextAlignmentCenter;
    self.userNameLb.text = @"非丶白";
    self.userNameLb.font = [UIFont systemFontOfSize:12];
    [_panView addSubview:self.userNameLb];
    UITapGestureRecognizer *lbtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headClicked)];

    [self.userNameLb addGestureRecognizer:lbtap];

    
    self.loginBtn =[UIButton addBtnImage:@"loginBtn" AndFrame:CGRectMake(DEVICE_SCREEN_WIDTH/2-60,70,120,40) WithTarget:self action:@selector(loginAccountButton)];
    [_panView addSubview:self.loginBtn];
    
    
    _panView.backgroundColor = [UIColor redColor];
    [_backImageView addSubview:_panView];
    [backView addSubview:_backImageView];
    
    [self hindView];
    
    
    return backView;
}

-(void)hindView
{
    if([LOLUserData isLogined]){//用户已登录
        self.loginBtn.hidden = YES;
        self.userNameLb.hidden = NO;
        self.userHeadImageView.hidden = NO;
    }else{
        self.loginBtn.hidden = NO;
        self.userNameLb.hidden = YES;
        self.userHeadImageView.hidden = YES;
    }
}

-(void)headClicked
{
    LOLUserMessageVC *userVC = [[LOLUserMessageVC alloc] init];
    [[SharedDelegate getRootNav]pushViewController:userVC animated:YES];

}

//点击去登录
-(void)loginAccountButton
{
    NSLog(@"点击去登录");
    //LoginVCNew *login = [[LoginVCNew alloc] init];
    LOLForgetPasswordFirVC *forget = [[LOLForgetPasswordFirVC alloc] init];
    forget.loadType = YWBasePresentType;
    [self presentViewController:forget animated:NO completion:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSArray *titleArr = @[@"擅长段位",@"绑定账号",@"妹子收藏"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",titleArr[indexPath.row]];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WKSectionView *sectionView = [[WKSectionView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_SCREEN_WIDTH, 120)];
    sectionView.delegate = self;
    return sectionView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    if (_hide) {
        return;
    }
    if (contentOffsetY >= -TABLEVIEW_CONTENTINSET_TOP)
    {
        _backImageView.frame = CGRectMake(0, -contentOffsetY-TABLEVIEW_CONTENTINSET_TOP, DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT);
        _tableView.showsVerticalScrollIndicator = YES;
    }
    else
    {
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.bounces = YES;
    }
    if (contentOffsetY <= -TABLEVIEW_CONTENTINSET_TOP)
    {
        if (!_hide) {
            if (scrollView.isDragging) {
                [UIView animateWithDuration:TABLEVIEW_HIDE_ANIMATIONS_NSTIMEINTERVAL animations:^{
                    _panView.frame = CGRectMake(0, (contentOffsetY+TABLEVIEW_CONTENTINSET_TOP), DEVICE_SCREEN_WIDTH, PANVIEW_SIZE_HEIGHT);
                    
                }];
            }
            else
            {
                _panView.frame = CGRectMake(0, (contentOffsetY+TABLEVIEW_CONTENTINSET_TOP), DEVICE_SCREEN_WIDTH, PANVIEW_SIZE_HEIGHT);
            }
        }
    }
    else
    {
        _panView.frame = CGRectMake(0, 0,DEVICE_SCREEN_WIDTH, PANVIEW_SIZE_HEIGHT);
    }
    _lastPosition = contentOffsetY;
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    if (contentOffsetY < TABLEVIEW_HIDE_CONTENTSETOFFY) {
        if (!_hide) {
            _hide = YES;
            [UIView animateWithDuration:TABLEVIEW_HIDE_ANIMATIONS_NSTIMEINTERVAL animations:^{
                UIEdgeInsets edgeInset = UIEdgeInsetsMake(DEVICE_SCREEN_HEIGHT, 0, 0, 0);
                _tableView.contentInset = edgeInset;
                
                [_tableView scrollRectToVisible:CGRectMake(0, -TABLEVIEW_CONTENTINSET_TOP, DEVICE_SCREEN_WIDTH, TABLEVIEW_CONTENTINSET_TOP/2) animated:YES];
                
                
                _panView.frame = CGRectMake(0, -PANVIEW_SIZE_HEIGHT,DEVICE_SCREEN_WIDTH, PANVIEW_SIZE_HEIGHT);
            } completion:^(BOOL finished) {
                if([LOLUserData isLogined]){//用户已登录)
                    LoginVCNew *login = [[LoginVCNew alloc] init];
                    login.loadType = YWBasePresentType;
                    [self presentViewController:login animated:YES completion:nil];
                }else{
                    LOLUserMessageVC *userMes = [[LOLUserMessageVC alloc] init];
                    [[SharedDelegate getRootNav]pushViewController:userMes animated:NO];
                }
              
                _panView.hidden = YES;
            }];
            [scrollView setContentOffset:CGPointMake(0, -DEVICE_SCREEN_HEIGHT) animated:YES];
        }
        return;
    }
}

-(void)DoSomethingEveryFrame:(NSInteger)sender
{
    NSLog(@" -???--  %ld ----",(long)sender);
    switch (sender) {
        case 1000:
            NSLog(@"1点击");
            break;
        case 1001:
            NSLog(@"2点击");
            break;
        case 1002:
            NSLog(@"3点击");
            break;
        case 1003:
            NSLog(@"4点击");
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
