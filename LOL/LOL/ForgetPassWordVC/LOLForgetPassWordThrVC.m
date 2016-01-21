//
//  LOLForgetPassWordThrVC.m
//  LOL
//
//  Created by feibai on 16/1/20.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLForgetPassWordThrVC.h"
#import "LOLHomeViewController.h"

@implementation LOLForgetPassWordThrVC


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"重置密码3/3";
    [self setupMainView];
}

-(void)setupMainView
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight - (64)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:235/255.0 blue:232/255.0 alpha:1];
    [self.view addSubview:self.tableView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 45)];
        [cell addSubview:bottomView];
        bottomView.backgroundColor = [UIColor whiteColor];
        
        self.phoneLb = [[UILabel alloc] init];
        self.phoneLb.frame = CGRectMake(20,bottomView.height/2-10,60, 20);
        self.phoneLb.text = @"新密码";
        self.phoneLb.backgroundColor = [UIColor clearColor];
        self.phoneLb.font = SYSTEMFONT(13);
        [bottomView addSubview:self.phoneLb];
        
        
        self.phoneTf = [[UITextField alloc] init];
        self.phoneTf.frame = CGRectMake(30+_phoneLb.width,0,180,bottomView.height);
        self.phoneTf.font = SYSTEMFONT(13);
        self.phoneTf.backgroundColor = [UIColor clearColor];
        self.phoneTf.keyboardType = UIKeyboardTypeDefault;
        self.phoneTf.clearButtonMode = UITextFieldViewModeAlways;
        [self.phoneTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
        self.phoneTf.tag = 1001;
        self.phoneTf.placeholder = @"6-15位字母,数字和符号";
        
        //----键盘上添加按钮
        UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
        [topView setBarStyle:UIBarStyleBlackTranslucent];
        
        UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(2, 5, 50, 25);
        [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"yw_load1"] forState:UIControlStateNormal];
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
        NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
        [topView setItems:buttonsArray];
        [self.phoneTf setInputAccessoryView:topView];
        
        [bottomView addSubview:self.phoneTf];
        
        
        UIButton *registerBtn = [UIButton buttonWithFrame:CGRectMake(15, 90, SCREEN_WIDTH-30,40) title:@"重置" backgroundImage:IMAGENAMED(@"pay_btn_orange_on")];
        [registerBtn addTarget:self action:@selector(registerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:registerBtn];
        
        
    }
    
    return cell;
}

-(void)registerBtnClicked
{
    if (self.phoneTf.text.length == 0) {
        UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alterView show];
    }else if (self.phoneTf.text.length<6) {
        UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"密码长度不能小于6位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alterView show];
    }else {
        //重置密码接口调用
        //请求数据
        [self showHUD];
        [LOLAFNetWorkUtility  resetPassWordRequestWithParms:@{} successBlock:^(id responseObject) {
            
            //登录接口调用
            [LOLAFNetWorkUtility  loginRequestWithParms:@{} successBlock:^(id responseObject) {
                [self hideHUD];
                [self.phoneTf resignFirstResponder];
                [SharedDelegate setupViewControllers];
                
            } failedBlock:^(NSError *error) {
                //        [self.commmentView.header endRefreshing  ];
                [self hideHUD];
                NSLog(@"---  LOL请求失败 ----");
                [self showErrorHUDWithMessage:@"当前网络没有链接"];
                
            } ];
            
            
            [self.phoneTf resignFirstResponder];
            [SharedDelegate setupViewControllers];
            
        } failedBlock:^(NSError *error) {
            //        [self.commmentView.header endRefreshing  ];
            [self hideHUD];
            NSLog(@"---  LOL请求失败 ----");
            [self showErrorHUDWithMessage:@"当前网络没有链接"];
            
        } ];
        
        
    }
}
-(void)viewClicked
{
    if (self.phoneTf) {
        [self.phoneTf resignFirstResponder];
        
    }
}

-(void)dismissKeyBoard
{
    if (self.phoneTf) {
        [self.phoneTf resignFirstResponder];
    }
    
}

-(void)limit_usemame_tf:(UITextField *)sender
{
    if ([sender.text isEqualToString:@"\n"]) {
        [sender resignFirstResponder];
    }
    bool isChinese;//判断当前输入法是否是中文
    
    UITextInputMode *currentInputMode = sender.textInputMode;
    if ([[currentInputMode primaryLanguage] isEqualToString: @"en-US"])
    {
        isChinese = false;
        
    }else
    {
        isChinese = true;
        
    }
    
    if(sender.tag == 1001){
        
        
        // 8位
        NSString *str = [[sender text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [sender markedTextRange];
            //获取高亮部分
            UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                
                if ( str.length>=16) {
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:15]];
                    
                }
            }
        }else{
            if ([str length]>=16){
                NSString *strNew = [NSString stringWithString:str];
                [sender setText:[strNew substringToIndex:15]];
                
                
            }
        }
    }
}
@end