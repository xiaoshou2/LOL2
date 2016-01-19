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
#import "CategoryGoodsDetailsViewController.h"
@interface LOLShowGirlsViewContorller ()

@end

@implementation LOLShowGirlsViewContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ShowGirls";
    self.backButton.hidden = YES;
    
    [self control];
    
}


- (void)control
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake((ScreenWidth-20)/2,(ScreenWidth-20)/2);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 00, 0);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    
    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, (IsIOS7 ? 64 : 44), ScreenWidth, ScreenHeight - (IsIOS7 ? 64 : 44)-49)collectionViewLayout:layout];
    ///////----------背景颜色
    self.mainCollectionView.backgroundColor = [UIColor orangeColor];

    //self.mainCollectionView.de
    self.mainCollectionView.alwaysBounceVertical = YES;
    self.mainCollectionView.delegate=self;
    self.mainCollectionView.dataSource =self;
    [self.mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    [self.view addSubview:self.mainCollectionView];
    
    // 2.集成刷新控件
    [self addHeader];
    
    [self addFooter];
  }
#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LOLGirlsCollectionViewCell * cell = [LOLGirlsCollectionViewCell cellWithTableView:collectionView a:indexPath];
    
    
    if (cell) {
        
        while ([cell.contentView.subviews lastObject]!=nil) {
            [(UIView *)[cell.contentView.subviews lastObject]removeFromSuperview];
        }
        /*
         图片
         */
        
//        LOLshowModel * model = [_dataArray objectAtIndex:indexPath.row];
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5,(ScreenWidth-20)/2-10,(ScreenWidth-20)/2+20)];
        imageview.backgroundColor= [UIColor whiteColor];
        imageview.image = [UIImage imageNamed:@"占"];

//        imageview.layer.borderColor=[UIColor lightGrayColor].CGColor;
//        imageview.layer.borderWidth=0.5;
//        [imageview setImageWithURL:[NSURL URLWithString:model.default_image] placeholderImage:[UIImage imageNamed:@"占位图"]];
        [cell.contentView addSubview:imageview];
        
        UILabel * textlabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(imageview.frame)+5, (ScreenWidth-20)/2,20)];
        textlabel.numberOfLines = 2;
        textlabel.text = @"服务器：比尔吉沃特";
        textlabel.font = [UIFont systemFontOfSize:12];
        textlabel.textColor = RGBACOLOR(114, 114, 114, 1);
        textlabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:textlabel];

        UILabel * pircelabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(textlabel.frame), (ScreenWidth-20)/4,20)];
        
        pircelabel.text = [NSString stringWithFormat:@"ID:皮小秀"];
        pircelabel.font = [UIFont systemFontOfSize:15];
        pircelabel.textColor = RGBACOLOR(228 ,155,58, 1);
        pircelabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:pircelabel];
        cell.backgroundColor= [UIColor whiteColor];
        
        UILabel *  gradelabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pircelabel.frame)+5, CGRectGetMaxY(textlabel.frame), (ScreenWidth-20)/4,20)];
        
        gradelabel.text = [NSString stringWithFormat:@"超凡大师"];
        gradelabel.font = [UIFont systemFontOfSize:10];
        gradelabel.textColor = [UIColor lightGrayColor];
        gradelabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:gradelabel];
        cell.backgroundColor= [UIColor whiteColor];
        
        

        UILabel * address = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(pircelabel.frame) ,(ScreenWidth-20)/2, 20)];
        
        address.text = @"简介：我的双手成就你的梦想";
        
        address.textColor = [UIColor lightGrayColor];
        address.font = [UIFont systemFontOfSize:10];
        [cell.contentView addSubview:address];
        
        
    }
    cell.layer.borderWidth = 0.5;
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
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    ///暂定界面
    
    
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
//    CategoryGoodsDetailsViewController  * DetailVC = [[CategoryGoodsDetailsViewController alloc]init];
//    [self.navigationController pushViewController:DetailVC animated:YES];
    
    
    
    
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
