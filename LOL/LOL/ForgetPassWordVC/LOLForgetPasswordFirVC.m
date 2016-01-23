//
//  LOLForgetPasswordFirVC.m
//  LOL
//
//  Created by feibai on 16/1/20.
//  Copyright © 2016年 feibai. All rights reserved.
//

#import "LOLForgetPasswordFirVC.h"
#import "LOLForgetPasswordSecVC.h"
#import <SMS_SDK/SMSSDK.h>
@implementation LOLForgetPasswordFirVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    
     self.title = @"重置密码1/3";
    [self setupMainView];
    ////创建通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeforgetCount:) name:FORGETCOUNT object:nil];
    
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
        self.phoneLb.text = @"手机号";
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
        self.phoneTf.placeholder = @"输入手机号";
        
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
        
        
        UIButton *registerBtn = [UIButton buttonWithFrame:CGRectMake(15, 90, SCREEN_WIDTH-30,40) title:@"下一步，验证手机号" backgroundImage:IMAGENAMED(@"myctrip_btn_login")];
        [registerBtn addTarget:self action:@selector(pushRegisterVC) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:registerBtn];
        
        
        
    }
    
    return cell;
}

-(void)pushRegisterVC
{
    
    
    if (self.phoneTf.text.length==0) {
        
        UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alterView show];
    }else if([self isValidateMobile:self.phoneTf.text]==NO){
        
        UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alterView show];
    }else{
        
        if (timeComnt<=1) {
            [self showHUD];
            
            //发送验证码
#pragma MARK -- ShareSDK 发送验证码
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTf.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
                
                if (!error) {
                    [self hideHUD];
                    NSLog(@"获取验证码成功");
                    //
                    LOLForgetPasswordSecVC *forget = [[LOLForgetPasswordSecVC alloc] init];
                    forget.loadType = YWBasePresentType;
                    forget.phoneNum = self.phoneTf.text;
                    [self presentViewController:forget animated:YES completion:nil];
                    
                }
                else
                {
                    [self hideHUD];
                    NSLog(@"错误信息：%@",error);
                    
                }
            }];

        }else{
            
            UIAlertView * alterView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"每隔60S才能获取一次验证码！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
        }
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
                
                if ( str.length>=12) {
                    NSString *strNew = [NSString stringWithString:str];
                    [sender setText:[strNew substringToIndex:11]];
                    
                }
            }
        }else{
            if ([str length]>=12){
                NSString *strNew = [NSString stringWithString:str];
                [sender setText:[strNew substringToIndex:11]];
                
                
            }
        }
    }
}

-(void)dismissKeyBoard
{
    if (self.phoneTf) {
        [self.phoneTf resignFirstResponder];
    }
    
}

/*手机号码验证 MODIFIED BY HELENSONG*/
-(BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

-(void)viewClicked
{
    if (self.phoneTf) {
        [self.phoneTf resignFirstResponder];
    }
}

-(void)changeforgetCount:(NSNotification*)obj
{
    timeComnt = (int)[[obj.userInfo objectForKey:@"forgetcount"] integerValue];
    NSLog(@"-时间-  %d  ---",timeComnt);
}
-(void)dealloc
{
    //移除
    [[NSNotificationCenter defaultCenter]removeObserver:self name:FORGETCOUNT object:nil];
}

@end