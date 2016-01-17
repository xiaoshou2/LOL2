//
//  LOLHomeViewController.m
//  LOL
//
//  Created by feibai on 16/1/6.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLHomeViewController.h"
#import "LOLHomeCellProperty.h"
#import "LOLHomeMenuCell.h"
#import "LOLSpaceCell.h"
#import "LOLBigGogCell.h"
#import "MJRefresh.h"
#import "LOLSpaceSecCell.h"
#import "LOLBigGodListCell.h"
#import "LOLGodcertificationVC.h"
#import "LOLReleaseVC.h"
@interface LOLHomeViewController ()
{
    SDCycleScrollView *cycleScrollView2;
}
@end

@implementation LOLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"首页";
    self.tableView.hidden = YES;
    self.backButton.hidden = YES;

    [self initDataArr];
    //请求数据
    [self requestData];
    [self setupCustomNavBar];
    [self setupMainView];
    [self setupRefreshUI];
    
  

}
-(void)initDataArr
{
    _tableViewDataSource = [NSMutableArray array];
    self.bigGodArr       = [NSMutableArray array];
    self.bannerArray     = [NSMutableArray array];
    self.bigGodListArr   = [NSMutableArray array];
}

-(void)requestData
{
    [self showHUD];
    //请求数据
    [LOLAFNetWorkUtility  homeViewRequestWithParms:@{} successBlock:^(id responseObject) {
      //NSLog(@"--- LOL首页请求成功 --%@--",responseObject);
        self.bigGodArr = responseObject;
        LOLBigGodModel *model = self.bigGodArr[0];
        self.bannerArray = model.bannerArr;
        self.bigGodListArr = responseObject;
        [self hideHUD];
        //请求完加载数据
        [self loadDataSource];
        NSLog(@"图片 ---  %@",self.bannerArray);
      //--- 模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         cycleScrollView2.imageURLStringsGroup = self.bannerArray;
        });
        
        
    } failedBlock:^(NSError *error) {
        //        [self.commmentView.header endRefreshing  ];
        [self hideHUD];
        NSLog(@"---  LOL请求失败 ----");
        [self showErrorHUDWithMessage:@"当前网络没有链接"];
        
    } ];
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
    
