//
//  LOLHomeViewController.h
//  LOL
//
//  Created by feibai on 16/1/6.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"
#import "YWFocusImageView.h"
@interface LOLHomeViewController : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate,YWFocusImageViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableViewDataSource;
@property (nonatomic,strong)  YWFocusImageView *bannerView;
@property (nonatomic,strong) NSMutableArray *bannerArray;

@end
