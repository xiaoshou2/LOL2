//
//  LOLHomeViewController.m
//  LOL
//
//  Created by feibai on 16/1/6.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLHomeViewController.h"
#import "dddViewController.h"
#import "LOLHomeCellProperty.h"
#import "LOLHomeMenuCell.h"
#import "LOLSpaceCell.h"
#import "LOLBigGogCell.h"
#import "MJRefresh.h"
#import "LOLSpaceSecCell.h"
#import "LOLBigGodListCell.h"
#import "LOLGodcertificationVC.h"

@interface LOLHomeViewController ()

@end

@implementation LOLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"首页";
    self.tableView.hidden = YES;
    _tableViewDataSource = [NSMutableArray array];
    self.bannerArray     = [NSMutableArray array];
    self.bannerArray     = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",nil];
    [self loadDataSource];
    self.backButton.hidden = YES;
    [self setupCustomNavBar];
    [self setupMainView];
    [self reloadBannerView];
    [self setupRefreshUI];

}

#pragma mark - setup UI

- (void)setupRefreshUI {
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(requireNewData)];
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 0; i<6; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__0000%zd", i]];
        [idleImages addObject:image];
    }
    
    [header setImages:idleImages forState:MJRefreshStateIdle];
    
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__0000%zd", i]];
        [refreshingImages addObject:image];
    }
    [header setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.tableView.mj_header = header;
    
    header.lastUpdatedTimeLabel.hidden = YES;
}

#pragma mark - require Data

- (void)requireNewData {
   // [self showHUD];
    
//    BOOL isUpPullRefresh = self.tableView.contentOffset.y >= 0;    // 判断是不是上拉刷新
//    NSInteger page = isUpPullRefresh ? self.currentPage : 1;
//    
//    __WEAKSELF
//    [YWAFNetworkUtility getChannelListDataOfPage:page
//                                        pageSize:10
//                                    activityType:self.homeData.mtitle
//                                      categoryId:self.homeData.mid
//                                    successBlock:^(YWPageData *pageData, NSString *pageCount, NSString *recordCount) {
//                                        [wself hideHUD];
//                                        [wself setupViewHidden:NO];
//                                        
//                                        if (isUpPullRefresh) {
//                                            [wself excuteUpPullRefreshAction:pageData];
//                                            wself.tableView.footer.hidden = NO;
//                                            
//                                        } else {
//                                            [wself excuteDownPullRefreshAction:pageData];
//                                        }
//                                        
//                                    } failedBlock:^(NSError *error) {
//                                        [wself hideHUD];
//                                        
//                                        [wself.tableView.header endRefreshing];
//                                        [wself.tableView.footer endRefreshing];
//                                        [wself setupViewHidden:YES];
//                                        [wself showOnlyWords:@"网络连接失败，请联网后重试"];
//                                        
//                                        DLogDebug(@"%@", error);
//                                    }];
//    
}



-(void)setupMainView
{
    /************* 初始化tableView  ********************/
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    [self registCell];
    //[self.view insertSubview:self.tableView belowSubview:self.titleView];
    /************* 初始化banner视图  ********************/
    _bannerView = [[YWFocusImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth * 300 / 750) delegate:self imageItems:self.bannerArray isAuto:NO];
    self.tableView.tableHeaderView = _bannerView;

}

