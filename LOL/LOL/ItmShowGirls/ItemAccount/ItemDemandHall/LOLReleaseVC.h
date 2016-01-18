//
//  LOLReleaseVC.h
//  LOL
//
//  Created by feibai on 16/1/16.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLBaseViewController.h"
@interface LOLReleaseVC : LOLBaseViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    NSInteger res;
    UILabel *numLb;
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSString *titleStr;
@property (nonatomic,strong)UITextView *textView;
@property (nonatomic,strong)UILabel *placeholderLabel;
@property (nonatomic,strong)UITextField *dayTf;
@property (nonatomic,strong)UITextField *payMoneTf;
@property (nonatomic,strong)UITextField *getMoneyTf;
@property (nonatomic,strong)UILabel *phoneLb;
@property (nonatomic,strong)UILabel *qqLb;
@property (nonatomic,strong)UILabel *weixinLb;
@property (nonatomic,strong)UILabel *titleContentLb;



@end
