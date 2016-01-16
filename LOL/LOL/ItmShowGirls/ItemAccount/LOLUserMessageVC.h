//
//  LOLUserMessageVC.h
//  LOL
//
//  Created by feibai on 16/1/15.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOLUserMessageVC : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *tableViewDataSource;
@property (nonatomic,strong)UIButton *exitBtn;
@end