#pragma mark 注册 cell
- (void) registCell{
    [self.tableView registerClass:[LOLHomeMenuCell class] forCellReuseIdentifier:@"LOLHomeMenuCell"];
    [self.tableView registerClass:[LOLSpaceCell class] forCellReuseIdentifier:@"LOLSpaceCell"];
    [self.tableView registerClass:[LOLBigGogCell class]
           forCellReuseIdentifier:@"LOLBigGogCell"];
    [self.tableView registerClass:[LOLSpaceSecCell class]
           forCellReuseIdentifier:@"LOLSpaceSecCell"];
    [self.tableView registerClass:[LOLBigGodListCell class]
           forCellReuseIdentifier:@"LOLBigGodListCell"];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableViewDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LOLHomeCellProperty *cellProperty = _tableViewDataSource[indexPath.row];
    switch (cellProperty.cellType) {
        case LOLHomeCellStyleFloorOne:{
            LOLHomeMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLHomeMenuCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.menuClickedBk =  ^(NSInteger sender) {
                [self pushMenuVC:sender];
            };
            cell.backgroundColor = [UIColor grayColor];
           // cell.menuArray = cellProperty.cellData;
              
            return cell;
        }
            break;
        case LOLHomeCellStyleSpaceOne:{

            LOLSpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLSpaceCell"];
              cell.backgroundColor = [UIColor purpleColor];
              cell.selectionStyle = UITableViewCellSelectionStyleNone;

            //cell.backgroundColor = cellProperty.cellColor ? cellProperty.cellColor : [UIColor colorWithString:@"#f3f3f3"];
            //cell.isHiddenLine = cellProperty.isHiddenLine;
            return cell;
        }
            break;
       case LOLHomeCellStyleFloorTwo:{

            LOLBigGogCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLBigGogCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.godClickedBk =  ^(NSInteger sender) {
                  [self pushGodVC:sender];
              };
           // cell.floorTitle = cellProperty.floorTitle;
            //cell.channelArray = _channelArray;
            //cell.backgroundColor = [UIColor colorWithString:@"#ffffff"];
              cell.backgroundColor = [UIColor blueColor];
            return cell;
        }
              break;
        case LOLHomeCellStyleSpaceSec:{
              LOLSpaceSecCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLSpaceSecCell"];
              cell.selectionStyle = UITableViewCellSelectionStyleNone;
              cell.backgroundColor = [UIColor redColor];
              
              return cell;
          }break;
          case LOLHomeCellStyleFloorThree:{
              LOLBigGodListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLBigGodListCell"];
              cell.selectionStyle = UITableViewCellSelectionStyleNone;
              cell.backgroundColor = [UIColor grayColor];
              
              return cell;
          }break;
    }
    return nil;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LOLHomeCellProperty *cellProperty = _tableViewDataSource[indexPath.row];
    return cellProperty.cellHeight;
}

#pragma mark - 加载数据源
- (void) loadDataSource{
//    if (_tableViewDataSource.count > 0) {
//        [_tableViewDataSource removeAllObjects];
//        productPage = 1;
//    }
    
   
    
    LOLHomeCellProperty *menuCellProperty = [self createCellPropertyWithType:LOLHomeCellStyleFloorOne];
   // menuCellProperty.cellData = self.menuViewModel.menuSource;
    [_tableViewDataSource addObject:menuCellProperty];// 菜单
    
    LOLHomeCellProperty *spaceCellProperty = [self createCellPropertyWithType:LOLHomeCellStyleSpaceOne];
    [_tableViewDataSource addObject:spaceCellProperty];//间隙
    
    LOLHomeCellProperty *bigGogCell = [self createCellPropertyWithType:LOLHomeCellStyleFloorTwo];
    [_tableViewDataSource addObject:bigGogCell];
    
    LOLHomeCellProperty *spaceCellSec = [self createCellPropertyWithType:LOLHomeCellStyleSpaceSec];
    [_tableViewDataSource addObject:spaceCellSec];

    LOLHomeCellProperty *bigGodList = [self createCellPropertyWithType:LOLHomeCellStyleFloorThree];
    [_tableViewDataSource addObject:bigGodList];
    
    
//    //添加楼层数据
//    for (int i = 0; i < [self.floorViewModel.homeFloorSource count]; i++) {
//        NSDictionary *dataDic = self.floorViewModel.homeFloorSource[i];
//        NSString *lctitle = dataDic[@"floorName"];
//        NSInteger lctype = [dataDic[@"templateId"] intValue];
//        if (lctype == YWHomeCellStyleSpecial) {
//            //楼层是否有标题
//            //            NSLog(@"%@",lctitle);
//            if (lctitle.length > 0) {
//                YWHomeCellProperty *floorTitle = [self createCellPropertyWithType:YWHomeCellStyleFloorTitle];//楼层标题单元格
//                floorTitle.floorTitle = lctitle;
//                [_tableViewDataSource addObject:floorTitle];
//                
//            }
//            for (int i = 0; i < [dataDic[@"contents"] count]; i++) {
//                YWHomeCellProperty *floorCellProperty = [self createCellPropertyWithType:[dataDic[@"templateId"] intValue]];//楼层样式
//                NSArray *tempArray = dataDic[@"contents"];
//                floorCellProperty.floorData = [NSArray arrayWithObject:tempArray[i]];
//                [_tableViewDataSource addObject:floorCellProperty];
//            }
//        }else{
//            YWHomeCellProperty *floorCellProperty = [self createCellPropertyWithType:[dataDic[@"templateId"] intValue]];//楼层样式
//            floorCellProperty.floorData = dataDic[@"contents"];//楼层数据
//            if (floorCellProperty.cellType == YWHomeCellStyleThemeProdcut) {
//                floorCellProperty.themeProducts = dataDic[@"itemsToTemplate"];
//                [_tableViewDataSource addObject:floorCellProperty];
//                continue;
//            }else{
//                [_tableViewDataSource addObject:floorCellProperty];
//            }
//            
//        }
//        [_tableViewDataSource addObject:spaceCellProperty];//间隙
//    }
//    [self requestPoructRecommendwithPage:productPage];
//    
}

