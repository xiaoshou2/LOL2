//
//  LOLShowGirlsViewContorller.m
//  LOL
//
//  Created by feibai on 16/1/7.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLShowGirlsViewContorller.h"
#import "LOLGirlsCollectionViewCell.h"
#import "MJRefresh.h"
#import "LOLGirlsDetailsViewController.h"

@interface LOLShowGirlsViewContorller ()

@end
CGFloat  girlNormalHeight = 50.0f;
@implementation LOLShowGirlsViewContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"妹子秀";
    self.backButton.hidden = YES;
    self.tableViewDataSource = [NSMutableArray new];
    [self requestData];
    [self control];
    
}

-(void)requestData
{
    [self showHUD];
    //请求数据
    [LOLAFNetWorkUtility  showGirlBlockRequestWithParms:@{} successBlock:^(id responseObject) {
        //NSLog(@"--- LOL首页请求成功 --%@--",responseObject);
        [self hideHUD];
        //请求完加载数据
       
        self.tableViewDataSource = responseObject;
        
        NSLog(@"--数组--  %@ ---,",self.tableViewDataSource);
        [self.mainCollectionView reloadData];
      
        //_isLoadFinish = YES;
       // NSLog(@"图片 ---  %@",self.bannerArray);
       
        
        
    } failedBlock:^(NSError *error) {
        //        [self.commmentView.header endRefreshing  ];
        [self hideHUD];
        NSLog(@"---  LOL请求失败 ----");
        [self showErrorHUDWithMessage:@"当前网络没有链接"];
        
    } ];


}
- (void)control
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((ScreenWidth-20)/2,(ScreenWidth-20)/2);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 00, 0);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    
    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight - (64+44))collectionViewLayout:layout];
    ///////----------背景颜色
   // self.mainCollectionView.backgroundColor = [UIColor orangeColor];

    //self.mainCollectionView.de
     self.mainCollectionView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    self.mainCollectionView.alwaysBounceVertical = YES;
    self.mainCollectionView.delegate=self;
    self.mainCollectionView.dataSource =self;
    [self.view addSubview:self.mainCollectionView];
    [self.mainCollectionView registerClass:[LOLGirlsCollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    
    // 2.集成刷新控件
    [self addHeader];
    
    [self addFooter];
  }
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tableViewDataSource.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * CellIdentifier = @"GradientCell";
    LOLGirlsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setDataModel:self.tableViewDataSource[indexPath.row]];
    
   // cell.layer.borderWidth = 0.5;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth-20)/2,((ScreenWidth-20)/2)+100);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5,5,10,5);
}
#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了 --- %ld  ---",(long)indexPath.row);
    
    LOLGirlsDetailsViewController  * DetailVC = [[LOLGirlsDetailsViewController alloc]init];
    [[SharedDelegate getRootNav] pushViewController:DetailVC animated:YES];
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark 添加控件
// 2.集成刷新控件
-(void)addHeader{
    __unsafe_unretained typeof(self) weakSelf = self;
    // 添加下拉刷新头部控件
    
    self.mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.mainCollectionView reloadData];
            
//            page =1;
//            [weakSelf getHttpData:nil];
            
            
            // 结束刷新
            [weakSelf.mainCollectionView.mj_header endRefreshing];
        });
    }];

}
-(void)addFooter{
    
    __unsafe_unretained typeof(self) weakSelf = self;
    self.mainCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 增加5条假数据
        
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.mainCollectionView reloadData];
            
            // 结束刷新
            // weakSelf.mainCollectionView.footer.hidden = YES;
//            [weakSelf getHttpData:nil];
            [weakSelf.mainCollectionView.mj_footer endRefreshing];
        });
    }];
   

    // 默认先隐藏footer
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.dragging) {
        
        if((scrollView.contentOffset.y - _beginOffsetY)>10.0f) {    //向上拖拽
            if (!_hideTopView) {
                [self hideTopView];
                //向下
                //CATransition *animation = [CATransition animation];
                
                //animation.type = kCATransitionMoveIn;
                // animation.duration = 1.0f;
                //  [self.upMenuView.layer addAnimation:animation forKey:nil];
                //  self.upMenuView.hidden = YES;
                
            }
            
        } else if ((scrollView.contentOffset.y - _beginOffsetY)<-10.0f) {     //向下拖拽
            if (_hideTopView) {
                [self showTopView];
                
            }
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    CGFloat translationHeight = topHeight+girlNormalHeight;
    [UIView animateWithDuration:0.2 animations:^{
        [self.titleView setTransform:CGAffineTransformMakeTranslation(0,-translationHeight)];
        [self.mainCollectionView setTransform:CGAffineTransformMakeTranslation(0, -translationHeight)];
        CGRect frame = self.mainCollectionView.frame;
        frame.origin.y = 0;
        frame.size.height += translationHeight;
        self.mainCollectionView.frame = frame;
        
    } completion:^(BOOL finished) {
        _hideOrShowTopViewProgress = NO;
        _hideTopView = YES;
        NSLog(@"  ---  隐藏 --");
    }];
}

#pragma mark  <显示头部View>

- (void)showTopView{
    if (_hideOrShowTopViewProgress)  return;
    
    _hideOrShowTopViewProgress = YES;
        if (ISIOS7) {
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        }
    
    CGFloat translationHeight = topHeight+girlNormalHeight;
    [UIView animateWithDuration:0.2 animations:^{
        [self.titleView setTransform:CGAffineTransformIdentity];
        [self.mainCollectionView setTransform:CGAffineTransformIdentity];
        CGRect frame = self.mainCollectionView.frame;
        frame.origin.y = translationHeight;
        frame.size.height -= translationHeight;
        self.mainCollectionView.frame = frame;
        
    } completion:^(BOOL finished) {
        _hideOrShowTopViewProgress = NO;
        _hideTopView = NO;
    }];
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _beginOffsetY = scrollView.contentOffset.y;
}


@end