//    BOOL isUpPullRefresh = self.tableView.contentOffset.y >= 0;
    
    [self requestData];
   
    // 刷新表格
    [self.tableView reloadData];
    
    // 拿到当前的下拉刷新控件，结束刷新状态
    [self.tableView.mj_header endRefreshing];
    
    // 判断是不是上拉刷新
  //  NSInteger page = isUpPullRefresh ? self.currentPage : 1;
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
    UIScrollView *demoContainerView = [[UIScrollView alloc] init];
    demoContainerView.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth * 300 / 750);
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    self.tableView.tableHeaderView = demoContainerView;
    
    CGFloat w = self.view.bounds.size.width;
    // 网络加载 --- 创建带标题的图片轮播器
    cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, demoContainerView.height) delegate:self placeholderImage:[UIImage imageNamed:@"yw_home_default_btn"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.autoScrollTimeInterval = 2.0;
    cycleScrollView2.imageURLStringsGroup = self.bannerArray;
    //cycleScrollView2.backgroundColor = [UIColor redColor];
    // cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.delegate = self;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [demoContainerView addSubview:cycleScrollView2];
    

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
             cell.backgroundColor = [UIColor clearColor];
           // cell.backgroundColor = [UIColor grayColor];
           // cell.menuArray = cellProperty.cellData;
              
            return cell;
        }
            break;
        case LOLHomeCellStyleSpaceOne:{

            LOLSpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLSpaceCell"];
              //cell.backgroundColor = [UIColor purpleColor];
              cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
       case LOLHomeCellStyleFloorTwo:{

            LOLBigGogCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLBigGogCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.godClickedBk = ^(NSString *sender) {
                  [self pushGodVC:sender];
              };
           cell.modelArr = self.bigGodArr;
           
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
              break;
        case LOLHomeCellStyleSpaceSec:{
              LOLSpaceSecCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLSpaceSecCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
           // cell.backgroundColor = [UIColor redColor];

              return cell;
          }break;
          case LOLHomeCellStyleFloorThree:{
              
              LOLBigGodListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOLBigGodListCell"];
              cell.selectionStyle = UITableViewCellSelectionStyleNone;
              
              cell.cellModel = cellProperty.bigGodModel;
     
              cell.backgroundColor = [UIColor clearColor];

              //cell.backgroundColor = [UIColor grayColor];
              
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
    if (_tableViewDataSource.count > 0) {
        [_tableViewDataSource removeAllObjects];
      //  productPage = 1;
    }
    LOLHomeCellProperty *menuCellProperty = [self createCellPropertyWithType:LOLHomeCellStyleFloorOne];
   // menuCellProperty.cellData = self.menuViewModel.menuSource;
    [_tableViewDataSource addObject:menuCellProperty];// 菜单
    
    LOLHomeCellProperty *spaceCellProperty = [self createCellPropertyWithType:LOLHomeCellStyleSpaceOne];
    [_tableViewDataSource addObject:spaceCellProperty];//间隙
    
    LOLHomeCellProperty *bigGogCell = [self createCellPropertyWithType:LOLHomeCellStyleFloorTwo];
    [_tableViewDataSource addObject:bigGogCell];//大神秀
    
    LOLHomeCellProperty *spaceCellSec = [self createCellPropertyWithType:LOLHomeCellStyleSpaceSec];
    [_tableViewDataSource addObject:spaceCellSec];//间隙2

    for (int i; i< self.bigGodListArr.count; i++) {//大神list
        LOLHomeCellProperty *bigGodList = [self createCellPropertyWithType:LOLHomeCellStyleFloorThree];
        bigGodList.bigGodModel = self.bigGodListArr[i];
        [_tableViewDataSource addObject:bigGodList];
    }
  
    
    [self.tableView reloadData];
    
}

- (LOLHomeCellProperty *) createCellPropertyWithType:(LOLHomeCellStyle) cellType{
    LOLHomeCellProperty *productCell = [[LOLHomeCellProperty alloc] init];
    productCell.cellType = cellType;
    return productCell;
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



-(void)pushMenuVC:(NSInteger)sender
{
    if (sender == 1000) {
        NSLog(@" --push-1000");
        [self showHUD];
        [LOLAFNetWorkUtility  homeViewRequestWithParms:@{} successBlock:^(id responseObject) {
            NSLog(@"-hahahahaha--  LOL请求成功 ----");
            [self hideHUD];
            
        } failedBlock:^(NSError *error) {
            //        [self.commmentView.header endRefreshing  ];
            [self hideHUD];
            NSLog(@"---  LOL请求失败 ----");
        } ];
        
    }
    else if (sender == 1001) {
          LOLGodcertificationVC *godVC = [[LOLGodcertificationVC alloc] init];
        NSLog(@"--push-1001");
        [SharedDelegate.rootNavVC pushViewController:godVC animated:YES];

    }else if(sender == 1002){
        NSLog(@"--push-1002");
 
    }else if(sender == 1003){
       NSLog(@"--push--1003");
        LOLReleaseVC *releaseVC = [[LOLReleaseVC alloc] init];
        [[SharedDelegate getRootNav] pushViewController:releaseVC animated:YES];
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LOLHomeCellProperty *cellProperty = _tableViewDataSource[indexPath.row];
    if(cellProperty.cellType == LOLHomeCellStyleFloorThree) {
       LOLBigGodModel *selectModel = cellProperty.bigGodModel;
        
    NSLog(@"-大神ID--%@",selectModel.mUserID);
    }
}


-(void)pushGodVC:(NSString *)sender
{
    NSLog(@"--大神的 ID-- %@",sender);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}


@end