- (LOLHomeCellProperty *) createCellPropertyWithType:(LOLHomeCellStyle) cellType{
    LOLHomeCellProperty *productCell = [[LOLHomeCellProperty alloc] init];
    productCell.cellType = cellType;
    return productCell;
}
//-(void)aaa
//{
//    dddViewController *vv = [[dddViewController alloc] init];
//    //[SharedDelegate.lcNavigationController pushViewController:vv animated:YES];
//    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    
//    [[appdelegate getRootNav] pushViewController:vv animated:YES];
//}
-(void)setupCustomNavBar
{
//    UIView *topView =  [[UIView alloc] initWithFrame:CGRectMake(0,IsIOS7 ? 20 : 0, self.view.width,44.)];
////    [topView addSubview:l_view_search];
////    [topView addSubview:l_view_leftBar];
////    [topView addSubview:rightButton];
//    self.titleView.backgroundColor = [UIColor colorWithRed:1.0/255.0 green:147.0/255.0 blue:232.0/255.0 alpha:0.0];
//    [self.titleView addSubview:topView];
}

#pragma mark - 构建广告滚动视图
- (void)reloadBannerView
{
    if ([self.bannerArray count]>1) {
        id firstObj = [self.bannerArray firstObject];
        id lastObj = [self.bannerArray lastObject];
        [self.bannerArray insertObject:lastObj atIndex:0];
        [self.bannerArray addObject:firstObj];
    }
    
    [_bannerView reloadData:self.bannerArray];
    
    
}

-(void)pushMenuVC:(NSInteger)sender
{
    if (sender == 1000) {
        NSLog(@" --push-1000");
    }
    else if (sender == 1001) {
          LOLGodcertificationVC *godVC = [[LOLGodcertificationVC alloc] init];
        NSLog(@"--push-1001");
        [SharedDelegate.rootNavVC pushViewController:godVC animated:YES];

    }else if(sender == 1002){
        NSLog(@"--push-1002");
 
    }else if(sender == 1003){
       NSLog(@"--push--1003");
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LOLHomeCellProperty *cellProperty = _tableViewDataSource[indexPath.row];
    if(cellProperty.cellType == LOLHomeCellStyleFloorThree) {
    NSLog(@"-大神List-cellClicked--%ld",(long)indexPath.row);
    }
}

-(void)pushGodVC:(NSInteger)sender
{
    NSLog(@"--sender.tag-- %ld",(long)sender);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
