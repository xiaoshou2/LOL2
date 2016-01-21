//
//  LOLForgetPasswordFirVC.h
//  LOL
//
//  Created by feibai on 16/1/20.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"

@interface LOLForgetPasswordFirVC : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    int timeComnt;
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UILabel *phoneLb;
@property (nonatomic,strong)UITextField *phoneTf;
@end
