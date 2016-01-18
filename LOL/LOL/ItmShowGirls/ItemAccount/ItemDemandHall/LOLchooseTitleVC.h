//
//  LOLchooseTitleVC.h
//  LOL
//
//  Created by feibai on 16/1/17.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"

@interface LOLchooseTitleVC : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger  currentIndex;
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSuroceArr;

@end
