//
//  LOLDemandHallVC.m
//  LOL
//
//  Created by feibai on 16/1/13.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLDemandHallVC.h"
#import "MJRefresh.h"

CGFloat  ProductFilterNormalHeight = 50.0f;
@implementation LOLDemandHallVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"需求大厅";
    self.backButton.hidden = YES;
    [self requestData];
    [self setupMainView];
    self.tableViewDataSource = [NSMutableArray new];
    [self refreshData];

}

-(void)refreshData
{
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        // 进入刷新状态后会自动调用这个block
//    }];
//    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //__unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    
    // 马上进入刷新状态
   // [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadMoreData
{
    [self requestData];
    
    // 刷新表格
    [self.tableView reloadData];
    
    // 拿到当前的下拉刷新控件，结束刷新状态
    [self.tableView.mj_footer endRefreshing];
    self.tableView.mj_footer.hidden = YES;
}
-(void)requestData
{
    
    [self showHUD];
    //请求数据
    [LOLAFNetWorkUtility  demandRequestWithParms:@{} successBlock:^(id responseObject) {
        NSLog(@"-hahahahaha--  LOL请求成功 --%@--",responseObject);
        [self hideHUD];
        //请求完加载数据
        self.tableViewDataSource = responseObject;
        
        [self.tableView reloadData];
        
      
        
    } failedBlock:^(NSError *error) {
        //        [self.commmentView.header endRefreshing  ];
        [self hideHUD];
        [self.tableView.mj_footer endRefreshing];
        
        NSLog(@"---  LOL请求失败 ----");
    } ];
}
-(void)setupMainView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight - (64+44)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableViewDataSource count];
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LOLDemandModel *model = self.tableViewDataSource[indexPath.row];
    static NSString *CellWithIdentifier = @"Cell";
    DemandCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[DemandCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
    }
   [cell.muserHeadImageView sd_setImageWithURL:[NSURL URLWithString:model.mhearAdress] placeholderImage:[UIImage imageNamed:@"yw_load7"]];
    cell.muserNameLb.text = model.muserName;
    cell.mreleaseTimeLb.text = [NSString stringWithFormat:@"发布于:%@",model.mreleaseTime];
    cell.mcontentLb.text = model.mcontent;
    float height = [self heightForCellWithData:model];
    
    NSLog(@"--每个cell的高度--%f",height);
    
    cell.mpriceLb.text = [NSString stringWithFormat:@"酬劳:￥%@元",model.mprice];
    [cell resetFrame:height];
    cell.mendTimeLb.text = model.mendtime;
    
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor orangeColor];
    }else if(indexPath.row == 1)
    {
        cell.backgroundColor = [UIColor brownColor];
    }else if(indexPath.row == 2)
    {
        cell.backgroundColor = [UIColor redColor];
    }else if(indexPath.row == 3){
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LOLDemandModel *data = self.tableViewDataSource[indexPath.row];
    float height = [self heightForCellWithData:data];
    
    NSLog(@" -----当前cell高度 %f ",200+height);
    
    return 185+height;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat )heightForCellWithData:(LOLDemandModel *)data{
        if (data.mcontent) {
            NSString *str = data.mcontent;
            CGFloat height = [LOLStringUtility getStringHight:str font:SYSTEMFONT(14) width:ScreenWidth-45];
            return height;
        }
    return 50;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.dragging) {
        if((scrollView.contentOffset.y - _beginOffsetY)>10.0f) {    //向上拖拽
            if (!_hideTopView) {
                [self hideTopView];
            }
            
        } else if ((scrollView.contentOffset.y - _beginOffsetY)<-10.0f) {     //向下拖拽
            if (_hideTopView) {
                [self showTopView];
            }
        }
    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _beginOffsetY = scrollView.contentOffset.y;
}


#pragma mark  <隐藏头部View>

- (void)hideTopView{
    if (_hideOrShowTopViewProgress) {
        return;
    }
    _hideOrShowTopViewProgress = YES;
//    if (ISIOS7) {
//        [[UIApplication sharedApplication]setStatusBarHidden:YES];
//    }
    
    CGFloat translationHeight = topHeight+ProductFilterNormalHeight;
    [UIView animateWithDuration:0.2 animations:^{
        [self.titleView setTransform:CGAffineTransformMakeTranslation(0,-translationHeight)];
        [self.tableView setTransform:CGAffineTransformMakeTranslation(0, -translationHeight)];
        CGRect frame = self.tableView.frame;
        frame.origin.y = 0;
        frame.size.height += translationHeight;
        self.tableView.frame = frame;
        
    } completion:^(BOOL finished) {
        _hideOrShowTopViewProgress = NO;
        _hideTopView = YES;
    }];
}

#pragma mark  <显示头部View>

- (void)showTopView{
    if (_hideOrShowTopViewProgress)  return;
    
    _hideOrShowTopViewProgress = YES;
//    if (ISIOS7) {
//        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
//    }
    
    CGFloat translationHeight = topHeight+ProductFilterNormalHeight;
    [UIView animateWithDuration:0.2 animations:^{
        [self.titleView setTransform:CGAffineTransformIdentity];
        [self.tableView setTransform:CGAffineTransformIdentity];
        CGRect frame = self.tableView.frame;
        frame.origin.y = translationHeight;
        frame.size.height -= translationHeight;
        self.tableView.frame = frame;
        
    } completion:^(BOOL finished) {
        _hideOrShowTopViewProgress = NO;
        _hideTopView = NO;
    }];
    
}


@end
