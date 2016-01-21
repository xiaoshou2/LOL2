//
//  LOLRegisterSecVC.h
//  LOL
//
//  Created by feibai on 16/1/20.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"

@interface LOLRegisterSecVC : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    int timeCount;
     NSTimer*timer;
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UILabel *phoneLb;
@property (nonatomic,strong)UITextField *phoneTf;
@property (nonatomic,strong)NSString *phoneNum;
@property (nonatomic,strong)UILabel *tipLabel;
@property (nonatomic,strong)UIButton *huoquBtn;
@end
