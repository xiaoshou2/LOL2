//
//  LOLHomeViewController.h
//  LOL
//
//  Created by feibai on 16/1/6.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"
#import "SDCycleScrollView.h"
@interface LOLHomeViewController : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
    CGFloat _beginOffsetY; //开始拖动的位置
    BOOL _hideOrShowTopViewProgress; //隐藏或显示顶部view的进度
    BOOL _hideTopView; //顶部view是否隐藏
    BOOL _isLoadFinish;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableViewDataSource;
@property (nonatomic,strong) NSMutableArray *bannerArray;
@property (nonatomic,strong) NSMutableArray *bigGodArr;
@property (nonatomic,strong) NSMutableArray *bigGodListArr;
@property (nonatomic, strong) UIView *TopView;


@end
