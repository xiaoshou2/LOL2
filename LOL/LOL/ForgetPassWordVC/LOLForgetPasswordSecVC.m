//
//  LOLForgetPasswordSecVC.m
//  LOL
//
//  Created by feibai on 16/1/20.
//  Copyright © 2016年 feibai. All rights reserved.
//
#import <SMS_SDK/SMSSDK.h>
#import "LOLForgetPasswordSecVC.h"
#import "LOLForgetPassWordThrVC.h"
@implementation LOLForgetPasswordSecVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"重置密码2/3";
    [self setupMainView];
}

-(void)setupMainView
{
    [self readSecond];
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
        
        UILabel *titlePhoneNumLb = [[UILabel alloc] initWithFrame:CGRectMake(20,15,SCREEN_WIDTH,40)];
        titlePhoneNumLb.backgroundColor = [UIColor clearColor];
        titlePhoneNumLb.text = [NSString stringWithFormat:@"验证码已经发送至:%@",self.phoneNum];
        titlePhoneNumLb.textColor = [UIColor colorWithHex:@"#999999"];
        titlePhoneNumLb.font = SYSTEMFONT(13);
        [cell addSubview:titlePhoneNumLb];
        
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 45)];
        [cell addSubview:bottomView];
        bottomView.backgroundColor = [UIColor whiteColor];
        
        
        
        self.phoneLb = [[UILabel alloc] init];
        self.phoneLb.frame = CGRectMake(20,bottomView.height/2-10,55, 20);
        self.phoneLb.text = @"验证码";
        self.phoneLb.backgroundColor = [UIColor clearColor];
        self.phoneLb.font = SYSTEMFONT(13);
        [bottomView addSubview:self.phoneLb];
        
        
        self.phoneTf = [[UITextField alloc] init];
        self.phoneTf.frame = CGRectMake(30+_phoneLb.width,0,180,bottomView.height);
        self.phoneTf.font = SYSTEMFONT(13);
        self.phoneTf.backgroundColor = [UIColor clearColor];
        self.phoneTf.keyboardType = UIKeyboardTypeNumberPad;
        self.phoneTf.clearButtonMode = UITextFieldViewModeAlways;
        [self.phoneTf addTarget:self action:@selector(limit_usemame_tf:) forControlEvents:UIControlEventEditingChanged];
        self.phoneTf.tag = 1001;
        self.phoneTf.placeholder = @"4位数字";
        
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
        
        
        UIButton *registerBtn = [UIButton buttonWithFrame:CGRectMake(15, 125, SCREEN_WIDTH-30,40) title:@"下一步，设置新密码" backgroundImage:IMAGENAMED(@"pay_btn_orange_on")];
        [registerBtn addTarget:self action:@selector(pushRegisterVC) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:registerBtn];
        
        
        _huoquBtn =[UIButton addBtnImage:nil AndFrame:CGRectMake(195*Width,bottomView.height/2-10, 95*Width, 20*Height) WithTarget:self action:@selector(registYanZheng)];
        _huoquBtn.backgroundColor = [UIColor redColor];
        [_huoquBtn setBackgroundImage:[UIImage imageNamed:@"register_huoqu"] forState:UIControlStateNormal];
        [_huoquBtn setTitle:@"重发验证码" forState:UIControlStateNormal];
        [_huoquBtn setTitleColor:whitesColor forState:UIControlStateNormal];
        _huoquBtn.titleLabel.font =[UIFont systemFontOfSize:12*Width weight:1];
        _huoquBtn.hidden = YES;
        [bottomView addSubview:_huoquBtn];
        
        //验证提交之后的跑秒提示防止用户的重复提交数据有效时间60秒
        timeCount = 60;
        _tipLabel=[[UILabel alloc ]initWithFrame:CGRectMake(195*Width,bottomView.height/2-10, 95*Width, 20*Height)];
        _tipLabel.textAlignment=NSTextAlignmentCenter;
        _tipLabel.text=[[NSString alloc]initWithFormat:@"%ds",timeCount];
        _tipLabel.textColor=[UIColor whiteColor];
        _tipLabel.layer.cornerRadius=3;
        _tipLabel.clipsToBounds=YES;
        _tipLabel.backgroundColor=[UIColor lightGrayColor];
        _tipLabel.hidden = NO;
        _tipLabel.font=[UIFont systemFontOfSize:14];
        [bottomView addSubview:_tipLabel];
        
    }
    
    return cell;
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
        
    }
    else
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
                
                if ( str.length>=5) {
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:4]];
                    
                }
            }
        }else{
            if ([str length]>=5){
                NSString *strNew = [NSString stringWithString:str];
                [sender setText:[strNew substringToIndex:4]];
                
                
            }
        }
    }
}


-(void)pushRegisterVC
{
    // 没有被注册可以注册
    [SMSSDK commitVerificationCode:self.phoneTf.text phoneNumber:self.phoneNum zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
            LOLForgetPassWordThrVC *forgetThree = [[LOLForgetPassWordThrVC alloc] init];
            forgetThree.loadType = YWBasePresentType;
            [self presentViewController:forgetThree animated:YES completion:nil];
            
            
        }else
        {
            
            NSLog(@"错误信息：%@",[error.userInfo objectForKey:@"commitVerificationCode"]);
            //已经注册过弹出提示
            UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"验证失败，请重新输入"  delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
            
        }
    }];
    
    
    
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


#pragma mark-->读秒开始
-(void)readSecond{
    _huoquBtn.hidden=YES;
    
    _tipLabel.hidden=NO;
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dealTimer) userInfo:nil repeats:YES];
    timer.fireDate=[NSDate distantPast];
}

#pragma mark-->跑秒操作
-(void)dealTimer{
    NSString *tiemNum = [NSString stringWithFormat:@"%d",timeCount];
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:FORGETCOUNT object:self userInfo:@{@"forgetcount":tiemNum}];
    
    _tipLabel.text=[[NSString alloc]initWithFormat:@"%ds后可重发",timeCount];
    timeCount=timeCount - 1;
    if(timeCount== 0){
        timer.fireDate=[NSDate distantFuture];
        timeCount= 60;
        _tipLabel.hidden=YES;
        _huoquBtn.hidden=NO;
    }
    
}


//验证码
-(void)registYanZheng
{
    if (self.phoneNum.length!=0) {
        
#pragma MARK -- ShareSDK 发送验证码
        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNum zone:@"86" customIdentifier:nil result:^(NSError *error) {
            
            if (!error) {
                
                NSLog(@"获取验证码成功");
                [self readSecond];
                
            }
            else
            {
                NSLog(@"错误信息：%@",error);
                [self readSecond];
                UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"发送失败，请稍后重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alterView show];
                
                
            }
        }];
        
    }
    
}


@end
