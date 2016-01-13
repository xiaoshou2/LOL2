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
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableViewDataSource;
@property (nonatomic,strong) NSMutableArray *bannerArray;
@property (nonatomic,strong) NSMutableArray *bigGodArr;
@property (nonatomic,strong) NSMutableArray *bigGodListArr;

@end
